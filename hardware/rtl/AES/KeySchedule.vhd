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
use aes_utilities.functions.all;

entity KeySchedule is
    port(
        round  : in integer range 0 to 9;
        i_key  : in byte_matrix(15 downto 0);
        o_key  : out byte_matrix(15 downto 0)
);
end KeySchedule;

architecture RTL of KeySchedule is
        signal w0 : byte_matrix (3 downto 0);
        signal w1 : byte_matrix (3 downto 0);
        signal w2 : byte_matrix (3 downto 0);
        signal w3 : byte_matrix (3 downto 0);
        
        signal w4 : byte_matrix (3 downto 0);
        signal w5 : byte_matrix (3 downto 0);
        signal w6 : byte_matrix (3 downto 0);
        signal w7 : byte_matrix (3 downto 0);
    begin
    
    WORD_CONCETENATION:
        w0 <= i_key (3 downto 0);
        w1 <= i_key (7 downto 4);
        w2 <= i_key (11 downto 8);
        w3 <= i_key (15 downto 12);
        
    ROUND_KEY_COMPUTE:
        w4 <= w0 xor gSchedule(w3, round);
        w5 <= w1 xor w4;
        w6 <= w2 xor w5;
        w7 <= w3 xor w6;
    
    ROUND_KEY_ASSIGNMENT:
        o_key (3 downto 0)   <= w4;
        o_key (7 downto 4)   <= w5;
        o_key (11 downto 8)  <= w6;
        o_key (15 downto 12) <= w7;
end RTL;    