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

entity SBox is
    port(
        state      : in std_logic_vector(7 downto 0);
        substitute : out std_logic_vector(7 downto 0)
);
end SBox;

architecture RTL of SBox is
    begin
    
end RTL;