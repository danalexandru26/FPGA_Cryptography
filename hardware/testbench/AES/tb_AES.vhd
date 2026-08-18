----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 07:30:00 PM
-- Design Name: Advanced Encryption Standard Core Testbench
-- Module Name: Advanced Encryption Standard Core Testbench - Behavioral
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

entity tb_Core is
end tb_Core;


architecture TB of tb_Core is
        signal s_clk        : std_logic := '0';
        signal s_start      : std_logic := '0';
        signal s_command    : std_logic := '0';
        
        signal s_plaintext  : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal s_key        : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal s_ciphertext : byte_matrix (15 downto 0) := (others => (others => '0'));
    begin
        DUT: entity AES_Core port map(
            clk        => s_clk,
            start      => s_start,
            command    => s_command,
            plaintext  => s_plaintext,
            key        => s_key,
            ciphertext => s_ciphertext
        );  
        
    FCLK: process
          begin
            s_clk <= '0';
            wait for 5ns;
            
            s_clk <= '1';
            wait for 5ns;
    end process;
    
    TEST: process   
          begin
          
          wait for 10ns;
          s_start <= '1';
          
          s_plaintext <= (
                    0  => x"00", 1   => x"44", 2  => x"88", 3  => x"CC",
                    4  => x"11", 5   => x"55", 6  => x"99", 7  => x"DD",
                    8  => x"22", 9   => x"66", 10 => x"AA", 11 => x"EE",
                    12 => x"33", 13  => x"77", 14 => x"BB", 15 => x"FF"
                );
                
          s_key <= (
                    0  => x"00", 1   => x"01", 2  => x"02", 3  => x"03",
                    4  => x"04", 5   => x"05", 6  => x"06", 7  => x"07",
                    8  => x"08", 9   => x"09", 10 => x"0A", 11 => x"0B",
                    12 => x"0C", 13  => x"0D", 14 => x"0E", 15 => x"0F"
                );
                
          wait;   
    end process;
   
end TB;
