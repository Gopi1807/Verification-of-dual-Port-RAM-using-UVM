class read_xtn extends uvm_sequence_item
'uvm_object_utils (read_xtn);

rand bit [31:0] data;
rand bit [31:0] address;
rand bit read;
rand addr_t xtn_type;
rand bit [31:0] xtn_delay;

constraint a_1 {address inside {[0:200]};}
constraint a_2 {xtn_type dist {BAD_XTN:= 2, GOOD_XTN:=30};}

function new(string name = "read_xtn");
    super.new(name);
endfunction:new

function void do_copy(uvm_object rhs);
    read_xtn rhs_;
    
    if  (!$cast(rhs_, rhs)) begin
        `uvm_fatal("do_copy", "cast of the rhs object failed")
    end
    super.do_copy(rhs);
    data = rhs_.data;
    address = rhs_.address;
    read = rhs_.read;
    xtn_type = rhs_.xtn_type;
    xtn_delay = rhs_.xtn_delay;
endfunction:do_copy

function bit do_compare(uvm_object rhs,uvm_comparer comparer);
   read_xtn rhs_;

   if (!$cast(rhs_, rhs)) begin
         `uvm_fatal("do_compare", "cast of the rhs object failed")
         return 0;
    end

    return super.do_compare(rhs, comparer) && 
              (data == rhs_.data) &&
              (address == rhs_.address) &&
              (read == rhs_.read) &&
              (xtn_type == rhs_.xtn_type) &&
              (xtn_delay == rhs_.xtn_delay));
endfunction:do_compare

function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field("data", this.data,64, UVM_DEC);
    printer.print_field("address", this.address, 12 , UVM_DEC);
    printer.print_field("read",this.read, 1,UVM_DEC);
    printer.print_field("xtn_type", this.xtn_type, 8, UVM_DEC);
    printer.print_field("xtn_delay", this.xtn_delay, 32, UVM_DEC);
endfunction: do_print

function void post_randomize();
    if (xtn_type == BAD_XTN) begin
    begin
        this.address = 6000;
    end
endfunction : post_randomize

endclass :  read_xtn



