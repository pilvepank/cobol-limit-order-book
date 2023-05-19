*>================================================================
*> COPYBOOK: RISK-CONFIG.cpy
*> PURPOSE:  Pre-Trade Risk Management & Order Validation Limits
*> ================================================================
 01  RISK-CONFIGURATION.
     05  RC-MAX-ORDER-QTY        PIC 9(08) COMP-5 VALUE 50000.
     05  RC-MAX-ORDER-NOTIONAL   PIC S9(12)V9(02) COMP-3 VALUE 1000000.
     05  RC-PRICE-COLLAR-BPS     PIC 9(04) COMP-5 VALUE 500.
     05  RC-MAX-DAILY-VOLUME     PIC 9(12) COMP-5 VALUE 10000000.
     05  RC-ACCOUNT-CREDIT-CAP   PIC S9(12)V9(02) COMP-3 VALUE 50000000.

 01  RISK-ACCOUNT-STATE.
     05  RA-TRADER-ID            PIC X(08).
     05  RA-CUMULATIVE-NOTIONAL  PIC S9(12)V9(02) COMP-3 VALUE 0.
     05  RA-OPEN-ORDERS-COUNT    PIC 9(06) COMP-5 VALUE 0.
     05  RA-STATUS               PIC X(01) VALUE 'A'.
         88  RA-ACTIVE           VALUE 'A'.
         88  RA-HALTED           VALUE 'H'.
         88  RA-RESTRICTED       VALUE 'R'.
