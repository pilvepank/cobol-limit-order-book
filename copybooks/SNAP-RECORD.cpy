*>================================================================*
*> SNAP-RECORD.cpy - ISAM Snapshot Persistence Record Layout
*>================================================================*
 01  SNAP-RECORD.
     05  SNAP-ORDER-ID           PIC 9(9)   COMP-5.
     05  SNAP-CLIENT-ID          PIC X(8).
     05  SNAP-SYMBOL             PIC X(8).
     05  SNAP-SIDE               PIC X.
     05  SNAP-TYPE               PIC X.
     05  SNAP-PRICE              PIC S9(9)V9(4) COMP-3.
     05  SNAP-STOP-PRICE         PIC S9(9)V9(4) COMP-3.
     05  SNAP-QTY                PIC 9(8)   COMP-5.
     05  SNAP-FILLED-QTY         PIC 9(8)   COMP-5.
     05  SNAP-LEAVES-QTY         PIC 9(8)   COMP-5.
     05  SNAP-STATUS             PIC X.
     05  SNAP-TIMESTAMP          PIC 9(16)  COMP-5.
