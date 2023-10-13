*>================================================================
*> COPYBOOK: VWAP-STATE.cpy
*> PURPOSE:  Volume-Weighted Average Price & Tier Accumulator Layout
*> ================================================================
 01  VWAP-CALCULATOR-STATE.
     05  VW-TOTAL-NOTIONAL       PIC S9(15)V9(04) COMP-3 VALUE 0.
     05  VW-TOTAL-VOLUME         PIC 9(12) COMP-5 VALUE 0.
     05  VW-CURRENT-VWAP         PIC S9(09)V9(04) COMP-3 VALUE 0.
     05  VW-LAST-FILL-PRICE      PIC S9(09)V9(04) COMP-3 VALUE 0.
     05  VW-LAST-FILL-QTY        PIC 9(08) COMP-5 VALUE 0.
     05  VW-SAMPLE-COUNT         PIC 9(06) COMP-5 VALUE 0.
