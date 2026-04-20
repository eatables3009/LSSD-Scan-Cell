module lssd_cell (
    input  logic D, SI, A, B, SE, 
    output logic Q
);

    // Internal Master Latch Signal
    logic L1;

    // Master Latch (Clocked by A)
    // Infers a level-sensitive latch with a muxed input
    always @(A or D or SI or SE) begin
        if (A) begin
            if (SE)
                L1 = SI; // Scan Mode
            else
                L1 = D;  // Normal Mode
        end
    end

    // Slave Latch (Clocked by B)
    // Q captures L1 when B is high
    always @(B or L1) begin
        if (B)
            Q = L1;
    end

endmodule
