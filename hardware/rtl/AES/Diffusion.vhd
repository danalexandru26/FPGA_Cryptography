----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 3:15:00 PM
-- Design Name: Diffusion Operation
-- Module Name: Diffusion Operation - Behavioral
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

library AES;

entity Diffusion is
    port(
        state  : in byte_matrix (15 downto 0);
        output : out byte_matrix (15 downto 0)
);
end Diffusion;

architecture RTL of Diffusion is
    signal w_output : byte_matrix (15 downto 0);
    begin
        c_MixRows: entity AES.MixRows port map(
            state  => state,
            output => w_output
        );
        
        c_MixColumn: entity AES.MixColumn port map(
            state => w_output,
            output => output
        );
end RTL;