//File Name:       ram_soc.sv  
//Author Name:    Gopi Chand Ananthu

module ram_soc (ram_if.DUV mif0,
                 ram_if.DUV mif1,
                 ram_if.DUV mif2,
                 ram_if.DUV mif3);
                 
ram_chip MB1 (.mif(mif0));
ram_chip MB2 (.mif(mif1));
ram_chip MB3 (.mif(mif2));
ram_chip MB4 (.mif(mif3));

endmodule 