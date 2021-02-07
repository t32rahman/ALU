library verilog;
use verilog.vl_types.all;
entity decoder4to16 is
    port(
        s               : in     vl_logic_vector(3 downto 0);
        En1             : in     vl_logic;
        OP              : out    vl_logic_vector(15 downto 0)
    );
end decoder4to16;
