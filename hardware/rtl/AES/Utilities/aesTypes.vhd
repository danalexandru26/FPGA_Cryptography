----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 5:0:00 PM
-- Design Name: User Defined Types
-- Module Name:
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Types
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

package types is
    type byte_matrix is array (natural range <>) of std_logic_vector(7 downto 0);
end package;