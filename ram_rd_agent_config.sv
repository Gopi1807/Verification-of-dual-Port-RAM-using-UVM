class ram_agent_config extends uvm_object;
   'uvm_object_utils(ram_agent_config) ;

   virtual ram_if vif;

bit has_input_agent;
//bit has_output_agent;
bit has_scoreboard;   
uvm_active_passive_enum is_active = UVM_ACTIVE
static int mon_rcvd_xtn_cnt = 0;
static int drv_data_sent_cnt = 0;

function new(name ="ram_agent_config");
    super.new(name)
endfunction

endclass


