library verilog;
use verilog.vl_types.all;
entity stateMachine_vlg_check_tst is
    port(
        current_state   : in     vl_logic_vector(3 downto 0);
        student_id      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end stateMachine_vlg_check_tst;
