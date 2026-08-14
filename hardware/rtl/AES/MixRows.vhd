----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 7:30:00 PM
-- Design Name: Rows Diffusion Operation
-- Module Name: Rows Diffusion Operation - Behavioral
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

entity MixRows is
    port(
        state  : in byte_matrix (15 downto 0);
        output : out byte_matrix (15 downto 0)
);
end MixRows;

architecture RTL of MixRows is
    begin
        SHIFT_ROW_0:
            output(0) <= state(0);
            output(1) <= state(1);
            output(2) <= state(2);
            output(3) <= state(3);    
    
        SHIFT_ROW_1:
            output(4) <= state(5);
            output(5) <= state(6);
            output(6) <= state(7);
            output(7) <= state(4);
       
        SHIFT_ROW_2:
            output(8)  <= state(10);
            output(9)  <= state(11);
            output(10) <= state(8);
            output(11) <= state(9);
            
        SHIFT_ROW_3:
            output(12) <= state(15);
            output(13) <= state(12);
            output(14) <= state(13);
            output(15) <= state(14); 
end RTL;