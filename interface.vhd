library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interface is
generic (
N : integer := 8
);
port (
f_num : in std_logic_vector (7 downto 0);
s_num : in std_logic_vector (7 downto 0);
BTN : in std_logic;
LED : out std_logic_vector (8 downto 0)
);
end interface;

architecture Interface of interface is

component n_bit_adder is
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
end component;

begin

n_bit_adder_i : n_bit_adder
generic map (
N => N
)
port map (
a_i => f_num(7 downto 0),
b_i => s_num(7 downto 0),
carry_i => BTN,
sum_o => LED(7 downto 0),
carry_o => LED(8)
);
end Interface;