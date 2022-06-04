*>================================================================*
*> TRADE-RECORD.cpy - High-Frequency LOB Trade Execution Record
*>================================================================*
 01  TRADE-RECORD.
     05  TRD-ID              PIC 9(9)       COMP-5.
     05  TRD-BUY-ORD-ID      PIC 9(9)       COMP-5.
     05  TRD-SELL-ORD-ID     PIC 9(9)       COMP-5.
     05  TRD-SYMBOL          PIC X(8).
     05  TRD-PRICE           PIC S9(9)V9(4) COMP-3.
     05  TRD-QTY             PIC 9(8)       COMP-5.
     05  TRD-TIMESTAMP       PIC 9(16)      COMP-5.
