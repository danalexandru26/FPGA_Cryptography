----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/16/2026 03:56:00 PM
-- Design Name: Key Schedule
-- Module Name: Key Schedule - Behavioral
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

entity KeySchedule is
    port(
        round  : in std_logic_vector(7 downto 0);
        i_key  : in byte_matrix(15 downto 0);
        o_key  : out byte_matrix(15 downto 0)
);
end KeySchedule;

architecture RTL of KeySchedule is
    begin
    
    
    
end RTL;    