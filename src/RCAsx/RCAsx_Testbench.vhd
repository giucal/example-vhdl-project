library ieee;
    use ieee.std_logic_1164.all;

entity RCAsx_Testbench is
    -- Test parameters.
    constant n: positive := 8;
end entity;

architecture Plug of RCAsx_Testbench is
    component RCAsx
        generic (n: positive);
        port
        ( a, b : in  std_logic_vector(n-1 downto 0)
        ; ci   : in  std_logic
        ; s    : out std_logic_vector(n downto 0)
        );
    end component;

    component RCAsx_Tester
        generic (n: positive);
        port
        ( a, b : out std_logic_vector(n-1 downto 0)
        ; ci   : out std_logic
        ; s    : in  std_logic_vector(n downto 0)
        );
    end component;

    for CUT1: RCAsx use entity work.RCAsx(RTL);
    for CUT2: RCAsx use entity work.RCAsx(Behavior);

    signal a, b   : std_logic_vector(n-1 downto 0);
    signal ci     : std_logic;
    signal s1, s2 : std_logic_vector(n downto 0);
begin
    CUT1: RCAsx generic map (n => n)
                port map
                ( a  => a
                , b  => b
                , ci => ci
                , s  => s1
                );
    CUT2: RCAsx generic map (n => n)
                port map
                ( a  => a
                , b  => b
                , ci => ci
                , s  => s2
                );
    TESTER1: RCAsx_Tester generic map (n => n)
                          port map
                          ( a  => a
                          , b  => b
                          , ci => ci
                          , s  => s1
                          );
    TESTER2: RCAsx_Tester generic map (n => n)
                          port map
                          ( a  => a
                          , b  => b
                          , ci => ci
                          , s  => s2
                          );
end architecture;
