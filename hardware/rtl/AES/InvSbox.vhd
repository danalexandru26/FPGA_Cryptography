----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/19/2026 5:30:00 PM
-- Design Name: Inverse Substitution Box
-- Module Name: Inverse Substitution Box - Behavioral
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

entity invSBox is
    port(
        state   : in byte_matrix (15 downto 0);
        inverse : out byte_matrix (15 downto 0)
);
end invSBox;


architecture RTL of invSBox is
    begin
        compute_inverse:
            for i in 0 to 15 generate
                begin
                    inverse(i) <= inverse_substitution_table(to_integer(unsigned(state(i))));
            end generate;

end RTL;