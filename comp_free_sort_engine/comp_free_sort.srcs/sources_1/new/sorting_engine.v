`timescale 1ns / 1ps

module sorting_engine(
    input wire clk, rst, start,
    input wire[7:0] Data_in1, Data_in2, Data_in3, Data_in4, Data_in5, Data_in6, Data_in7, Data_in8,
    output wire[2:0] LED_addr,
    output reg ready, done_tick
);

    reg [4:0] i;
    wire [7:0] EVT, EVT_updated;
    reg [7:0] EVT_reg;
    wire [7:0] D0, D1, D2, D3, D4, D5, D6, D7;
    wire [7:0] next_in, next_out;
    reg [7:0] en_reg;
    wire [7:0] en;
    reg [2:0] LED_out_reg;
    wire [7:0] LED_in;
    wire [2:0] LED_out;
    reg LED_en_reg;
    wire LED_en;
    wire EVT_en;
    reg EVT_en_reg;
    reg EOO_reg;
    wire EOO;
    wire [7:0] LED_out_dec;
    wire [7:0] next_in1, next_in2, next_in3, next_in4, next_in5, next_in6, next_in7;

    // Assign input signals to the D buses
    assign D0 = {Data_in1[0], Data_in2[0], Data_in3[0], Data_in4[0], Data_in5[0], Data_in6[0], Data_in7[0], Data_in8[0]};
    assign D1 = {Data_in1[1], Data_in2[1], Data_in3[1], Data_in4[1], Data_in5[1], Data_in6[1], Data_in7[1], Data_in8[1]};
    assign D2 = {Data_in1[2], Data_in2[2], Data_in3[2], Data_in4[2], Data_in5[2], Data_in6[2], Data_in7[2], Data_in8[2]};
    assign D3 = {Data_in1[3], Data_in2[3], Data_in3[3], Data_in4[3], Data_in5[3], Data_in6[3], Data_in7[3], Data_in8[3]};
    assign D4 = {Data_in1[4], Data_in2[4], Data_in3[4], Data_in4[4], Data_in5[4], Data_in6[4], Data_in7[4], Data_in8[4]};
    assign D5 = {Data_in1[5], Data_in2[5], Data_in3[5], Data_in4[5], Data_in5[5], Data_in6[5], Data_in7[5], Data_in8[5]};
    assign D6 = {Data_in1[6], Data_in2[6], Data_in3[6], Data_in4[6], Data_in5[6], Data_in6[6], Data_in7[6], Data_in8[6]};
    assign D7 = {Data_in1[7], Data_in2[7], Data_in3[7], Data_in4[7], Data_in5[7], Data_in6[7], Data_in7[7], Data_in8[7]};

    // Module instantiations
    assign en = en_reg;
    assign LED_en = LED_en_reg;
    assign EVT = EVT_reg;
    assign EVT_en = EVT_en_reg;

    Block B1(D7, EVT, en[0], next_in1);
    Block B2(D6, next_in1, en[1], next_in2);
    Block B3(D5, next_in2, en[2], next_in3);
    Block B4(D4, next_in3, en[3], next_in4);
    Block B5(D3, next_in4, en[4], next_in5);
    Block B6(D2, next_in5, en[5], next_in6);
    Block B7(D1, next_in6, en[6], next_in7);
    Block B8(D0, next_in7, en[7], LED_in);

    LED L1(LED_in, LED_en, LED_out);

    decoder_3to8 DEC1(LED_out, LED_out_dec);

    EVT_update_unit EUT1(clk, LED_out_dec, EVT, EVT_updated);

    // FSM states
    localparam [3:0] IDLE = 4'b0000,
                     S1   = 4'b0001,
                     S2   = 4'b0010,
                     S3   = 4'b0011,
                     S4   = 4'b0100,
                     S5   = 4'b0101,
                     S6   = 4'b0110,
                     S7   = 4'b0111,
                     S8   = 4'b1000,
                     S9   = 4'b1001,
                     EVT_UPDATE = 4'b1010,
                     LOOP=4'b1011,
                     DONE =4'b1100;

    reg [3:0] state_reg, state_next;

    // FSM state and register initialization
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_reg <= IDLE;
            
        end else begin
            state_reg <= state_next;
        end
    end

    // FSM next state logic and output generation
    always @* begin
        state_next = state_reg;
        ready = 1'b0;
        done_tick = 1'b0;
        en_reg = 8'b0;
        LED_en_reg = 1'b0;
        EVT_en_reg = 1'b0;
        
        case(state_reg)
            IDLE: begin  
                ready = 1'b1;
                EVT_reg = 8'b11111111;  // Initialize EVT in the IDLE state
                LED_out_reg <= 3'bXXX;
                done_tick = 1'b0;
                i = 0;
                en_reg = 8'b0;
                EOO_reg= 1;
                if (start) state_next = S1;
            end
            
            S1: begin   
                en_reg = 8'b00000001;
                i = i + 1;
                if (i == 1) state_next = S2;
            end

            S2: begin   
                en_reg = 8'b00000010;
                i = i + 1;
                if (i == 2) state_next = S3;
            end
            
            S3: begin   
                en_reg = 8'b00000100;
                i = i + 1;
                if (i == 3) state_next = S4;
            end

            S4: begin   
                en_reg = 8'b00001000;
                i = i + 1;
                if (i == 4) state_next = S5;
            end

            S5: begin   
                en_reg = 8'b00010000;
                i = i + 1;
                if (i == 5) state_next = S6;
            end

            S6: begin   
                en_reg = 8'b00100000;
                i = i + 1;
                if (i == 6) state_next = S7;
            end

            S7: begin   
                en_reg = 8'b01000000;
                i = i + 1;
                if (i == 7) state_next = S8;
            end

            S8: begin   
                en_reg = 8'b10000000;
                i = i + 1;
                state_next = S9;
            end

            S9: begin
                LED_en_reg = 1'b1;
                LED_out_reg = LED_out;
                state_next = EVT_UPDATE;
            end

            EVT_UPDATE: begin
                EVT_en_reg = 1'b1;  // Enable EVT update unit
                EVT_reg <= EVT_updated;
                //EVT_reg=EVT_updated;
                EOO_reg = |(EVT_updated);  // Check if EVT is non-zero
                
                state_next=LOOP;
            end
            
            LOOP: begin
                    if (EOO_reg) begin
                    i=0; 
                    state_next = S1;  // If EVT is non-zero, continue sorting
                    end
                else 
                    state_next = DONE;  // If EVT is zero, sorting is done
                  end

            DONE: begin
                done_tick = 1'b1;
                state_next = IDLE;
            end
            
            default: state_next = IDLE;
        endcase
    end

    assign LED_addr = LED_out_reg;
    assign EOO=EOO_reg;

endmodule
