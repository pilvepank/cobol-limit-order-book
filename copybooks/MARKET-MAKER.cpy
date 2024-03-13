*>================================================================
*> COPYBOOK: MARKET-MAKER.cpy
*> PURPOSE:  Market Maker Spread & Inventory Skew Configuration
*> ================================================================
 01  MM-QUOTER-STATE.
     05  MM-BASE-MID-PRICE       PIC S9(09)V9(04) COMP-3 VALUE 100,0000.
     05  MM-HALF-SPREAD-DELTA    PIC S9(09)V9(04) COMP-3 VALUE 0,5000.
     05  MM-INVENTORY-POSITION   PIC S9(09) COMP-5 VALUE 0.
     05  MM-SKEW-PER-UNIT        PIC S9(09)V9(04) COMP-3 VALUE 0,0010.
     05  MM-BID-QUOTE-PRICE      PIC S9(09)V9(04) COMP-3 VALUE 0.
     05  MM-ASK-QUOTE-PRICE      PIC S9(09)V9(04) COMP-3 VALUE 0.
