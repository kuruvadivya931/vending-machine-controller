# Vending Machine Controller Using Verilog

## 📌 Project Description

This project implements a **Vending Machine Controller** using Verilog HDL.

The vending machine accepts **Rs.5 and Rs.10 coins** and dispenses a product costing **Rs.15**.

The controller is designed using a **Finite State Machine (FSM)**.

## 🎯 Features

* Accepts Rs.5 coin
* Accepts Rs.10 coin
* Product price = Rs.15
* Dispenses product when sufficient money is inserted
* Provides change when excess money is inserted
* Reset functionality
* FSM-based design
* Includes Verilog testbench for simulation

## 🧰 Tools Used

* Verilog HDL
* Icarus Verilog / ModelSim / Vivado
* GTKWave (optional)
* GitHub

## 📁 Project Structure

```text
vending-machine-controller/
│
├── README.md
├── vending_machine.v
├── vending_machine_tb.v
└── simulation_output.txt
```

## ⚙️ Working Principle

The vending machine has three states:

| State | Amount | Description       |
| ----- | -----: | ----------------- |
| S0    |   Rs.0 | No money inserted |
| S5    |   Rs.5 | Rs.5 inserted     |
| S10   |  Rs.10 | Rs.10 inserted    |

### State Transitions

```text
             Rs.5
        +------------+
        |            v
     +------+      +------+
     |  S0  |----->|  S5  |
     +------+      +------+
       |  ^           |
 Rs.10 |  |           | Rs.10
       v  |           v
     +------+      Dispense
     | S10  |----------+
     +------+
       |
       | Rs.5
       v
   Dispense
```

## 💰 Vending Conditions

### Case 1: Rs.5 + Rs.10

```text
Rs.5 + Rs.10 = Rs.15
```

The machine dispenses the product.

```text
Dispense = 1
Change   = 0
```

### Case 2: Rs.10 + Rs.5

```text
Rs.10 + Rs.5 = Rs.15
```

The machine dispenses the product.

```text
Dispense = 1
Change   = 0
```

### Case 3: Rs.10 + Rs.10

```text
Rs.10 + Rs.10 = Rs.20
```

The product is dispensed and change is returned.

```text
Dispense = 1
Change   = 1
```

## 🧪 Simulation

Compile the design and testbench using Icarus Verilog:

```bash
iverilog -o vending_machine_sim vending_machine.v vending_machine_tb.v
```

Run the simulation:

```bash
vvp vending_machine_sim
```

The terminal displays the input coins and output signals.

## 📊 Expected Output

```text
Test 1: Inserting Rs.5 + Rs.10
Dispense = 1
Change   = 0

Test 2: Inserting Rs.10 + Rs.5
Dispense = 1
Change   = 0

Test 3: Inserting Rs.10 + Rs.10
Dispense = 1
Change   = 1
```

## 🔬 Inputs

| Input   | Description      |
| ------- | ---------------- |
| clk     | Clock signal     |
| reset   | Resets the FSM   |
| coin_5  | Rs.5 coin input  |
| coin_10 | Rs.10 coin input |

## 🔬 Outputs

| Output   | Description                         |
| -------- | ----------------------------------- |
| dispense | Becomes 1 when product is dispensed |
| change   | Becomes 1 when change is returned   |

## 📚 Applications

* Automatic vending machines
* Ticket machines
* Parking machines
* Digital payment systems
* FSM-based control systems

## 🚀 Future Improvements

* Add Rs.20 and Rs.50 denominations
* Add multiple products
* Add product selection
* Add inventory monitoring
* Add cancel/refund functionality
* Add display for inserted amount

## 👩‍💻 Author

**Beegala Srividya**

## ⭐ Conclusion

The Vending Machine Controller demonstrates how a **Finite State Machine can be implemented using Verilog HDL**. The design successfully accepts different coin combinations, dispenses the product when the required amount is reached, and provides change for excess payment.
