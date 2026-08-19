----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 7:30:00 PM
-- Design Name: Inverse Rows Diffusion Operation
-- Module Name: Inverse Rows Diffusion Operation - Behavioral
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

entity invShiftRows is
    port(
        state   : in byte_matrix (15 downto 0);
        inverse : out byte_matrix (15 downto 0)
);
end invShiftRows;

architecture RTL of invShiftRows is
    begin
        SHIFT_ROW_0:
            inverse(0) <= state(0);
            inverse(1) <= state(1);
            inverse(2) <= state(2);
            inverse(3) <= state(3);
    
        SHIFT_ROW_1:
            inverse(4) <= state(7);
            inverse(5) <= state(4);
            inverse(6) <= state(5);
            inverse(7) <= state(6);
            
        SHIFT_ROW_2:
            inverse(8)  <= state(10);
            inverse(9)  <= state(11);
            inverse(10) <= state(8);
            inverse(11) <= state(9);
            
       SHIFT_ROW_3:
            inverse(12) <= state(13);
            inverse(13) <= state(14);
            inverse(14) <= state(15);
            inverse(15) <= state(12);
end RTL;
