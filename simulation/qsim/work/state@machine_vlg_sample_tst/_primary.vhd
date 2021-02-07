library verilog;
use verilog.vl_types.all;
entity stateMachine_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end stateMachine_vlg_sample_tst;
