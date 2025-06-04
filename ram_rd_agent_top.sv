class ram_rd_agent_env extends uvm_env
'uvm_component_utils(ram_rd_agent)

function new (name = "ram_rd_agent_env", uvm_component parent);
      super.new(name,parent)
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
agnh = ram_rd_agent :: type_id :: create ("ram_rd_agent",this);
endfunction

task  report_phase(uvm_phase phase);
     uvm_top.print_topology;
endtask

endclass