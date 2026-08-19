----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/19/2026 5:37:00 PM
-- Design Name: Inverse Substitution Box Testbench
-- Module Name: Inverse Substitution Box Testbench - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Testbench
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
use AES.invSBox;

entity tb_invSBox is
end tb_invSBox;

architecture TB of tb_invSBox is
        signal tb_state   : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal tb_inverse : byte_matrix (15 downto 0) := (others => (others => '0'));
    begin 
        DUT : entity invSBox port map(
            state   => tb_state,
            inverse => tb_inverse
        );
    
    TEST: process
          begin
            wait for 10ns;
               tb_state <= (
                    0  => x"00", 1   => x"01", 2  => x"02", 3  => x"03",
                    4  => x"04", 5   => x"05", 6  => x"06", 7  => x"07",
                    8  => x"08", 9   => x"09", 10 => x"0A", 11 => x"0B",
                    12 => x"0C", 13  => x"0D", 14 => x"0E", 15 => x"0F"
                );
                
                wait for 10ns;
                tb_state <= (
                    0  => x"A7", 1   => x"3C", 2  => x"F1", 3  => x"09",
                    4  => x"52", 5   => x"DE", 6  => x"81", 7  => x"B4",
                    8  => x"6F", 9   => x"10", 10 => x"C8", 11 => x"35",
                    12 => x"E2", 13  => x"99", 14 => x"47", 15 => x"BD"
                );    
                wait;             
          end process;
end TB;