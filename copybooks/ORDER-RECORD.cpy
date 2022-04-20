*>================================================================*
*> ORDER-RECORD.cpy - High-Frequency Limit Order Book Order Record
*>================================================================*
 01  ORDER-RECORD.
     05  ORD-ID              PIC 9(9)   COMP-5.
     05  ORD-CLIENT-ID       PIC X(8).
     05  ORD-SYMBOL          PIC X(8).
     05  ORD-SIDE            PIC X.
         88  SIDE-BUY        VALUE "B".
         88  SIDE-SELL       VALUE "S".
     05  ORD-TYPE            PIC X.
         88  TYPE-LIMIT      VALUE "L".
         88  TYPE-MARKET     VALUE "M".
         88  TYPE-STOP       VALUE "S".
         88  TYPE-IOC        VALUE "I".
     05  ORD-PRICE           PIC S9(9)V9(4) COMP-3.
     05  ORD-STOP-PRICE      PIC S9(9)V9(4) COMP-3.
     05  ORD-QTY             PIC 9(8)   COMP-5.
     05  ORD-FILLED-QTY      PIC 9(8)   COMP-5.
     05  ORD-LEAVES-QTY      PIC 9(8)   COMP-5.
     05  ORD-STATUS          PIC X.
         88  STATUS-NEW      VALUE "N".
         88  STATUS-ACTIVE   VALUE "A".
         88  STATUS-PARTIAL  VALUE "P".
         88  STATUS-FILLED   VALUE "F".
         88  STATUS-CANCELED VALUE "C".
         88  STATUS-STOPPED  VALUE "S".
     05  ORD-TIMESTAMP       PIC 9(16)  COMP-5.
