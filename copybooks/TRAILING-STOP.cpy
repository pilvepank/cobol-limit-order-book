*>================================================================
*> COPYBOOK: TRAILING-STOP.cpy
*> PURPOSE:  Trailing Stop-Loss Ratchet & Trigger Descriptors
*> ================================================================
 01  TRAILING-STOP-STATE.
     05  TS-ORDER-ID             PIC 9(12) COMP-5 VALUE 0.
     05  TS-PEAK-HIGH-PRICE      PIC S9(09)V9(04) COMP-3 VALUE 0.
     05  TS-TRAIL-DELTA-AMOUNT   PIC S9(09)V9(04) COMP-3 VALUE 2,0000.
     05  TS-STOP-TRIGGER-PRICE   PIC S9(09)V9(04) COMP-3 VALUE 0.
     05  TS-TRIGGERED-FLAG       PIC X(01) VALUE 'N'.
         88  TS-IS-TRIGGERED     VALUE 'Y'.
