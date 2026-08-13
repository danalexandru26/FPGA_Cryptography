----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 5:0:00 PM
-- Design Name: Substitution Box Test Bench
-- Module Name: Test Bench - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Testbench
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

library AES;
use AES.all;

entity tb_SBox is

end tb_SBox;

architecture TB of tb_Sbox is
    signal tb_input  : std_logic_vector (7 downto 0) := (others => '0');
    signal tb_result : std_logic_vector (7 downto 0) := (others => '0');
    
    begin
        DUT: entity SBox port map(
             state      => tb_input,
             substitute => tb_result
        );
        
        TEST: process
            begin
            
               wait for 10ns;
               tb_input <= std_logic_vector(unsigned(tb_input) + 1); 
            
            end process;
end TB;