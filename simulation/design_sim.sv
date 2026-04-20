// =============================================================
// Simulation Models for SAED 90nm Cells
// (Required for EDA Playground simulation)
// =============================================================

// Model for the MUX21X1 Gate
module MUX21X1 (input IN1, input IN2, input S, output Q);
    assign Q = S ? IN2 : IN1;
endmodule

// Model for the LATCHX1 Gate (Level-Sensitive Latch)
module LATCHX1 (input CLK, input D, output reg Q, output QN);
    always @(CLK or D) begin
        if (CLK) begin
            Q <= D;
        end
    end
    assign QN = !Q;
endmodule

// =============================================================
// Your Synthesized Netlist (lssd_cell)
// =============================================

module lssd_cell(D, SI, A, B, SE, Q);
  input D, SI, A, B, SE;
  output Q;
  wire D, SI, A, B, SE;
  wire Q;
  wire L1, UNCONNECTED, UNCONNECTED0, n_0;

  // Slave Latch (Output Q)
  LATCHX1 Q_reg(.CLK (B), .D (L1), .Q (Q), .QN (UNCONNECTED));

  // Master Latch (Internal L1)
  LATCHX1 L1_reg(.CLK (A), .D (n_0), .Q (L1), .QN (UNCONNECTED0));

  // Input Selection Mux (Scan or Data)
  MUX21X1 g35__2398(.IN1 (D), .IN2 (SI), .S (SE), .Q (n_0));

endmodule
