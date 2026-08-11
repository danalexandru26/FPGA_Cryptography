----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/11/2026 10:11:50 PM
-- Design Name: Blinky
-- Module Name: Blinky - Behavioral
-- Project Name: FPGA_Cryptography Test Suite
-- Target Devices: Digilent Arty Z7020 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity blinky is
generic(
    frequency: integer := 62500000
);
port(
    clk      :  in std_logic;
    led_blue : out std_logic
);
end blinky;

architecture RTL of blinky is
    signal counter : std_logic_vector(26 downto 0) := (others => '0');
begin
    process(clk)
        begin
            if (rising_edge(clk)) then
                counter <= std_logic_vector(unsigned(counter) + 1);
                
                if(unsigned(counter) < frequency) then
                    led_blue <= '1';
                else led_blue <= '0';
                end if;
            end if;
        end process;
end RTL;