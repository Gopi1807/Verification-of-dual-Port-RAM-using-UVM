class write_xtn extends uvm_sequence_item;
  'uvm_object_utils(write_xtn);

rand bit [63:0] data;
rand bit [11:0] address;
rand bit write;
rand addr_t xtn_type;
rand bit [63:0] xtn_delay;
static int no_of_xtn;

constraint a_1 {data inside {[20:90]};}
constraint a_2 {address inside {[0:200];}
constraint a_3 {xtn_type dist {BAD_XTN := 2, GOOD_XTN := 30};}


function new(string name = "write_xtn");
   super.new(name);
endfunction

function void write_xtn :: do_copy (uvm_object rhs);
write_xtn rhs_;

if (!$cast(rhs_,rhs)) begin)
'uvm_fatal("do_copy","cast of rhs object failed")
end
super.do_copy(rhs);
data = rhs_.data;
address = rhs_.address;
write = rhs_.write;
xtn_type = rhs_.xtn_type;
xtn_delay = rhs_.xtn_delay;
endfunction : do_copy

function bit do_compare (uvm_object rhs,uvm_comparer);
write_xtn rhs_;

if (!$cast(rhs_,rhs)) begin
    'uvm_fatal("do_compare","cast of the rhs object failed")
    return 0;
end

return super.do_compare(rhs,comparer) &&
data == rhs_.data &&
address == rhs_.address &&
write == rhs_.write &&
xtn_type == rhs_.xtn_type &&
xtn_delay == rhs_xtn_delay;
endfunction : do_compare

function void do_print(uvm_printer printer);
super.do_print(printer);
printer.print_field("data",this.data,64,UVM_DEC);
printer.print_field("address",this.address,12,UVM_DEC);
printer.print_field("write",this.write,1,UVM_DEC);
printer.print_field("xtn_delay",this.xtn_delya,65,UVM_DEC);
endfunction: do_print


function post_randomize();
no_of_xtn++;
'uvm_info("Randomized data",$sformatf("Randomized transaction is [%0d] transactions",no_of_xtn,this.sprint(),UVM_MEDIUM));
endfunction

endclass: write_xtn