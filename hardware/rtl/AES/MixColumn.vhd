----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/14/2026 2:0:00 PM
-- Design Name: Column Diffusion Operation
-- Module Name: Column Diffusion Operation - Behavioral
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

entity MixColumn is
    port(
        state  : in byte_matrix (15 downto 0);
        output : out byte_matrix (15 downto 0)
);
end MixColumn;

architecture RTL of MixColumn is
    begin
        MIX_COLUMN_0:
            output(0)  <= xtime(state(0)) xor (xtime(state(4)) xor state(4)) xor state(8) xor state(12);  
            output(4)  <= state(0) xor xtime(state(4)) xor (xtime(state(8)) xor state(8)) xor state(12);  
            output(8)  <= state(0) xor state(4) xor xtime(state(8)) xor (xtime(state(12)) xor state(12));
            output(12) <= (xtime(state(0)) xor state(0)) xor state(4) xor state(8) xor xtime(state(12));
            
        MIX_COLUMN_1:
            output(1)  <= xtime(state(1)) xor (xtime(state(5)) xor state(5)) xor state(9) xor state(13);  
            output(5)  <= state(1) xor xtime(state(5)) xor (xtime(state(9)) xor state(9)) xor state(13);  
            output(9)  <= state(1) xor state(5) xor xtime(state(9)) xor (xtime(state(13)) xor state(13));
            output(13) <= (xtime(state(1)) xor state(1)) xor state(5) xor state(9) xor xtime(state(13));
            
        MIX_COLUMN_2:
            output(2)  <= xtime(state(2)) xor (xtime(state(6)) xor state(6)) xor state(10) xor state(14);  
            output(6)  <= state(2) xor xtime(state(6)) xor (xtime(state(10)) xor state(10)) xor state(14);  
            output(10) <= state(2) xor state(6) xor xtime(state(10)) xor (xtime(state(14)) xor state(14));
            output(14) <= (xtime(state(2)) xor state(2)) xor state(6) xor state(10) xor xtime(state(14));
            
        MIX_COLUMN_3:
            output(3)  <= xtime(state(3)) xor (xtime(state(7)) xor state(7)) xor state(11) xor state(15);  
            output(7)  <= state(3) xor xtime(state(7)) xor (xtime(state(11)) xor state(11)) xor state(15);  
            output(11) <= state(3) xor state(7) xor xtime(state(11)) xor (xtime(state(15)) xor state(15));
            output(15) <= (xtime(state(3)) xor state(3)) xor state(7) xor state(11) xor xtime(state(15));
end RTL;