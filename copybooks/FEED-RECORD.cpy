*>================================================================
*> COPYBOOK: FEED-RECORD.cpy
*> PURPOSE:  ITCH / OUCH Binary Market Data Feed Event Layout
*> ================================================================
 01  FEED-EVENT-RECORD.
     05  FE-TIMESTAMP            PIC 9(16) COMP-5.
     05  FE-MSG-TYPE             PIC X(01).
         88  FE-TYPE-ADD         VALUE 'A'.
         88  FE-TYPE-EXECUTE     VALUE 'E'.
         88  FE-TYPE-CANCEL      VALUE 'C'.
         88  FE-TYPE-BBO-UPDATE  VALUE 'B'.
     05  FE-ORDER-ID             PIC 9(12) COMP-5.
     05  FE-SIDE                 PIC X(01).
         88  FE-SIDE-BUY         VALUE 'B'.
         88  FE-SIDE-SELL        VALUE 'S'.
     05  FE-PRICE                PIC S9(09)V9(04) COMP-3.
     05  FE-QUANTITY             PIC 9(08) COMP-5.
     05  FE-MATCH-ID             PIC 9(12) COMP-5.
     05  FE-TRADER-ID            PIC X(08).
