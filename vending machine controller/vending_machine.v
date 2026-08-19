module vending_machine (
    input  wire clk,
    input  wire reset,
    input  wire coin_5,
    input  wire coin_10,
    output reg  dispense,
    output reg change
);

    // States representing inserted amount
    parameter S0  = 2'b00;  // Rs.0
    parameter S5  = 2'b01;  // Rs.5
    parameter S10 = 2'b10;  // Rs.10

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = state;

        case (state)

            S0: begin
                if (coin_5)
                    next_state = S5;
                else if (coin_10)
                    next_state = S10;
            end

            S5: begin
                if (coin_5)
                    next_state = S10;
                else if (coin_10)
                    next_state = S0;
            end

            S10: begin
                if (coin_5 || coin_10)
                    next_state = S0;
            end

            default:
                next_state = S0;

        endcase
    end

    // Output logic
    always @(*) begin
        dispense = 1'b0;
        change   = 1'b0;

        case (state)

            S10: begin
                if (coin_5) begin
                    dispense = 1'b1;
                end
                else if (coin_10) begin
                    dispense = 1'b1;
                    change   = 1'b1;
                end
            end

            S5: begin
                if (coin_10) begin
                    dispense = 1'b1;
                end
            end

            default: begin
                dispense = 1'b0;
                change   = 1'b0;
            end

        endcase
    end

endmodule