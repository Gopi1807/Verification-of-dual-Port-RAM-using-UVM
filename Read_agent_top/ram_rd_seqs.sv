class ram_base_read_seq extends uvm_sequence #(read_xtn);
'uvm_object_utils(ram_base_read_seq)

function new (string name = "ram_base_read_seq");
     super.new(ram_base_read_seq);
endfunction

endclass

class ram_single_addr_rd_xtns extends ram_base_read_seq;
'uvm_object_utils(ram_single_addr_rd_xtns);

function new (sting name = "ram_single_addr_rd_xtns" );
    super.new(ram_single_addr_rd_xtns);
endfunction

task body();
 begin
    req = read_xtn :: type_id :: create("req");
    start_item(req);
    assert(req.randomize() with {address == 55;});
    'uvm_info("RAM_RD_SEQUENCE",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
    finish_item(req);
 end
endtask

endclass

class ram_ten_read_xtns extends ram_base_read_seq;
'uvm_object_utils(ram_ten_read_xtns);

function new (string name = "ram_ten_read_xtns");
    super.new(name);
endfunction

task body();
int addr_seq;
addr_seq = 0;
repeat(10) begin
req = read_xtn :: type_id :: create("req");
start_item(req);
assert(req.randomize() with {address == addr_seq; read == 1'b1;});
'uvm_info("RAM_RD_SEQUENCE",$sformatf("printing form the sequence \n is %s",req.sprint()),UVM_HIGH)
finish_item(req);
addr_seq = addr_seq + 1;
end
endtask
endclass

class ram_odd_read_xtns extends ram_base_read_seq;
 'uvm_object_utils(ram_odd_read_xtns);

 function new(string name = "ram_odd_read_xtns");
    super.new(name);
 endfunction

 task body();
  int addr_seq;
  addr_seq = 0;
  req = read_xtn :: type_id :: create("req");
  start_item(req);
  assert(req.randomize() with {address == (2*addr_seq + 1);read = 1'b1;});
  finish_item(req);
 addr_seq  = addr_seq + 1;
 endtask

endclass

class ram_even_read_xtns extends ram_base_read_seq;
 'uvm_object_utils(ram_even_read_xtns);

 function new(string name = "ram_even_read_xtns");
    super.new(name);
 endfunction

 task body();
  int addr_seq;
  addr_seq = 0;
  req = read_xtn :: type_id :: create("req");
  start_item(req);
  assert(req.randomize() with {address == (2*addr_seq);read = 1'b1;});
  finish_item(req);
 addr_seq  = addr_seq + 1;
 endtask

endclass
