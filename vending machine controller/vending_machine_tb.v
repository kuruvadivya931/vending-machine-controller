`timescale 1ns/1ps

module vending_machine_tb;

    reg clk;
    reg reset;
    reg coin_5;
    reg coin_10;

    wire dispense;
    wire change;

    // Instantiate DUT
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin_5(coin_5),
        .coin_10(coin_10),
        .dispense(dispense),
        .change(change)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task to insert Rs.5
    task insert_5;
    begin
        coin_5 = 1'b1;
        coin_10 = 1'b0;
        #10;
        coin_5 = 1'b0;
    end
    endtask

    // Task to insert Rs.10
    task insert_10;
    begin
        coin_5 = 1'b0;
        coin_10 = 1'b1;
        #10;
        coin_10 = 1'b0;
    end
    endtask

    initial begin

        clk = 0;
        reset = 1;
        coin_5 = 0;
        coin_10 = 0;

        #10;
        reset = 0;

        // Test 1: Rs.5 + Rs.10 = Rs.15
        $display("Test 1: Inserting Rs.5 + Rs.10");
        insert_5;
        insert_10;

        #10;

        // Test 2: Rs.10 + Rs.5 = Rs.15
        $display("Test 2: Inserting Rs.10 + Rs.5");
        insert_10;
        insert_5;

        #10;

        // Test 3: Rs.10 + Rs.10 = Rs.20
        $display("Test 3: Inserting Rs.10 + Rs.10");
        insert_10;
        insert_10;

        #20;

        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | Reset=%b | Coin5=%b | Coin10=%b | Dispense=%b | Change=%b",
                 $time, reset, coin_5, coin_10, dispense, change);
    end

endmodule