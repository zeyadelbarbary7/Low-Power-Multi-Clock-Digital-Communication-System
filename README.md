# Low Power Multi-Clock Digital Communication System

## Overview
A Verilog-based ASIC project implementing a **low-power multi-clock digital communication system**.  
It supports UART-based command communication between a master and a custom processing system with an ALU and register file.

## 🔧 System Description
The system operates across **two clock domains**:
- **Clock Domain 1 (REF_CLK – 50 MHz)**  
  Contains: RegFile, ALU, Clock Gating, SYS_CTRL.
- **Clock Domain 2 (UART_CLK – 3.6864 MHz)**  
  Contains: UART_TX, UART_RX, Pulse Generator, Clock Dividers.
- Synchronization blocks: RST Synchronizer, Data Synchronizer, ASYNC FIFO.

## 🧩 Supported Operations
### ALU Operations
Addition, Subtraction, Multiplication, Division, AND, OR, NAND, NOR, XOR, XNOR,  
Compare (A = B, A > B), Shift Right (A >> 1), Shift Left (A << 1).

### Register File Operations
- Register Write
- Register Read

### Commands
| Command | Description | Frames |
|----------|--------------|---------|
| `0xAA` | Register Write | 3 |
| `0xBB` | Register Read | 2 |
| `0xCC` | ALU with Operands | 4 |
| `0xDD` | ALU without Operands | 2 |

## 🧠 Sequence of Operation
1. Initial configuration through Register File (addresses 0x2 and 0x3).  
2. Master sends commands via UART_RX.  
3. SYS_CTRL decodes commands and performs the required operation using ALU or RegFile.  
4. Results are transmitted back through UART_TX.

## ⚙️ System Blocks
Each module (Verilog file) is inside `/rtl`:
- **regfile.v** – Register file with configurable registers
- **alu.v** – Arithmetic Logic Unit
- **sys_ctrl.v** – System control and command decoder
- **uart_tx.v / uart_rx.v** – UART transmitter and receiver
- **clock_divider.v / clock_gating.v** – Power and frequency management
- **async_fifo.v** – Asynchronous FIFO for clock domain crossing
- **data_sync.v / rst_sync.v** – Synchronizers
- **pulse_gen.v** – Generates control pulses

## 🧪 Verification
A self-checking Verilog testbench validates:
- UART communication
- Command execution
- Clock domain crossing
- ALU and Register File operations

## 🛠️ Tools Used
- **ModelSim / QuestaSim** – RTL and GLS simulation  
- **Synopsys Design Compiler** – Synthesis  
- **Cadence Genus / Innovus** – Place and Route  
- **Tetramax / DFT Compiler** – Scan insertion and testability  

## 🧮 ASIC Flow
1. RTL Design  
2. RTL Verification  
3. Synthesis and Timing Checks  
4. DFT Insertion  
5. Gate-Level Simulation  
6. ASIC Flow and GDSII Generation  

## 📁 Repository Structure
See `/rtl`, `/tb`, `/synthesis`, `/dft`, `/gate_level`, and `/scripts` folders.

## 👤 Author
**Zeyad Elbarbary**  
Computer and Systems Engineering Student, Ain Shams University  

## 🪪 License
MIT License
