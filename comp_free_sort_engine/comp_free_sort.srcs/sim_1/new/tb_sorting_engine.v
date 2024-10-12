`timescale 1ns / 1ps

module tb_sorting_engine();

    // Testbench signals
    reg clk, rst, start;
    reg [7:0] Data_in1, Data_in2, Data_in3, Data_in4, Data_in5, Data_in6, Data_in7, Data_in8;
    wire [2:0] LED_addr;
    wire ready, done_tick;

    // Instantiate the sorting engine
    sorting_engine uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .Data_in1(Data_in1),
        .Data_in2(Data_in2),
        .Data_in3(Data_in3),
        .Data_in4(Data_in4),
        .Data_in5(Data_in5),
        .Data_in6(Data_in6),
        .Data_in7(Data_in7),
        .Data_in8(Data_in8),
        .LED_addr(LED_addr),
        .ready(ready),
        .done_tick(done_tick)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        start = 0;
        Data_in1 = 8'h00;
        Data_in2 = 8'h00;
        Data_in3 = 8'h00;
        Data_in4 = 8'h00;
        Data_in5 = 8'h00;
        Data_in6 = 8'h00;
        Data_in7 = 8'h00;
        Data_in8 = 8'h00;

        // Reset sequence
        #10 rst = 0; // Deassert reset after 10ns

        // Test case 1: Random input data
        #10;
        Data_in1 = 8'hA5;  // 165
        Data_in2 = 8'h3C;  // 60
        Data_in3 = 8'hF2;  // 242
        Data_in4 = 8'h1E;  // 30
        Data_in5 = 8'hD4;  // 212
        Data_in6 = 8'h6B;  // 107
        Data_in7 = 8'h9A;  // 154
        Data_in8 = 8'h47;  // 71

        // Start the sorting process
        #10 start = 1;


        // Wait for the sorting to complete
        wait(done_tick == 1);

        // Check sorted result using LED_addr (indicates largest element)
        $display("Largest element address: %d", LED_addr);

        // Test case 2: Another input data set
        #20;
        Data_in1 = 8'h15;  // 21
        Data_in2 = 8'h2A;  // 42
        Data_in3 = 8'h1B;  // 27
        Data_in4 = 8'h7D;  // 255
        Data_in5 = 8'hFF;  // 125
        Data_in6 = 8'h4E;  // 78
        Data_in7 = 8'h90;  // 144
        Data_in8 = 8'h08;  // 8

        // Start the sorting process
        #10 start = 1; // Deassert start after one clock cycle

        // Wait for the sorting to complete
        wait(done_tick == 1);

        // Check sorted result using LED_addr (indicates largest element)
        $display("Largest element address: %d", LED_addr);

        // Finish the simulation
        #200000;
        $finish;
    end
endmodule