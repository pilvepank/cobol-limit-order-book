*>================================================================
*> COPYBOOK: FEE-SCHEDULE.cpy
*> PURPOSE:  Maker-Taker Fee Schedule & Volume Tier Brackets
*> ================================================================
 01  FEE-SCHEDULE-TABLE.
     05  FEE-TIER-ENTRY OCCURS 4 TIMES INDEXED BY TIER-IDX.
         10  FEE-MIN-VOLUME      PIC 9(12) COMP-5.
         10  FEE-MAKER-BPS       PIC S9(03)V9(02) COMP-3.
         10  FEE-TAKER-BPS       PIC 9(03)V9(02) COMP-3.
     05  FEE-REGULATORY-LEVY     PIC 9(02)V9(04) COMP-3 VALUE 0,0015.
     05  FEE-CLEARING-FLAT       PIC 9(02)V9(02) COMP-3 VALUE 0,10.
