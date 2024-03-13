*>================================================================
*> COPYBOOK: ICEBERG-CONFIG.cpy
*> PURPOSE:  Synthetic Iceberg Hidden Reserve Order Descriptor
*> ================================================================
 01  ICEBERG-ORDER-RECORD.
     05  ICE-ORDER-ID            PIC 9(12) COMP-5 VALUE 0.
     05  ICE-TOTAL-QTY           PIC 9(08) COMP-5 VALUE 50000.
     05  ICE-DISPLAY-PEAK-QTY    PIC 9(08) COMP-5 VALUE 5000.
     05  ICE-CURRENT-VISIBLE-QTY PIC 9(08) COMP-5 VALUE 5000.
     05  ICE-HIDDEN-REMAIN-QTY   PIC 9(08) COMP-5 VALUE 45000.
     05  ICE-REPLENISH-COUNT     PIC 9(04) COMP-5 VALUE 0.
     05  ICE-STATUS-FLAG         PIC X(01) VALUE 'A'.
         88  ICE-STATUS-ACTIVE   VALUE 'A'.
         88  ICE-STATUS-FILLED   VALUE 'F'.
