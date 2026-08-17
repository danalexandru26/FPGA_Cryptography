----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/17/2026 05:40:00 PM
-- Design Name: Key Addition Operation 
-- Module Name: Key Addition Operation - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard
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

library aes_utilities;
use aes_utilities.types.all;
use aes_utilities.functions.all;

entity KeyAddition is
    port(
        state     : in byte_matrix (15 downto 0);
        round_key : in byte_matrix (15 downto 0);
        output    : out byte_matrix (15 downto 0)
);
end KeyAddition;

architecture RTL of KeyAddition is
        signal compute : byte_matrix (15 downto 0);
    begin
        
        FIRST_COLUMN:
            compute(0)  <= state(0)  xor round_key(0);
            compute(4)  <= state(4)  xor round_key(1);
            compute(8)  <= state(8)  xor round_key(2);
            compute(12) <= state(12) xor round_key(3);
            
        SECOND_COLUMN:
            compute(1)  <= state(1)  xor round_key(4);
            compute(5)  <= state(5)  xor round_key(5);
            compute(9)  <= state(9)  xor round_key(6);
            compute(13) <= state(13) xor round_key(7);
            
        THIRD_COLUMN:
            compute(2)  <= state(2)  xor round_key(8);
            compute(6)  <= state(6)  xor round_key(9);
            compute(10) <= state(10) xor round_key(10);
            compute(14) <= state(14) xor round_key(11);
            
        FOURTH_COLUMN:
            compute(3)  <= state(3)  xor round_key(12);
            compute(7)  <= state(7)  xor round_key(13);
            compute(11) <= state(11) xor round_key(14);
            compute(15) <= state(15) xor round_key(15);
            
        output <= compute;
end RTL;