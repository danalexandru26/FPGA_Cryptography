----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/19/2026 6:32:00 PM
-- Design Name: Inverse Column Diffusion Operation
-- Module Name: Inverse Column Diffusion Operation - Behavioral
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

entity invMixColumn is
    port(
        state   : in byte_matrix (15 downto 0);
        inverse : out byte_matrix (15 downto 0)
);
end invMixColumn;

architecture RTL of invMixColumn is
    signal x2 : byte_matrix (15 downto 0) := (others => (others => '0'));
    signal x4 : byte_matrix (15 downto 0) := (others => (others => '0'));
    signal x8 : byte_matrix (15 downto 0) := (others => (others => '0'));
     
    begin
    
        GEN_MUL:
            for i in 0 to 15 generate
                x2(i) <= xtime(state(i));
                x4(i) <= xtime(x2(i));
                x8(i) <= xtime(x4(i));
            end generate;
        
        GEN_INVERT_COLUMNS:
            for i in 0 to 3 generate
                inverse(i)    <= (x2(i) xor x4(i) xor x8(i)) xor (x2(i+4) xor x8(i+4) xor state(i+4)) xor (x4(i+8) xor x8(i+8) xor state(i+8)) xor (x8(i+12) xor state(i+12));
                inverse(i+4)  <= (x8(i) xor state(i)) xor (x2(i+4) xor x4(i+4) xor x8(i+4)) xor (x2(i+8) xor x8(i+8) xor state(i+8)) xor (x4(i+12) xor x8(i+12) xor state(i+12));
                inverse(i+8)  <= (x4(i) xor x8(i) xor state(i)) xor (x8(i+4) xor state(i+4)) xor (x2(i+8) xor x4(i+8) xor x8(i+8)) xor (x2(i+12) xor x8(i+12) xor state(i+12));
                inverse(i+12) <= (x2(i) xor x8(i) xor state(i)) xor (x4(i+4) xor x8(i+4) xor state(i+4)) xor (x8(i+8) xor state(i+8)) xor (x2(i+12) xor x4(i+12) xor x8(i+12));           
            end generate;
end RTL;