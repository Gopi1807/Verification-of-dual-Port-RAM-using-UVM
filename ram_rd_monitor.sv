class ram_rd_monitor extends uvm_monitor;
  'uvm_component_utils(ram_rd_monitor);

  ram_if.read_mon vif;
  ram_rd_agent_config m_cfg;
  uvm_analysis_port #(read_xtn) monitor_port;


function new(name = "ram_rd_monitor", uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(ram_rd_agent_config):: get(this,"","ram_rd_agent_config",m_cfg));
    `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
    monitor_port = new("monitor_port",this);
endfunction

function void connect_phase(uvm_phase phase);
    vif = m_cfg.vif;
endfunction

 task run_phase(uvm_phase phase);
   forever
   collect_data();
 endtask

 task collect_data();
   read_xtn data_sent;
   data_sent = read_xtn :: type_id :: create ("data_sent");
   @(posedge vif.read_monitor_cb.read);
   data_sent.read = vif.read_monitor_cb.read;
   data_sent.address = vif.read_monitor_cb.address;
   data_sent.xtn_type = (data_sent.address == 'd1904) ? BAD_XTN : GOOD_XTN;
 endtask

 function void report_phase(uvm_phase phase);
   'uvm_info(get_type_name(), $sformatf("Ram read controlled transactions %od transactions",m_cfg.mon_rcvd_xtn_cnt),UVM_LOW)
 endfunction

endclass




