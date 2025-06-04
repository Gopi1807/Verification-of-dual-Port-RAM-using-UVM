module dual_mem(
    input clk,
    input memory_enable,
    input operation_enable,
    input [63:0] data_in,
    input [9:0] read_address,
    input [9:0] write_address,
    input read,
    input write,
    output reg [63:0] data_out
);

reg [63:0] memory [1023:0];

always@(posedge clk) begin
    // Write operation
    // If memory is enabled and write is requested, write data to the specified address
    if ((memory_enable) && (write)) begin
       memory[write_address] <= data_in;
    end
    // If memory is enabled and read is requested, read data from the specified address
    // If operation is enabled, output the data from the specified address
    
    if ((operation_enable && (read))) begin
        data_out <= memory[read_address];
    end else begin
        data_out <= 64'bzz;
    end
end

endmodule