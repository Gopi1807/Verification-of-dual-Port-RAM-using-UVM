//File Name:       ram_if.sv  
//Author Name:    Gopi Chand Ananthu

interface ram_if(input bit clk);

logic [63:0] data_in;       
logic [11:0] read_address;
logic [11:0] write_address;
logic read_enable;
logic write_enable;
logic clk;

wire [63:0] data_out;

modport DUV(input data_in, input read_address,
            input write_address, input read_enable,
            input write_enable, output data_out);


// Write Driver Clocking block
clocking write_cb@(posedge clk);
default input #1 output #1;
output data_in;
output write_address;
output write_enable;
endclocking

// Read Driver Clocking block
clocking rd_cb@(posedge clk);
default input #1 output #1;
output read_address;
output read_enable;
input data_out;
endclocking

// Write Monitor Clocking 
clocking write_monitor_cb@(negedge clk);    
default input #1 output #1;
input data_in;
input write_address;
input write_enable;
endclocking

// Read Monitor Clocking 
clocking read_monitor_cb@(negedge clk);
default input #1 output #1;
input data_out;
input read_address;
input read_enable;
endclocking

//Instatiating the MODPORT for DUV
modport Read_Dr(clocking rd_cb);
modport Write_DR(clocking write_cb);
modport read_mon(clocking rd_cb);
modport write_mon(clocking write_monitor_cb);

endinterface



