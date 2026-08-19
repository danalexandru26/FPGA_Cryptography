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

entity invMixColumn is
    port(
        state   : in byte_matrix (15 downto 0);
        inverse : out byte_matrix (15 downto 0)
);
end invMixColumn;

architecture RTL of invMixColumn is
    begin
    
        
end RTL;