----------------------------------------------------------------------------
--	GPIO_Demo.vhd -- Nexys4DDR GPIO/UART Demonstration Project
----------------------------------------------------------------------------
-- Author:  Marshall Wingerson Adapted from Sam Bobrowicz
--          Copyright 2013 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--	The GPIO/UART Demo project demonstrates a simple usage of the Nexys4DDR's 
--  GPIO and UART. The behavior is as follows:
--
--	      *The 16 User LEDs are tied to the 16 User Switches. While the center
--			 User button is pressed, the LEDs are instead tied to GND
--	      *The 7-Segment display counts from 0 to 9 on each of its 8
--        digits. This count is reset when the center button is pressed.
--        Also, single anodes of the 7-Segment display are blanked by
--	       holding BTNU, BTNL, BTND, or BTNR. Holding the center button 
--        blanks all the 7-Segment anodes.
--       *An introduction message is sent across the UART when the device
--        is finished being configured, and after the center User button
--        is pressed.
--       *A message is sent over UART whenever BTNU, BTNL, BTND, or BTNR is
--        pressed.
--       *The Tri-Color LEDs cycle through several colors in a ~4 second loop
--       *Data from the microphone is collected and transmitted over the mono
--        audio out port.
--       *Note that the center user button behaves as a user reset button
--        and is referred to as such in the code comments below
--        
--	All UART communication can be captured by attaching the UART port to a
-- computer running a Terminal program with 9600 Baud Rate, 8 data bits, no 
-- parity, and 1 stop bit.																
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  08/08/2011(SamB): Created using Xilinx Tools 13.2
--  08/27/2013(MarshallW): Modified for the Nexys4 with Xilinx ISE 14.4\
--  		--added RGB and microphone
--  12/10/2014(SamB): Ported to Nexys4DDR and updated to Vivado 2014.4
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The IEEE.std_logic_unsigned contains definitions that allow 
--std_logic_vector types to be used with the + operator to instantiate a 
--counter.
use IEEE.std_logic_unsigned.all;

entity GPIO_demo is
    Port ( SW 			: in  STD_LOGIC_VECTOR (15 downto 0);
           BTN 			: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK 			: in  STD_LOGIC;
           LED 			: out  STD_LOGIC_VECTOR (15 downto 0);
           SSEG_CA 		: out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN 		: out  STD_LOGIC_VECTOR (7 downto 0);
           UART_TXD 	: out  STD_LOGIC;
           RGB1_Red		: out  STD_LOGIC;
           RGB1_Green	: out  STD_LOGIC;
           RGB1_Blue	: out  STD_LOGIC;	
           RGB2_Red		: out  STD_LOGIC;
           RGB2_Green	: out  STD_LOGIC;
           RGB2_Blue	: out  STD_LOGIC;
           micClk       : out STD_LOGIC;
           micLRSel     : out STD_LOGIC;
           micData      : in STD_LOGIC;
           ampPWM       : out STD_LOGIC;
           ampSD        : out STD_LOGIC			  
			  );
end GPIO_demo;

architecture Behavioral of GPIO_demo is

component UART_TX_CTRL
Port(
	SEND : in std_logic;
	DATA : in std_logic_vector(7 downto 0);
	CLK : in std_logic;          
	READY : out std_logic;
	UART_TX : out std_logic
	);
end component;

component debouncer
Generic(
        DEBNC_CLOCKS : integer;
        PORT_WIDTH : integer);
Port(
		SIGNAL_I : in std_logic_vector(4 downto 0);
		CLK_I : in std_logic;          
		SIGNAL_O : out std_logic_vector(4 downto 0)
		);
end component;

component RGB_controller 
Port(
	GCLK 			: in std_logic;
	RGB_LED_1_O	: out std_logic_vector(2 downto 0);
	RGB_LED_2_O	: out std_logic_vector(2 downto 0)
	);
end component;

--The type definition for the UART state machine type. Here is a description of what
--occurs during each state:
-- RST_REG     -- Do Nothing. This state is entered after configuration or a user reset.
--                The state is set to LD_INIT_STR.
-- LD_INIT_STR -- The Welcome String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The welcome string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
-- SEND_CHAR   -- uartSend is set high for a single clock cycle, signaling the character
--                data at sendStr(strIndex) to be registered by the UART_TX_CTRL at the next
--                cycle. Also, strIndex is incremented (behaves as if it were post 
--                incremented after reading the sendStr data). The state is set to RDY_LOW.
-- RDY_LOW     -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go low, 
--                indicating a send operation has begun. State is set to WAIT_RDY.
-- WAIT_RDY    -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go high, 
--                indicating a send operation has finished. If READY is high and strEnd = 
--                StrIndex then state is set to WAIT_BTN, else if READY is high and strEnd /=
--                StrIndex then state is set to SEND_CHAR.
-- WAIT_BTN    -- Do nothing. Wait for a button press on BTNU, BTNL, BTND, or BTNR. If a 
--                button press is detected, set the state to LD_BTN_STR.
-- LD_BTN_STR  -- The Button String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The button string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_MODE, LD_BTN_STR);

--The CHAR_ARRAY type is a variable length array of 8 bit std_logic_vectors. 
--Each std_logic_vector contains an ASCII value and represents a character in
--a string. The character at index 0 is meant to represent the first
--character of the string, the character at index 1 is meant to represent the
--second character of the string, and so on.
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant TMR_CNTR_MAX : std_logic_vector(26 downto 0) := "101111101011110000100000000"; --100,000,000 = clk cycles per second
constant TMR_VAL_MAX : std_logic_vector(3 downto 0) := "1001"; --9

constant RESET_CNTR_MAX : std_logic_vector(17 downto 0) := "110000110101000000";-- 100,000,000 * 0.002 = 200,000 = clk cycles per 2 ms

constant MAX_STR_LEN : integer := 58;

constant WELCOME_STR_LEN : natural := 58;
constant BTN_STR_LEN : natural := 24;

--Welcome string definition. Note that the values stored at each index
--are the ASCII values of the indicated character.
constant WELCOME_STR : CHAR_ARRAY(0 to 57) := (X"0A",  --\n
															  X"0D",  --\r
															  X"48",  --H
															  X"65",  --e
															  X"6C",  --l
															  X"6C",  --l
															  X"6F",  --o
															  X"20",  -- 
															  X"45",  --E
															  X"43",  --C
															  X"35",  --5 
															  X"35",  --5
															  X"31",  --1
															  X"2E",  --.
															  X"20",  --
															  X"4D",  --M
															  X"79",  --y
															  X"20",  --
															  X"6E",  --n
															  X"61",  --a
															  X"6D",  --m
															  X"65",  --e
															  X"20",  --
															  X"69",  --i
															  X"73",  --s
															  X"20",  --
															  X"57",  --W
															  X"69",  --i
															  X"6C",  --l
															  X"6C",  --l
															  X"43",  --C
															  X"6F",  --o
															  X"6E",  --n
															  X"2E",  --.
															  X"0A",  --\n
															  X"0D",  --\r
															  X"50",  --P
															  X"6C",  --l
															  X"65",  --e
															  X"61",  --a
															  X"73",  --s
															  X"65",  --e
															  X"20",  --
															  X"65",  --e
															  X"6E",  --n
															  X"74",  --t
															  X"65",  --e
															  X"72",  --r
															  X"20",  --
															  X"61",  --a
															  X"20",  --
															  X"6D",  --m
															  X"6F",  --o
															  X"64",  --d
															  X"65",  --e
															  X"3A",  --:
															  X"0A",  --\n
															  X"0D"); --\r
															  
--Button press string definition.
constant LD_MODE_I_STR : CHAR_ARRAY(0 to 25) :=              (X"4D",  --M
															  X"6F",  --o
															  X"64",  --d
															  X"65",  --e
															  X"20",  --
															  X"49",  --I
															  X"3A",  --:
															  X"20",  --
															  X"45",  --E
															  X"6E",  --n
															  X"74",  --t
															  X"65",  --e
															  X"72",  --r
															  X"20",  --
															  X"49",  --I
															  X"6E",  --n
															  X"73",  --s
															  X"74",  --t
															  X"72",  --r
															  X"75",  --u
															  X"63",  --c
															  X"74",  --t
															  X"69",  --i
															  X"6F",  --o
															  X"6E",  --n
															  X"73",  --s
															  X"0A",  --\n
															  X"0D"); --\r

--Button press string definition.
constant LD_MODE_L_STR : CHAR_ARRAY(0 to 34) :=              (X"4D",  --M
															  X"6F",  --o
															  X"64",  --d
															  X"65",  --e
															  X"20",  --
															  X"4C",  --L
															  X"3A",  --:
															  X"20",  --
															  X"45",  --L
															  X"6E",  --o
															  X"74",  --a
															  X"65",  --d
															  X"20",  --
															  X"49",  --I
															  X"6E",  --n
															  X"73",  --s
															  X"74",  --t
															  X"72",  --r
															  X"75",  --u
															  X"63",  --c
															  X"74",  --t
															  X"69",  --i
															  X"6F",  --o
															  X"6E",  --n
															  X"73",  --s
															  X"20",  --
															  X"66",  --f
															  X"72",  --r
															  X"6F",  --o
															  X"6D",  --m
															  X"20",  --
															  X"55",  --U
															  X"41",  --A
															  X"52",  --R
															  X"54",  --T
															  X"0A",  --\n
															  X"0D"); --\r

--Button press string definition.
constant LD_MODE_X_STR : CHAR_ARRAY(0 to 24) :=              (X"49",  --I
															  X"6E",  --n
															  X"76",  --v
															  X"61",  --a
															  X"6C",  --l
															  X"69",  --i
															  X"64",  --d
															  X"20",  --
															  X"45",  --E
															  X"6E",  --n
															  X"74",  --t
															  X"72",  --r
															  X"79",  --y
															  X"21",  --!
															  X"0A",  --\n
															  X"0D"); --\r
															 
--Button press string definition.
constant LD_MODE_A_STR : CHAR_ARRAY(0 to 27) :=              (X"4D",  --M
															  X"6F",  --o
															  X"64",  --d
															  X"65",  --e
															  X"20",  --
															  X"49",  --A
															  X"3A",  --:
															  X"20",  --
															  X"45",  --R
															  X"6E",  --u
															  X"74",  --n
															  X"65",  --
															  X"72",  --a
															  X"20",  --n
															  X"49",  --
															  X"6E",  --A
															  X"73",  --L
															  X"74",  --U
															  X"72",  --
															  X"75",  --o
															  X"63",  --p
															  X"74",  --e
															  X"69",  --r
															  X"6F",  --a
															  X"6E",  --t
															  X"73",  --i
															  X"6E",  --o
															  X"73",  --n
															  X"0A",  --\n
															  X"0D"); --\r															 

--This is used to determine when the 7-segment display should be
--incremented
signal tmrCntr : std_logic_vector(26 downto 0) := (others => '0');

--This counter keeps track of which number is currently being displayed
--on the 7-segment.
signal tmrVal : std_logic_vector(3 downto 0) := (others => '0');

--Contains the current string being sent over uart.
signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));

--Contains the length of the current string being sent over uart.
signal strEnd : natural;

--Contains the index of the next character to be sent over uart
--within the sendStr variable.
signal strIndex : natural;

--Used to determine when a button press has occured
signal btnReg : std_logic_vector (3 downto 0) := "0000";
signal btnDetect : std_logic;

--UART_TX_CTRL control signals
signal uartRdy : std_logic;
signal uartSend : std_logic := '0';
signal uartData : std_logic_vector (7 downto 0):= "00000000";
signal uartTX : std_logic;

--Current uart state signal
signal uartState : UART_STATE_TYPE := RST_REG;

--Debounced btn signals used to prevent single button presses
--from being interpreted as multiple button presses.
signal btnDeBnc : std_logic_vector(4 downto 0);

signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 

signal pwm_val_reg : std_logic := '0';

--this counter counts the amount of time paused in the UART reset state
signal reset_cntr : std_logic_vector (17 downto 0) := (others=>'0');

begin

----------------------------------------------------------
------                LED Control                  -------
----------------------------------------------------------

with BTN(4) select
	LED <= SW 			when '0',
			 "0000000000000000" when others;
			 			 
----------------------------------------------------------
------           7-Seg Display Control             -------
----------------------------------------------------------
--Digits are incremented every second, and are blanked in
--response to button presses.

--Individual and reset blanking of Anodes
with BTN(4) select
	SSEG_AN(3 downto 0) <= btnDeBnc(3 downto 0)	when '0',
				  "1111" 			when others;	  
with BTN(4) select
	SSEG_AN(7 downto 4) <= btnDeBnc(3 downto 0)	when '0',
				  "1111" 			when others;				  

--This process controls the counter that triggers the 7-segment
--to be incremented. It counts 100,000,000 and then resets.		  
timer_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((tmrCntr = TMR_CNTR_MAX) or (BTN(4) = '1')) then
			tmrCntr <= (others => '0');
		else
			tmrCntr <= tmrCntr + 1;
		end if;
	end if;
end process;

--This process increments the digit being displayed on the 
--7-segment display every second.
timer_inc_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (BTN(4) = '1') then
			tmrVal <= (others => '0');
		elsif (tmrCntr = TMR_CNTR_MAX) then
			if (tmrVal = TMR_VAL_MAX) then
				tmrVal <= (others => '0');
			else
				tmrVal <= tmrVal + 1;
			end if;
		end if;
	end if;
end process;

--This select statement encodes the value of tmrVal to the necessary
--cathode signals to display it on the 7-segment
with tmrVal select
	SSEG_CA <= "11000000" when "0000",
				  "11111001" when "0001",
				  "10100100" when "0010",
				  "10110000" when "0011",
				  "10011001" when "0100",
				  "10010010" when "0101",
				  "10000010" when "0110",
				  "11111000" when "0111",
				  "10000000" when "1000",
				  "10010000" when "1001",
				  "11111111" when others;


----------------------------------------------------------
------              Button Control                 -------
----------------------------------------------------------
--Buttons are debounced and their rising edges are detected
--to trigger UART messages


--Debounces btn signals
Inst_btn_debounce: debouncer 
    generic map(
        DEBNC_CLOCKS => (2**16),
        PORT_WIDTH => 5)
    port map(
		SIGNAL_I => BTN,
		CLK_I => CLK,
		SIGNAL_O => btnDeBnc
	);

--Registers the debounced button signals, for edge detection.
btn_reg_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		btnReg <= btnDeBnc(3 downto 0);
	end if;
end process;

--btnDetect goes high for a single clock cycle when a btn press is
--detected. This triggers a UART message to begin being sent.
btnDetect <= '1' when ((btnReg(0)='0' and btnDeBnc(0)='1') or
								(btnReg(1)='0' and btnDeBnc(1)='1') or
								(btnReg(2)='0' and btnDeBnc(2)='1') or
								(btnReg(3)='0' and btnDeBnc(3)='1')  ) else
				  '0';
				  



----------------------------------------------------------
------              UART Control                   -------
----------------------------------------------------------
--Messages are sent on reset and when a button is pressed.

--This counter holds the UART state machine in reset for ~2 milliseconds. This
--will complete transmission of any byte that may have been initiated during 
--FPGA configuration due to the UART_TX line being pulled low, preventing a 
--frame shift error from occuring during the first message.
process(CLK)
begin
  if (rising_edge(CLK)) then
    if ((reset_cntr = RESET_CNTR_MAX) or (uartState /= RST_REG)) then
      reset_cntr <= (others=>'0');
    else
      reset_cntr <= reset_cntr + 1;
    end if;
  end if;
end process;

--Next Uart state logic (states described above)
next_uartState_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btnDeBnc(4) = '1') then
			uartState <= RST_REG;
		else	
			case uartState is 
			when RST_REG =>
        if (reset_cntr = RESET_CNTR_MAX) then
          uartState <= LD_INIT_STR;
        end if;
			when LD_INIT_STR =>
				uartState <= SEND_CHAR;
			when SEND_CHAR =>
				uartState <= RDY_LOW;
			when RDY_LOW =>
				uartState <= WAIT_RDY;
			when WAIT_RDY =>
				if (uartRdy = '1') then
					if (strEnd = strIndex) then
						uartState <= WAIT_MODE;
					else
						uartState <= SEND_CHAR;
					end if;
				end if;
			when WAIT_MODE =>
				if (mode_select = 3'b000) then
					uartState <= LD_MODE_I_STR;
			    elsif(mode_select = 3'b001) then
			        uartState <= LD_MODE_L_STR;
			    elsif(mode_select = 3'b010) then
			        uartState <= LD_MODE_A_STR;
			    elsif(mode_select = 3'b011) then
			        uartState <= LD_MODE_B_STR;
			    elsif(mode_select = 3'b100) then
			        uartState <= LD_MODE_X_STR;
				end if;
			when LD_BTN_STR =>
				uartState <= SEND_CHAR;
			when others=> --should never be reached
				uartState <= RST_REG;
			end case;
		end if ;
	end if;
end process;

--Loads the sendStr and strEnd signals when a LD state is
--is reached.
string_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR) then
			sendStr <= WELCOME_STR;
			strEnd <= WELCOME_STR_LEN;
		elsif (uartState = LD_MODE_I_STR) then
			sendStr(0 to 23) <= MODE_I_STR;
			strEnd <= MODE_I_STR_LEN;
	    elsif (uartState = LD_MODE_L_STR) then
			sendStr(0 to 23) <= MODE_L_STR;
			strEnd <= MODE_L_STR_LEN;
		elsif (uartState = LD_MODE_A_STR) then
			sendStr(0 to 23) <= MODE_A_STR;
			strEnd <= MODE_A_STR_LEN;
		elsif (uartState = LD_MODE_B_STR) then
			sendStr(0 to 23) <= MODE_B_STR;
			strEnd <= MODE_B_STR_LEN;
		elsif (uartState = LD_MODE_X_STR) then
			sendStr(0 to 23) <= MODE_X_STR;
			strEnd <= MODE_X_STR_LEN;
		end if;
	end if;
end process;

--Conrols the strIndex signal so that it contains the index
--of the next character that needs to be sent over uart
char_count_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR or uartState = LD_BTN_STR) then
			strIndex <= 0;
		elsif (uartState = SEND_CHAR) then
			strIndex <= strIndex + 1;
		end if;
	end if;
end process;

--Controls the UART_TX_CTRL signals
char_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = SEND_CHAR) then
			uartSend <= '1';
			uartData <= sendStr(strIndex);
		else
			uartSend <= '0';
		end if;
	end if;
end process;

--Component used to send a byte of data over a UART line.
Inst_UART_TX_CTRL: UART_TX_CTRL port map(
		SEND => uartSend,
		DATA => uartData,
		CLK => CLK,
		READY => uartRdy,
		UART_TX => uartTX 
	);

UART_TXD <= uartTX;

----------------------------------------------------------
------            RGB LED Control                  -------
----------------------------------------------------------

RGB_Core: RGB_controller port map(
	GCLK => CLK, 			
	RGB_LED_1_O(0) => RGB1_Green, 
	RGB_LED_1_O(1) => RGB1_Blue,
	RGB_LED_1_O(2) => RGB1_Red,
	RGB_LED_2_O(0) => RGB2_Green, 
	RGB_LED_2_O(1) => RGB2_Blue,
	RGB_LED_2_O(2) => RGB2_Red
	);
	

----------------------------------------------------------
------              MIC Control                    -------
----------------------------------------------------------
--PDM data from the microphone is registered on the rising 
--edge of every micClk, converting it to PWM. The PWM data
--is then connected to the mono audio out circuit, causing 
--the sound captured by the microphone to be played over 
--the audio out port.

process(CLK)
begin
  if (rising_edge(CLK)) then
    clk_cntr_reg <= clk_cntr_reg + 1;
  end if;
end process;

--micClk = 100MHz / 32 = 3.125 MHz
micClk <= clk_cntr_reg(4);

process(CLK)
begin
  if (rising_edge(CLK)) then
    if (clk_cntr_reg = "01111") then
      pwm_val_reg <= micData;
    end if;
  end if;
end process;

micLRSel <= '0';
ampPWM <= pwm_val_reg;
ampSD <= '1';

end Behavioral;
