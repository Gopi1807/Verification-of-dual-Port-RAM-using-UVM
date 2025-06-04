class ram_rd_driver extends uvm_driver # (read_xtn);
'uvm_component_utils(ram_rd_driver);

virtual ram_if.RDR_MP vif;
ram_rd_agent_config m_cfg;

function void ram_rd_driver (string name = "ram_rd_driver", uvm_component parent);
   super.new(name, parent);
endfunction: ram_rd_driver

function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db #(ram_rd_agent_config) :: get (this, "", "ram_rd_agent_config", m_cfg))
        'uvm_fatal("CONFIG", "Cannot get() m_cfg from uvm_config_db. Have you set() it?");
endfunction

function void connect_phase(uvm_phase phase);
   vif = m_cfg.vif; 
endfunction: connect_phase

task run_phase(uvm_phase phase);
    forever begin
        read_xtn duv_xtn;
        if (!seq_item_port.get_next_item(duv_xtn)) begin
            `uvm_fatal("GET_NEXT_ITEM", "Failed to get next item from seq_item_port");
        end
        send_to_dut(dut_xtn);
        seq_item_port.item_done();
    end
endtask: run_phase

task send_to_dut(read_xtn duv_xtn);
    'uvm_info("RAM_RD_DRIVER" ,$sformatf("Printing from driver \n %s", duv_xtn.sprint()), UVM_DEC);
   repeat(5)
    @(vif.rdr_cb);

    vif.rdr_cb.address <= duv_xtn.address;
    vif.rdr_cb.read <= duv_xtn.read;

    repeat(2)
        @(vif.rdr_cb);
    duv_xtn.data = vif.rdr_cb.data_out;
    vif.rdr_cb.rd_address <= '0;
    vif.rdr_cb.read <= '0;

       repeat(5)
       @(vif.rdr_cb);
       m_cfg.drv_data_sent_cnt ++;
endtask

function void report_phase(uvm_phase phase);
 'uvm_info(get_type_name(), $sformatf("Report: RAM read driver sent %0d transactions", m_cfg.drv_data_sent_cnt), UVM_LOW)
endfunction

endclass