----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/17/2026 05:40:00 PM
-- Design Name: AES Core 
-- Module Name: AES Core  - Behavioral
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
use IEEE.numeric_std.all;

library aes_utilities;
use aes_utilities.types.all;
use aes_utilities.functions.all;

library AES;

entity AES_Core is
    port(
        clk        : in std_logic;
        start      : in std_logic;
        command    : in std_logic;        
        plaintext  : in std_logic_vector (127 downto 0);
        key        : in std_logic_vector (127 downto 0);

        ciphertext : out std_logic_vector (127 downto 0) := (others => '0');
        ready      : out std_logic                       := '0'
);
end AES_Core;

architecture RTL of AES_Core is
        -- Key Schedule Intermediary State Signals
        signal s_round       : integer range 0 to 9;
        signal s_round_key   : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal s_current_key : byte_matrix (15 downto 0) := (others => (others => '0'));
        
        -- Key Addition Intermediary State Signals
        signal s_addition_state : byte_matrix (15 downto 0) := (others => (others => '0'));
        
        -- Substitution Box Intermediary State Signals
        signal s_sbox_state  : byte_matrix (15 downto 0)  := (others => (others => '0'));
        signal s_sbox_output : byte_matrix (15 downto 0) := (others => (others => '0'));
         
        -- Diffusion Intermediary State Signals
        signal s_diffusion_output : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal s_diffusion_sel    : std_logic := '0';
        
        -- Finite State Machine Control Signals
        signal fsm_round   : integer range 0 to 9;
        signal state       : aes_state := S_AES_INIT;
        
        --Input Signal Wrappers
        signal s_plaintext : byte_matrix (15 downto 0) := (others => (others => '0'));
        signal s_key       : byte_matrix (15 downto 0) := (others => (others => '0'));
    begin
        
        c_SubstitutionBox : entity AES.SBox port map(
            state      => s_sbox_state,
            substitute => s_sbox_output    
        );  
        
        c_Diffusion : entity AES.Diffusion port map(
            state  => s_sbox_output,
            sel    => s_diffusion_sel,
            output => s_diffusion_output
        );
        
        c_KeySchedule : entity AES.KeySchedule port map(
            round => s_round,
            i_key => s_current_key,
            o_key => s_round_key
        ); 
        
        c_KeyAddition : entity AES.KeyAddition port map(
            state     => s_diffusion_output,
            round_key => s_round_key,
            output    => s_addition_state 
        );  
        
        process (clk) 
            begin
                if(rising_edge(clk)) then
                    case(state) is
                        when S_AES_INIT =>
                            fsm_round       <= 0;
                            s_round         <= 0;
                            s_sbox_state    <= (others => (others => '0'));
                            s_current_key   <= (others => (others => '0'));
                            s_diffusion_sel <= '0';
                            
                            state <= S_AES_IDLE;
                            
                        when S_AES_IDLE =>
                            if(start = '1') then
                                if(command = '0') then
                                     s_plaintext <= matrix_row_major(plaintext);
                                     s_key       <= matrix_column_major(key);
                                     state <= S_AES_ENCRYPT;
                                     
                                else state <= S_AES_DECRYPT;
                                end if;
                            end if;
                        
                        when S_AES_ENCRYPT =>
                            if(fsm_round = 0) then
                                s_current_key <= s_key;
                                s_sbox_state  <= matrix_xor(s_plaintext, s_key);
                            
                            else
                                if(fsm_round = 9) then
                                    s_diffusion_sel <= '1';
                                    state <= S_AES_ENCRYPT_DONE;
                                end if;
                           
                                s_round       <= s_round + 1;
                                s_current_key <= s_round_key;
                                s_sbox_state  <= s_addition_state;
                         end if;
                         
                         fsm_round <= fsm_round + 1;
                        
                        when S_AES_DECRYPT =>
                            
                        when S_AES_ENCRYPT_DONE =>
                            if(start = '0') then
                                state <= S_AES_INIT;
                            end if;
                            
                            ciphertext <= vectorize_row_major(s_addition_state);
                            ready      <= '1';
                        
                        when others =>
                            null;
                           
                    end case;
                end if;
        end process;    
            
       
end RTL;