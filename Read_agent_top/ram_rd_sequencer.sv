class ram_rd_sequencer extends uvm_sequencer #(read_xtn);
'uvm_component_utils(ram_rd_sequencer)

function new(string name = "ram_rd_sequencer",uvm_component parent)
    super.new(name,parent);
endfunction

endclass