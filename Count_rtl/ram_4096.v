module ram_4096(
   input   clk,
   input  [11 : 0] data_in,
   input  [11 : 0] read_address,
   input  [11 : 0] write_address,
   input  read_enable,
   input  write_enable,
   output reg  data_out
);

wire mem_wr0,
      mem_wr1,
      mem_wr2,
      mem_wr3;

 wire mem_rd0,
      mem_rd1,
      mem_rd2,
      mem_rd3;

mem_deco write_add_dec (
    .mem_in_1 (write_address[11]),
    .mem_in_0 (write_address[10]),
    .mem_out_3 (mem_wr0),
    .mem_out_2 (mem_wr1),
    .mem_out_1 (mem_wr2),
    .mem_out_0 (mem_wr3)
    );

mem_deco read_add_dec (
    .mem_in_1 (read_address[11]),
    .mem_in_0 (read_address[10]),
    .mem_out_3 (mem_rd0),
    .mem_out_2 (mem_rd1),
    .mem_out_1 (mem_rd2),
    .mem_out_0 (mem_rd3)    
);

dual_mem DM_0 (
    .clk  (clk),
    .memory_enable (mem_wr0),
    .operation_enable (mem_rd0),
    .data_in(data_in),
    .read_address (read_address[9:0]),
    .write_address(write_address[9:0]),
    .read(read_enable),
    .write(write_enable),
    .data_out(data_out)
);

dual_mem DM_1 (
    .clk  (clk),
    .memory_enable (mem_wr1),
    .operation_enable (mem_rd1),
    .data_in(data_in),
    .read_address (read_address[9:0]),
    .write_address(write_address[9:0]),
    .read(read_enable),
    .write(write_enable),
    .data_out(data_out)
);

dual_mem DM_2(
    .clk(clk),
    .memory_enable(mem_wr2),
    .operation_enable(mem_rd2),
    .data_in(data_in),
    .read_address(read_address[9:0]),
    .write_address(write_address[9:0]),
    .read_enable(read_enable),
    .write_enable(write_enable),
    .data_out(data_out)
);
dual_mem DM_3(
    .clk(clk),
    .memory_enable(mem_wr3),
    .operation_enable(mem_rd3),
    .data_in(data_in),
    .read_address(read_address[9:0]),
    .write_address(write_address[9:0]),
    .read_enable(read_enable),
    .write_enable(write_enable),
    .data_out(data_out)
);

endmodule
