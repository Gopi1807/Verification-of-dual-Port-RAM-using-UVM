//File Name:       ram_chip.sv  
//Author Name:    Gopi Chand Ananthu

module ram_chip (ram_if.DUV mif);

    ram_4096 ram (
        .clk(mif.clk),
        .data_in(mif.data_in),
        .read_address(mif.read_address),
        .write_address(mif.write_address),
        .read_enable(mif.read_enable),
        .write_enable(mif.write_enable),
        .data_out(mif.data_out));
endmodule