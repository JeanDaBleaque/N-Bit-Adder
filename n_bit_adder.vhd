library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_adder is
generic (
N : integer := 8
);
port (
a_i : in std_logic_vector (N-1 downto 0);
b_i : in std_logic_vector (N-1 downto 0);
carry_i : in std_logic;
sum_o : out std_logic_vector (N-1 downto 0);
carry_o : out std_logic
);
end n_bit_adder;

architecture N_Bit_Adder of n_bit_adder is

component full_adder is
port (
a_i : in std_logic;
b_i : in std_logic;
carry_i : in std_logic;
sum_o : out std_logic;
carry_o : out std_logic
);
end component;

signal temp : std_logic_vector (N downto 0) := (others => '0');

begin

temp(0) <= carry_i;
carry_o <= temp(N);

Full_Adders: for i in 0 to N-1 generate
	full_adder_i : full_adder
	port map (
	a_i => a_i(i),
	b_i => b_i(i),
	carry_i => temp(i),
	sum_o => sum_o(i),
	carry_o => temp(i+1)
	);
end generate;
end N_Bit_Adder;