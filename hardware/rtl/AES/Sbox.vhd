----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 5:0:00 PM
-- Design Name: Substitution Box
-- Module Name: Substitution Box - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Core
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

library aes_utilities;
use aes_utilities.types.all;

entity SBox is
    port(
        state      : in byte_matrix (15 downto 0);
        substitute : out byte_matrix (15 downto 0)
);
end SBox;

architecture RTL of SBox is
    begin
        gen_Substitute:
            for i in 0 to 15 generate
            begin
                substitute(i) <= substitution_table(to_integer(unsigned(state(i))));
            end generate;
end RTL;