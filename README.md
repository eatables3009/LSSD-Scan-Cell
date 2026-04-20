
# LSSD Scan Cell Design & Synthesis

## 📌 Overview
This project implements a **Level-Sensitive Scan Design (LSSD) scan cell**, a key building block used in **DFT (Design for Testability)** in digital VLSI systems.  
The design integrates multiplexing logic with latches to support both **functional mode** and **scan mode operation**.

---

## 🧠 Concept
LSSD is a scan-based testing technique that:
- Uses **level-sensitive latches instead of flip-flops**
- Separates **functional data path and scan path**
- Improves **testability and controllability of internal nodes**

---

## 🏗️ Architecture
The scan cell consists of:
- **2:1 Multiplexer (MUX2X1)** → Selects between functional input and scan input
- **Two Latches (LATCHX1)** → Used for master-slave style operation
- Control Signals:
  - `SE` → Scan Enable
  - `SI` → Scan Input
  - `D` → Functional Data Input
  - `CLK` → Clock signals

---

## ⚙️ Tools & Technology
- **Tool Used:** Cadence Genus Synthesis
- **Technology Library:** SAED 90nm
- **Operating Condition:** Nominal (Balanced Tree)
- **Wireload Mode:** Enclosed

---

## 📊 Synthesis Results

### Area
- Total Cell Area: **55.296 μm²**
- Cell Count: **3 instances**

### Power Breakdown
- Leakage Power: **298.836 nW**
- Internal Power: **1576.465 nW**
- Switching Power: **3684.626 nW**
- Total Power: **~3.98 μW**

### Power Distribution
- Switching Power dominates (~53%)
- Internal Power (~39%)
- Leakage Power (~7.5%)

---

## ⏱️ Timing Analysis
- Path Delay: **87 ps**
- Slack: **0 ps (timing met)**
- No setup/hold violations observed

---

## 🔍 Key Observations
- The design meets timing constraints with **zero slack margin**
- Power is dominated by **switching activity**
- Minimal area footprint due to **compact latch-based design**
- Suitable for **scan chain integration in larger systems**

---

## 🧪 Functionality
The scan cell operates in two modes:

### Functional Mode (SE = 0)
- Normal data (`D`) propagates through the latches

### Scan Mode (SE = 1)
- Scan input (`SI`) is shifted through the scan chain

---

## 📈 Applications
- Design for Testability (DFT)
- Scan chain insertion
- Fault detection in VLSI circuits
- Manufacturing testing

---

## 🚀 Future Improvements
- Add **clock gating for power reduction**
- Extend to **multi-bit scan chains**
- Implement **scan compression techniques**
- Perform **post-layout analysis**

---

## 📂 Files Included
- `lssd_cell.sv` → SystemVerilog design
- Synthesis reports:
  - Area report
  - Power report
  - Timing report
- Waveform outputs

---

## 🏁 Conclusion
This project demonstrates a **fully functional and synthesizable LSSD scan cell**, validated through timing, area, and power analysis, making it suitable for integration into larger DFT-enabled digital systems.
