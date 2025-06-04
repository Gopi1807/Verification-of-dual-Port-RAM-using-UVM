class ram_rd_agent extends uvm_agent;
'uvm_component_utils(ram_rd_agent)
ram_rd_agent_config mif;
ram_rd_monitor monh;
ram_rd_driver drvh;
ram_rd_sequencer sqrh;

function new(name = "ram_rd_agent", uvm_component parent = null);
       super.new(name,parent);
endfunction

function  void built_phase(uvm_phase phase);
   super.build_phase(phase);
   if (!uvm_config_db) #(ram_rd_agent_config) :: get (this,"","ram_rd_agent_config",m_cfg);
        'uvm_fatal("CONFIG", "Cannot get m_cfg from uvm_congig_db. Have you set() it? ")
        monh =  ram_rd_monitor :: type_id :: create("monh",this)
    if (m_cfg.is_active == UVM_ACTIVE)
       begin
       drvh =  ram_rd_driver :: type_id :: create("drvh", this)
       sqrh = ram_rd_sequencer :: type_id :: create("sqrh",this)
       end
endfunction

function void connect_phase(uvm_phase phase);
    if (m_cfg.input_agent_is_active == UVM_ACTIVE)
        begin
           drvh.seq_item_port.connect(seqrh.seq_item_export);           
        end
endfunction

endclass
