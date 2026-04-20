`timescale 1ns/1ps

module tb_lssd;
    // Inputs
    reg D, SI, A, B, SE;
    // Outputs
    wire Q;

    // Instantiate the Unit Under Test (UUT)
    lssd_cell uut (
        .D(D), 
        .SI(SI), 
        .A(A), 
        .B(B), 
        .SE(SE), 
        .Q(Q)
    );

    // Initial block for waveform generation
    initial begin
        $dumpfile("dump.vcd"); // Standard name for EDA Playground
        $dumpvars(0, tb_lssd);
        
        // --- Initialize Inputs ---
        D = 0; SI = 0; SE = 0; A = 0; B = 0;
        #10;

        // --- TEST 1: Normal Data Path (SE = 0) ---
        $display("Testing Normal Data Path...");
        D = 1;         // Set data
        #10 A = 1;     // Pulse Master Clock (A)
        #10 A = 0;
        #10 B = 1;     // Pulse Slave Clock (B)
        #10 B = 0;     // Q should now be 1
        
        // --- TEST 2: Scan Path (SE = 1) ---
        $display("Testing Scan Path...");
        #10 SE = 1; SI = 0; D = 1; // SI is 0, D is 1. Since SE=1, Q should become 0.
        #10 A = 1;     // Pulse Master Clock
        #10 A = 0;
        #10 B = 1;     // Pulse Slave Clock
        #10 B = 0;     // Q should now be 0

        #50;
        $display("Simulation Finished");
        $finish;
    end

endmodule
