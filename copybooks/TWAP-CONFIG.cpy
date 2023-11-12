*>================================================================
*> COPYBOOK: TWAP-CONFIG.cpy
*> PURPOSE:  Time-Weighted Average Price (TWAP) Algorithm State
*> ================================================================
 01  TWAP-EXECUTION-STATE.
     05  TWAP-TOTAL-ORDER-QTY    PIC 9(08) COMP-5 VALUE 10000.
     05  TWAP-REMAINING-QTY      PIC 9(08) COMP-5 VALUE 10000.
     05  TWAP-SLICE-INTERVAL-SEC PIC 9(04) COMP-5 VALUE 30.
     05  TWAP-SLICE-QUANTITY     PIC 9(08) COMP-5 VALUE 1000.
     05  TWAP-SLICES-DISPATCHED  PIC 9(04) COMP-5 VALUE 0.
     05  TWAP-EXEC-PRICE-LIMIT   PIC S9(09)V9(04) COMP-3 VALUE 105,0000.
     05  TWAP-ACTIVE-FLAG        PIC X(01) VALUE 'Y'.
         88  TWAP-IS-ACTIVE      VALUE 'Y'.
         88  TWAP-IS-COMPLETE    VALUE 'N'.
