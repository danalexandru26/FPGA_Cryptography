----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/16/2026 5:20:00 PM
-- Design Name: Key Schedule Operation Testbench
-- Module Name: Key Schedule Operation Testbench - Behavioral
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

library AES;
use AES.all;

library aes_utilities;
use aes_utilities.types.all;

entity tb_Keychedule is
end tb_Keychedule;

architecture TB of tb_Keychedule is
    signal tb_round : std_logic_vector (7 downto 0) := (others => '0');
    
    signal tb_i_key : byte_matrix (15 downto 0)     := (
                0  => x"2B", 1   => x"7E", 2  => x"15", 3  => x"16",
                4  => x"28", 5   => x"AE", 6  => x"D2", 7  => x"A6",
                8  => x"AB", 9   => x"F7", 10 => x"15", 11 => x"88",
                12 => x"09", 13  => x"CF", 14 => x"4F", 15 => x"3C"
    );
    
    signal tb_o_key : byte_matrix (15 downto 0);
    begin
    
    DUT: entity KeySchedule port map(
         round => tb_round,
         i_key => tb_i_key,
         o_key => tb_o_key
    );
    
    TEST: process
        begin
            wait for 10ns;
            if (tb_round < x"0A") then
                tb_round <= std_logic_vector(unsigned(tb_round) + 1);
                tb_i_key <= tb_o_key;
            end if;
                     
        end process;
end TB;