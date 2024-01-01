# High-Frequency Limit Order Book (LOB) & Matching Engine in COBOL

A production-grade, high-performance financial matching engine implemented from scratch in pure COBOL (compatible with GnuCOBOL 3.2+).

## Architectural Highlights
* **Zero IEEE 754 Floating-Point Drift**: All prices are declared as `PIC S9(9)V9(4) COMP-3` (packed decimal fixed-point). Every currency calculation is exact down to the micro-cent.
* **Native Instruction Throughput**: Quantities, sequence numbers, and millisecond timestamps leverage native machine integers (`PIC 9(8) COMP-5` and `PIC 9(16) COMP-5`).
* **Price-Time Priority (FIFO)**: Depth ladder maintained with descending Bids and ascending Asks. Same-price orders queue in strict arrival order.
* **Full Order Type Support**:
  * `L` - Limit Order (rests on book if crossing condition not met)
  * `M` - Market Order (sweeps book at best opposite prices)
  * `I` - Immediate-or-Cancel (IOC: executes available liquidity immediately, cancels unfilled remainder)
  * `S` - Stop-Loss Order (converts to active Market order upon reaching stop trigger threshold)
* **Crash Resilience & ISAM Persistence**: Order book state is persisted directly to disk using standard COBOL indexed sequential files (`ORGANIZATION IS INDEXED`). Instant state recovery without external SQL overhead.

## Building and Running
```cmd
build.bat
run.bat
```


## Extended Enterprise Submodules
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.


## Extended Enterprise Subsystems
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Volume-Weighted Average Price (VWAP)**: Real-time execution benchmark accumulator.
* **FIX 4.2 Protocol Parser**: Wire message parser for NewOrderSingle and OrderCancelRequest.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.


## Extended Enterprise Subsystems
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Volume-Weighted Average Price (VWAP)**: Real-time execution benchmark accumulator.
* **FIX 4.2 Protocol Parser**: Wire message parser for NewOrderSingle and OrderCancelRequest.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.


## Extended Enterprise Subsystems
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Volume-Weighted Average Price (VWAP)**: Real-time execution benchmark accumulator.
* **FIX 4.2 Protocol Parser**: Wire message parser for NewOrderSingle and OrderCancelRequest.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.


## Extended Enterprise Subsystems
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Volume-Weighted Average Price (VWAP)**: Real-time execution benchmark accumulator.
* **FIX 4.2 Protocol Parser**: Wire message parser for NewOrderSingle and OrderCancelRequest.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.


## Extended Enterprise Subsystems
* **Pre-Trade Risk Manager**: Fat-finger quantity limits, price collar bands.
* **Volume-Weighted Average Price (VWAP)**: Real-time execution benchmark accumulator.
* **FIX 4.2 Protocol Parser**: Wire message parser for NewOrderSingle and OrderCancelRequest.
* **Maker-Taker Fee Engine**: Fixed-point micro-rebate calculation.
* **ITCH Market Feed**: Low-latency event streaming.
