----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/17/2026 05:20:00 PM
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
        output <= matrix_xor(state, round_key);
end RTL;