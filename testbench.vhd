-- 8 Operations 32 Bit ALU VHDL Testbench
-- By Nader Alsharkawy - http://github.com/SubNader

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--Testbench entity definition
entity testbenchEntity is
end testbenchEntity;

--Testbench architecture (based on the main module)
architecture testbenchArchitecture of testbenchEntity is
	--Test component initiation
	component ALUEntity
		--Testbench port definition
		port (
			firstInput, secondInput : in std_logic_vector(31 downto 0);
			operation : in std_logic_vector(2 downto 0);
			finalOutput : inout std_logic_vector(31 downto 0);
			clockSignal : in std_logic;
			zeroFlag : out std_logic
		);
	end component;
	
	--Test signals definition
	signal clockSignal : std_logic := '0';
	signal firstInput : std_logic_vector(31 downto 0);
	signal secondInput : std_logic_vector(31 downto 0);
	signal operation : std_logic_vector(2 downto 0);
	--Output signals
     signal finalOutput : std_logic_vector(31 downto 0);
     signal zeroFlag : std_logic;
     
	--Simulation clock period initialisation
	constant clockPeriod : time := 20 ns;
--Simulation snippits start here
begin
	--Unit under test setting
	uut : ALUEntity
	--Port mapping
	port map(
		clockSignal => clockSignal, 
		firstInput => firstInput, 
		secondInput => secondInput, 
		operation => operation
	);
	
	--Simulation clocking method/process
	clockProcess : process
	begin
		clockSignal <= '0';
		wait for clockPeriod/2;
		clockSignal <= '1';
		wait for clockPeriod/2;
	end process;
 
	--Invoking process for simulation
	stimulusProcess : process
	begin
	--Clearing delay
    wait for 100 ns; 
		--Test input for A and B
		firstInput <= "00000000000000000000000000000010"; -- A
		secondInput <= "00000000000000000000000000000010"; -- B
		--Invoking starts here
		operation <= "000";
		wait for clockPeriod;
		operation <= "001";
		wait for clockPeriod;
		operation <= "010";
		wait for clockPeriod;
		operation <= "011";
		wait for clockPeriod;
		operation <= "100";
		wait for clockPeriod;
		operation <= "101";
		wait for clockPeriod;
		operation <= "110";
		wait for clockPeriod;
		operation <= "111";
	end process;
	end;