# ⚡ Low Power Multi-Clock Digital Communication System

### 🧠 Overview
This project implements a **low-power digital communication system** operating on **multiple clock domains**, designed entirely in **Verilog HDL**.  
The system supports UART-based communication with synchronized data transfer between clock domains, an ALU for computation, and a configurable register file.  
It’s a complete ASIC-style design covering RTL, verification, synthesis, and gate-level simulation.

---

## 🖼️ Design Visuals

### 🧱 System Block Diagram
The following diagram illustrates the main structure of the **Low Power Multi-Clock Digital Communication System**:

<p align="center">
  <img src="docs/block_diagram.png" alt="Block Diagram" width="700"/>
</p>

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
- **ModelSim** – RTL and gate-level simulation  
- **Synopsys Design Compiler**

---

## 🔬 Verification & Testing
- Simulated using **ModelSim**.  
- Verified UART communication flow, ALU results, and CDC correctness.  
- Includes testbench for automated command-response validation.

---

### 📊 Simulation Waveform
Waveform output showing UART transmission, ALU result validation, and clock domain synchronization:

<p align="center">
  <img src="docs/waveform.png" alt="Simulation Waveform" width="700"/>
</p>

---

### 🧾 Simulation Transcript
Below is a screenshot from the **ModelSim/QuestaSim** transcript window showing the number of passed test cases after running all verification scenarios:

<p align="center">
  <img src="docs/Transcript.png" alt="Simulation Transcript Passed Cases" width="700"/>
</p>

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
