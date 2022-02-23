library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Pluggable tester for a RCAsx.
entity RCAsx_Tester is
    generic (n: positive range 1 to 32);
    port
    ( a, b : out std_logic_vector(n-1 downto 0)
    ; ci   : out std_logic
    ; s    : in  std_logic_vector(n downto 0)
    );
end entity;

architecture Exhaustive of RCAsx_Tester is
    -- Input range.
    subtype RCAsx_input is integer range (-2 ** (n-1))
                                      to ((2 ** (n-1)) - 1);
begin
    process
    begin
        for i in RCAsx_input loop
            for j in RCAsx_input loop
                for k in 0 to 1 loop
                    a  <= std_logic_vector(to_signed(i, n));
                    b  <= std_logic_vector(to_signed(j, n));
                    ci <= '0' when k = 0 else '1';

                    wait for 1 ns;
                    assert s = std_logic_vector(to_signed(i + j + k, n + 1))
                        report "wrong output"
                        severity error;
                end loop;
            end loop;
        end loop;

        wait;
    end process;
end architecture;
