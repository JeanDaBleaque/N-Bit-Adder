library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port (
a_i : in std_logic;
b_i : in std_logic;
carry_i : in std_logic;
sum_o : out std_logic;
carry_o : out std_logic
);
end full_adder;

architecture Full_Adder of full_adder is

component half_adder is
port (
a_i : in std_logic;
b_i : in std_logic;
sum_o : out std_logic;
carry_o : out std_logic
);
end component;

signal f_sum : std_logic := '0';
signal f_carry : std_logic := '0';
signal s_carry : std_logic := '0';

begin

f_half_adder : half_adder
port map (
a_i => a_i,
b_i => b_i,
sum_o => f_sum,
carry_o => f_carry
);

s_half_adder : half_adder
port map (
a_i => f_sum,
b_i => carry_i,
sum_o => sum_o,
carry_o => s_carry
);

carry_o <= f_carry or s_carry;

end Full_Adder;