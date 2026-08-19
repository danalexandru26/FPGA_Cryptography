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
    type aes_state is(S_AES_INIT, S_AES_IDLE, S_AES_ENCRYPT, S_AES_DECRYPT, S_AES_ENCRYPT_DONE, S_AES_DECRYPT_DONE);
    
    constant substitution_table : byte_matrix (255 downto 0) := (
            0    => x"63", 1    => x"7C", 2    => x"77", 3    => x"7B", 4    => x"F2", 5    => x"6B", 6    => x"6F", 7    => x"C5",
            8    => x"30", 9    => x"01", 10   => x"67", 11   => x"2B", 12   => x"FE", 13   => x"D7", 14   => x"AB", 15   => x"76",            
            16   => x"CA", 17   => x"82", 18   => x"C9", 19   => x"7D", 20   => x"FA", 21   => x"59", 22   => x"47", 23   => x"F0",         
            24   => x"AD", 25   => x"D4", 26   => x"A2", 27   => x"AF", 28   => x"9C", 29   => x"A4", 30   => x"72", 31   => x"C0",
            32   => x"B7", 33   => x"FD", 34   => x"93", 35   => x"26", 36   => x"36", 37   => x"3F", 38   => x"F7", 39   => x"CC",
            40   => x"34", 41   => x"A5", 42   => x"E5", 43   => x"F1", 44   => x"71", 45   => x"D8", 46   => x"31", 47   => x"15",
            48   => x"04", 49   => x"C7", 50   => x"23", 51   => x"C3", 52   => x"18", 53   => x"96", 54   => x"05", 55   => x"9A",
            56   => x"07", 57   => x"12", 58   => x"80", 59   => x"E2", 60   => x"EB", 61   => x"27", 62   => x"B2", 63   => x"75",
            64   => x"09", 65   => x"83", 66   => x"2C", 67   => x"1A", 68   => x"1B", 69   => x"6E", 70   => x"5A", 71   => x"A0",
            72   => x"52", 73   => x"3B", 74   => x"D6", 75   => x"B3", 76   => x"29", 77   => x"E3", 78   => x"2F", 79   => x"84",            
            80   => x"53", 81   => x"D1", 82   => x"00", 83   => x"ED", 84   => x"20", 85   => x"FC", 86   => x"B1", 87   => x"5B",
            88   => x"6A", 89   => x"CB", 90   => x"BE", 91   => x"39", 92   => x"4A", 93   => x"4C", 94   => x"58", 95   => x"CF",            
            96   => x"D0", 97   => x"EF", 98   => x"AA", 99   => x"FB", 100  => x"43", 101  => x"4D", 102  => x"33", 103  => x"85",
            104  => x"45", 105  => x"F9", 106  => x"02", 107  => x"7F", 108  => x"50", 109  => x"3C", 110  => x"9F", 111  => x"A8",
            112  => x"51", 113  => x"A3", 114  => x"40", 115  => x"8F", 116  => x"92", 117  => x"9D", 118  => x"38", 119  => x"F5",
            120  => x"BC", 121  => x"B6", 122  => x"DA", 123  => x"21", 124  => x"10", 125  => x"FF", 126  => x"F3", 127  => x"D2",            
            128  => x"CD", 129  => x"0C", 130  => x"13", 131  => x"EC", 132  => x"5F", 133  => x"97", 134  => x"44", 135  => x"17",
            136  => x"C4", 137  => x"A7", 138  => x"7E", 139  => x"3D", 140  => x"64", 141  => x"5D", 142  => x"19", 143  => x"73",
            144  => x"60", 145  => x"81", 146  => x"4F", 147  => x"DC", 148  => x"22", 149  => x"2A", 150  => x"90", 151  => x"88",
            152  => x"46", 153  => x"EE", 154  => x"B8", 155  => x"14", 156  => x"DE", 157  => x"5E", 158  => x"0B", 159  => x"DB",
            160  => x"E0", 161  => x"32", 162  => x"3A", 163  => x"0A", 164  => x"49", 165  => x"06", 166  => x"24", 167  => x"5C",
            168  => x"C2", 169  => x"D3", 170  => x"AC", 171  => x"62", 172  => x"91", 173  => x"95", 174  => x"E4", 175  => x"79",   
            176  => x"E7", 177  => x"C8", 178  => x"37", 179  => x"6D", 180  => x"8D", 181  => x"D5", 182  => x"4E", 183  => x"A9",
            184  => x"6C", 185  => x"56", 186  => x"F4", 187  => x"EA", 188  => x"65", 189  => x"7A", 190  => x"AE", 191  => x"08", 
            192  => x"BA", 193  => x"78", 194  => x"25", 195  => x"2E", 196  => x"1C", 197  => x"A6", 198  => x"B4", 199  => x"C6",    
            200  => x"E8", 201  => x"DD", 202  => x"74", 203  => x"1F", 204  => x"4B", 205  => x"BD", 206  => x"8B", 207  => x"8A", 
            208  => x"70", 209  => x"3E", 210  => x"B5", 211  => x"66", 212  => x"48", 213  => x"03", 214  => x"F6", 215  => x"0E",    
            216  => x"61", 217  => x"35", 218  => x"57", 219  => x"B9", 220  => x"86", 221  => x"C1", 222  => x"1D", 223  => x"9E",
            224  => x"E1", 225  => x"F8", 226  => x"98", 227  => x"11", 228  => x"69", 229  => x"D9", 230  => x"8E", 231  => x"94", 
            232  => x"9B", 233  => x"1E", 234  => x"87", 235  => x"E9", 236  => x"CE", 237  => x"55", 238  => x"28", 239  => x"DF",
            240  => x"8C", 241  => x"A1", 242  => x"89", 243  => x"0D", 244  => x"BF", 245  => x"E6", 246  => x"42", 247  => x"68",
            248  => x"41", 249  => x"99", 250  => x"2D", 251  => x"0F", 252  => x"B0", 253  => x"54", 254  => x"BB", 255  => x"16"
           );
           
    constant inverse_substitution_table : byte_matrix (255 downto 0) := (
            0    => x"52", 1    => x"09", 2    => x"6A", 3    => x"D5", 4    => x"30", 5    => x"36", 6    => x"A5", 7    => x"38",
            8    => x"BF", 9    => x"40", 10   => x"A3", 11   => x"9E", 12   => x"81", 13   => x"F3", 14   => x"D7", 15   => x"FB",
            16   => x"7C", 17   => x"E3", 18   => x"39", 19   => x"82", 20   => x"9B", 21   => x"2F", 22   => x"FF", 23   => x"87",
            24   => x"34", 25   => x"8E", 26   => x"43", 27   => x"44", 28   => x"C4", 29   => x"DE", 30   => x"E9", 31   => x"CB",
            32   => x"54", 33   => x"7B", 34   => x"94", 35   => x"32", 36   => x"A6", 37   => x"C2", 38   => x"23", 39   => x"3D",
            40   => x"EE", 41   => x"4C", 42   => x"95", 43   => x"0B", 44   => x"42", 45   => x"FA", 46   => x"C3", 47   => x"4E",
            48   => x"08", 49   => x"2E", 50   => x"A1", 51   => x"66", 52   => x"28", 53   => x"D9", 54   => x"24", 55   => x"B2",
            56   => x"76", 57   => x"5B", 58   => x"A2", 59   => x"49", 60   => x"6D", 61   => x"8B", 62   => x"D1", 63   => x"25",
            64   => x"72", 65   => x"F8", 66   => x"F6", 67   => x"64", 68   => x"86", 69   => x"68", 70   => x"98", 71   => x"16",
            72   => x"D4", 73   => x"A4", 74   => x"5C", 75   => x"CC", 76   => x"5D", 77   => x"65", 78   => x"B6", 79   => x"92",    
            80   => x"6C", 81   => x"70", 82   => x"48", 83   => x"50", 84   => x"FD", 85   => x"ED", 86   => x"B9", 87   => x"DA",
            88   => x"5E", 89   => x"15", 90   => x"46", 91   => x"57", 92   => x"A7", 93   => x"8D", 94   => x"9D", 95   => x"84",
            96   => x"90", 97   => x"D8", 98   => x"AB", 99   => x"00", 100  => x"8C", 101  => x"BC", 102  => x"D3", 103  => x"0A",
            104  => x"F7", 105  => x"E4", 106  => x"58", 107  => x"05", 108  => x"B8", 109  => x"B3", 110  => x"45", 111  => x"06",
            112  => x"D0", 113  => x"2C", 114  => x"1E", 115  => x"8F", 116  => x"CA", 117  => x"3F", 118  => x"0F", 119  => x"02",
            120  => x"C1", 121  => x"AF", 122  => x"BD", 123  => x"03", 124  => x"01", 125  => x"13", 126  => x"8A", 127  => x"6B",
            128  => x"3A", 129  => x"91", 130  => x"11", 131  => x"41", 132  => x"4F", 133  => x"67", 134  => x"DC", 135  => x"EA",
            136  => x"97", 137  => x"F2", 138  => x"CF", 139  => x"CE", 140  => x"F0", 141  => x"B4", 142  => x"E6", 143  => x"73",
            144  => x"96", 145  => x"AC", 146  => x"74", 147  => x"22", 148  => x"E7", 149  => x"AD", 150  => x"35", 151  => x"85",
            152  => x"E2", 153  => x"F9", 154  => x"37", 155  => x"E8", 156  => x"1C", 157  => x"75", 158  => x"DF", 159  => x"6E",
            160  => x"47", 161  => x"F1", 162  => x"1A", 163  => x"71", 164  => x"1D", 165  => x"29", 166  => x"C5", 167  => x"89",
            168  => x"6F", 169  => x"B7", 170  => x"62", 171  => x"0E", 172  => x"AA", 173  => x"18", 174  => x"BE", 175  => x"1B",
            176  => x"FC", 177  => x"56", 178  => x"3E", 179  => x"4B", 180  => x"C6", 181  => x"D2", 182  => x"79", 183  => x"20",
            184  => x"9A", 185  => x"DB", 186  => x"C0", 187  => x"FE", 188  => x"78", 189  => x"CD", 190  => x"5A", 191  => x"F4",
            192  => x"1F", 193  => x"DD", 194  => x"A8", 195  => x"33", 196  => x"88", 197  => x"07", 198  => x"C7", 199  => x"31",
            200  => x"B1", 201  => x"12", 202  => x"10", 203  => x"59", 204  => x"27", 205  => x"80", 206  => x"EC", 207  => x"5F",
            208  => x"60", 209  => x"51", 210  => x"7F", 211  => x"A9", 212  => x"19", 213  => x"B5", 214  => x"4A", 215  => x"0D",
            216  => x"2D", 217  => x"E5", 218  => x"7A", 219  => x"9F", 220  => x"93", 221  => x"C9", 222  => x"9C", 223  => x"EF",
            224  => x"A0", 225  => x"E0", 226  => x"3B", 227  => x"4D", 228  => x"AE", 229  => x"2A", 230  => x"F5", 231  => x"B0",
            232  => x"C8", 233  => x"EB", 234  => x"BB", 235  => x"3C", 236  => x"83", 237  => x"53", 238  => x"99", 239  => x"61",
            240  => x"17", 241  => x"2B", 242  => x"04", 243  => x"7E", 244  => x"BA", 245  => x"77", 246  => x"D6", 247  => x"26",
            248  => x"E1", 249  => x"69", 250  => x"14", 251  => x"63", 252  => x"55", 253  => x"21", 254  => x"0C", 255  => x"7D"
           ); 
 
    constant round_coefficient : byte_matrix (9 downto 0) := (
            0 => x"01", 1 => x"02", 2 => x"04", 3 => x"08", 4 => x"10",
            5 => x"20", 6 => x"40", 7 => x"80", 8 => x"1B", 9 => x"36"
           );
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library aes_utilities;
use aes_utilities.types.all;

package functions is 
    function xtime (
        state_in : in std_logic_vector (7 downto 0))
        return std_logic_vector;
        
    function gSchedule (
        word  : in byte_matrix (3 downto 0);
        round : in integer range 0 to 9)
        return byte_matrix;
        
    function "xor" (
        left  : in byte_matrix (3 downto 0);
        right : in byte_matrix (3 downto 0))
        return byte_matrix;
        
    function matrix_xor (
        left  : in byte_matrix (15 downto 0);
        right : in byte_matrix (15 downto 0))
        return byte_matrix;
   
    function matrix_row_major (
        vector  : in std_logic_vector (127 downto 0))
        return byte_matrix;
 
    function matrix_column_major (
        vector  : in std_logic_vector (127 downto 0))
        return byte_matrix;
    
    function vectorize_row_major (
        matrix : in byte_matrix (15 downto 0))
        return std_logic_vector;
end package;

package body functions is
    function xtime (
        state_in : in std_logic_vector (7 downto 0))
        return std_logic_vector is
        variable a_mod : std_logic_vector (7 downto 0);
        
        begin
            if(state_in(7) = '0') then
                a_mod := state_in (6 downto 0) & '0';
            else
                a_mod := (state_in (6 downto 0) & '0') xor x"1B";
            end if;
            
            return a_mod;
        end function xtime;
        
    function gSchedule (
        word  : in byte_matrix (3 downto 0);
        round : in integer range 0 to 9)
        return byte_matrix is
        variable o_word : byte_matrix (3 downto 0);
        
        begin
            o_word(1) := substitution_table(to_integer(unsigned(word(2))));
            o_word(2) := substitution_table(to_integer(unsigned(word(3))));
            o_word(3) := substitution_table(to_integer(unsigned(word(0))));
            o_word(0) := substitution_table(to_integer(unsigned(word(1)))) xor round_coefficient(round);
           
            return o_word;
        end function gSchedule;
        
    function "xor" (
        left  : in byte_matrix (3 downto 0);
        right : in byte_matrix (3 downto 0))
        return byte_matrix is
        variable result : byte_matrix (3 downto 0);
        
        begin
            result(0) := left(0) xor right(0);
            result(1) := left(1) xor right(1);
            result(2) := left(2) xor right(2);
            result(3) := left(3) xor right(3);
            
            return result;
        end function "xor";
        
    function matrix_xor (
        left  : in byte_matrix (15 downto 0);
        right : in byte_matrix (15 downto 0))
        return byte_matrix is
        variable result : byte_matrix (15 downto 0);
        
        begin
            FIRST_COLUMN:
                result(0)  := left(0)  xor right(0);
                result(4)  := left(4)  xor right(1);
                result(8)  := left(8)  xor right(2);
                result(12) := left(12) xor right(3);
                
            SECOND_COLUMN:
                result(1)  := left(1)  xor right(4);
                result(5)  := left(5)  xor right(5);
                result(9)  := left(9)  xor right(6);
                result(13) := left(13) xor right(7);
                
            THIRD_COLUMN:
                result(2)  := left(2)  xor right(8);
                result(6)  := left(6)  xor right(9);
                result(10) := left(10) xor right(10);
                result(14) := left(14) xor right(11);
                
            FOURTH_COLUMN:
                result(3)  := left(3)  xor right(12);
                result(7)  := left(7)  xor right(13);
                result(11) := left(11) xor right(14);
                result(15) := left(15) xor right(15);
        
            return result;
        end function;
        
    function matrix_row_major (
        vector  : in std_logic_vector (127 downto 0))
        return byte_matrix is
        variable result : byte_matrix (15 downto 0);
        
        begin
            FIRST_COLUMN:
                result(0)  := vector(127 downto 120); 
                result(4)  := vector(119 downto 112);
                result(8)  := vector(111 downto 104); 
                result(12) := vector(103 downto 96); 
            
            SECOND_COLUMN:
                result(1)  := vector(95 downto 88);  
                result(5)  := vector(87 downto 80);  
                result(9)  := vector(79 downto 72);  
                result(13) := vector(71 downto 64);  
            
            THIRD_COLUMN:
                result(2)  := vector(63 downto 56); 
                result(6)  := vector(55 downto 48);   
                result(10) := vector(47 downto 40);   
                result(14) := vector(39 downto 32);   
            
            FOURTH_COLUMN:
                result(3)  := vector(31 downto 24);   
                result(7)  := vector(23 downto 16);   
                result(11) := vector(15 downto 8);    
                result(15) := vector(7 downto 0);     

            return result;
        end function;
 
    function matrix_column_major (
        vector  : in std_logic_vector (127 downto 0))
        return byte_matrix is
        variable result : byte_matrix (15 downto 0);
        
        begin
            FIRST_COLUMNOW:
                result(0)  := vector(127 downto 120);
                result(1)  := vector(119 downto 112);
                result(2)  := vector(111 downto 104);
                result(3)  := vector(103 downto 96);
                            
            SECOND_COLUMN:
                result(4)  := vector(95 downto 88);
                result(5)  := vector(87 downto 80);
                result(6)  := vector(79 downto 72);
                result(7)  := vector(71 downto 64);
            
            THIRD_COLUMN:
                result(8)  := vector(63 downto 56);
                result(9)  := vector(55 downto 48);
                result(10) := vector(47 downto 40);
                result(11) := vector(39 downto 32);
            
            FOURTH_COLUMN:
                result(12) := vector(31 downto 24);
                result(13) := vector(23 downto 16);
                result(14) := vector(15 downto 8);
                result(15) := vector(7 downto 0);
        
            return result;
        end function;
     
    function vectorize_row_major (
        matrix : in byte_matrix (15 downto 0))
        return std_logic_vector is
        variable result : std_logic_vector (127 downto 0);
        
        begin
            FIRST_ROW:
                result(7 downto 0)   := matrix(15);
                result(15 downto 8)  := matrix(11);
                result(23 downto 16) := matrix(7);
                result(31 downto 24) := matrix(3);

            SECOND_ROW:
                result(39 downto 32) := matrix(14);
                result(47 downto 40) := matrix(10);
                result(55 downto 48) := matrix(6);
                result(63 downto 56) := matrix(2);
            
            THIRD_ROW:
                result(71 downto 64) := matrix(13);
                result(79 downto 72) := matrix(9);
                result(87 downto 80) := matrix(5);
                result(95 downto 88) := matrix(1);
            
            FOURTH_ROW:
                result(103 downto 96)  := matrix(12);
                result(111 downto 104) := matrix(8);
                result(119 downto 112) := matrix(4);
                result(127 downto 120) := matrix(0);

            return result;
        end function;
end package body;   