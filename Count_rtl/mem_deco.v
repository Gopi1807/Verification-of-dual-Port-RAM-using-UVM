//File Name:       ram_if.sv  
//Author Name:    Gopi Chand Ananthu

module mem_deco(
    // Inputs
    input mem_in1,
    input mem_in0,
    // Outputs
    output reg mem_out_0,
    output reg mem_out_1,
    output reg mem_out_2,
    output reg mem_out_3
);

always@(mem_in1, mem_in0) begin
    case ({mem_in1, mem_in0})
        2'b00 : {mem_out_3,mem_out_2,mem_out_1,mem_out_0} = 4'b0001;
        2'b01 : {mem_out_3,mem_out_2,mem_out_1,mem_out_0} = 4'b0010;
        2'b10 : {mem_out_3,mem_out_2,mem_out_1,mem_out_0} = 4'b0100;
        2'b11 : {mem_out_3,mem_out_2,mem_out_1,mem_out_0} = 4'b1000;
        default: {mem_out_3,mem_out_2,mem_out_1,mem_out_0} = 4'b0000; // Default case to handle unexpected inputs
    endcase
end     

endmodule
