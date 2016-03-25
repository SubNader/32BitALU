-- 8 Operations 32 Bit ALU VHDL Implementation
-- By Nader Alsharkawy - http://github.com/SubNader

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--Main (top) entity
entity ALUEntity is
	port (
		firstInput, secondInput : in std_logic_vector(31 downto 0);
		operation : in std_logic_vector(2 downto 0);
		finalOutput : inout std_logic_vector(31 downto 0);
		clockSignal : in std_logic;
		zeroFlag : out std_logic
	);
end ALUEntity;

--Architecture definition
architecture ALU_32_Bit of ALUEntity is
begin
	process (clockSignal)
	begin
		--Pass A to output
		if (operation = "000") then
			finalOutput <= firstInput;
			--Pass A+B
		elsif (operation = "001") then
			finalOutput <= (firstInput + secondInput);
			--Pass A-B
		elsif (operation = "010") then
			finalOutput <= (firstInput - secondInput);
			--Pass B-A
		elsif (operation = "011") then
			finalOutput <= (secondInput - firstInput);
			--Pass NOT A
		elsif (operation = "100") then
			finalOutput <= not(firstInput);
			--Pass A AND B
		elsif (operation = "101") then
			finalOutput <= (firstInput and secondInput);
			--Pass A OR B
		elsif (operation = "110") then
			finalOutput <= (firstInput or secondInput);
			--Pass A XOR B
		elsif (operation = "111") then
			finalOutput <= (firstInput xor secondInput);
		end if;
		--Set the zero flag based on final output
		if (finalOutput = "00000000000000000000000000000000") then
			zeroFlag <= '1';
		else zeroFlag <= '0';
		end if;
	end process;
end ALU_32_Bit;