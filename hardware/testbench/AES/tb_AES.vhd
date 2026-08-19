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
        signal s_ready      : std_logic := '0';
        
        signal s_plaintext  : std_logic_vector (127 downto 0) := (others => '0');
        signal s_key        : std_logic_vector (127 downto 0) := (others => '0');
        signal s_ciphertext : std_logic_vector (127 downto 0) := (others => '0');
    begin
        DUT: entity AES_Core port map(
            clk        => s_clk,
            start      => s_start,
            command    => s_command,
            plaintext  => s_plaintext,
            key        => s_key,
            ciphertext => s_ciphertext,
            ready      => s_ready
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
              s_command <= '1';
              
              wait for 10ns;
              s_plaintext <= x"6A118A874519E64E9963798A503F1D35";
              s_key       <= x"00000000000000000000000000000000";
                 
              wait for 10ns;
              s_start   <= '1';
              wait for 10ns;
              s_start   <= '0';
              
               
              wait for 300ns;
              s_command <= '1';
              
              wait for 10ns;
              s_plaintext <= x"B26AEB1874E47CA8358FF22378F09144";
              s_key       <= x"00000000000000000000000000000000";
                 
              wait for 10ns;
              s_start   <= '1';
              wait for 10ns;
              s_start   <= '0';
              wait;  
          end process;  
end TB;
