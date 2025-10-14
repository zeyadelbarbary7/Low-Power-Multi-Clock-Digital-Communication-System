# ⚡ Low Power Multi-Clock Digital Communication System

### 🧠 Overview
This project implements a **low-power digital communication system** operating on **multiple clock domains**, designed entirely in **Verilog HDL**.  
The system supports UART-based communication with synchronized data transfer between clock domains, an ALU for computation, and a configurable register file.  
It’s a complete ASIC-style design covering RTL, verification, synthesis, and gate-level simulation.

---

## 🧩 System Architecture

### 🔸 Clock Domain 1 (REF_CLK – 50 MHz)
- **RegFile** – Configurable register file storing operands and control values.  
- **ALU** – Executes arithmetic and logic operations.  
- **Clock Gating** – Enables/disables clocks for low-power operation.  
- **SYS_CTRL** – Core control unit handling command decoding and data routing.

### 🔸 Clock Domain 2 (UART_CLK – 3.6864 MHz)
- **UART_TX** – Transmits serial frames to the master.  
- **UART_RX** – Receives serial frames from the master.  
- **PULSE_GEN** – Generates timing pulses.  
- **Clock Divider** – Generates lower-frequency UART clocks.

### 🔸 Synchronization Blocks
- **RST Synchronizer** – Safely synchronizes asynchronous reset signals.  
- **Data Synchronizer** – Manages safe multi-bit data transfer between clock domains.  
- **ASYNC FIFO** – Buffers data between REF_CLK and UART_CLK domains.

---

## ⚙️ Supported Operations

### 🔹 ALU Operations
Addition • Subtraction • Multiplication • Division • AND • OR • NAND • NOR • XOR • XNOR •  
Compare (A = B) • Compare (A > B) • Shift Right (A >> 1) • Shift Left (A << 1)

### 🔹 Register File Operations
- Register File **Write**  
- Register File **Read**

---

## 🧾 UART Commands

| Command Type | Code  | Frames | Description |
|:-------------:|:-----:|:------:|:------------|
| Register Write | `0xAA` | 3 | Write data to register file |
| Register Read  | `0xBB` | 2 | Read data from register file |
| ALU with Operands | `0xCC` | 4 | Perform ALU operation using operands |
| ALU without Operands | `0xDD` | 2 | Perform ALU operation using stored values |

---

## 🔄 Sequence of Operation

1. **Initialization** — System configuration via Register File (addresses `0x2` and `0x3`).  
2. **Command Reception** — Master sends UART frames to the RX interface.  
3. **Processing** — `SYS_CTRL` decodes the command and triggers the ALU or RegFile.  
4. **Result Transmission** — Processed data is sent back through `UART_TX`.  
5. **Clock & Data Synchronization** — Ensured through synchronizers and asynchronous FIFO.

---

## 🧠 System Specifications

| Parameter | Description |
|:-----------|:-------------|
| REF_CLK | 50 MHz reference clock |
| UART_CLK | 3.6864 MHz UART clock |
| Division Ratio | Configurable via RegFile (`REG3`) |
| Parity & Prescale | Configurable via RegFile (`REG2`) |

---

## 🧰 Tools Used
- **ModelSim / QuestaSim** – RTL and gate-level simulation  
- **Synopsys Design Compiler** – Synthesis  
- **Cadence Genus / Innovus** – Physical design & place-and-route  
- **Tetramax / DFT Compiler** – Scan insertion and test verification  

---

## 📂 Repository Structure

Low-Power-Multi-Clock-Digital-Communication-System/
│
├── RTL/ # All Verilog RTL source files
│ ├── alu.v
│ ├── regfile.v
│ ├── sys_ctrl.v
│ ├── uart_tx.v
│ ├── uart_rx.v
│ ├── async_fifo.v
│ ├── data_sync.v
│ ├── rst_sync.v
│ ├── clock_divider.v
│ ├── pulse_gen.v
│ ├── clock_gating.v
│ └── sys_top.v
│
├── docs/
│ ├── Final_System.pdf
│ └── block_diagram.png
│
├── tb/ # Testbench and verification files
│ └── tb_sys_top.v
│
├── synthesis/
│ ├── scripts/
│ ├── reports/
│ └── netlist/
│
├── dft/
│ └── scan_insertion/
│
├── gate_level/
│ └── post_synth_netlist.v
│
└── README.md

---

## 🔬 Verification & Testing
- Simulated using **ModelSim/QuestaSim**.  
- Verified UART communication flow, ALU results, and CDC correctness.  
- Includes testbench for automated command-response validation.

---

## 👨‍💻 Author
**Zeyad Elbarbary**  
Computer and Systems Engineering Student, Ain Shams University  
📧 [zeyadelbarbary7@gmail.com](mailto:zeyadelbarbary7@gmail.com)

---

## 🪪 License
This project is released under the **MIT License** – free to use, modify, and distribute with credit.

---
> ⭐ If you find this project useful, consider starring the repository!
