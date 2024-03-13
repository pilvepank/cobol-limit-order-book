*>================================================================
*> COPYBOOK: ITCH-MESSAGE.cpy
*> PURPOSE:  NASDAQ ITCH 5.0 Binary Wire Protocol Message Layout
*> ================================================================
 01  ITCH-WIRE-BUFFER.
     05  ITCH-MSG-TYPE           PIC X(01) VALUE 'A'.
         88  ITCH-TYPE-ADD       VALUE 'A'.
         88  ITCH-TYPE-EXECUTE   VALUE 'E'.
         88  ITCH-TYPE-CANCEL    VALUE 'X'.
         88  ITCH-TYPE-DELETE    VALUE 'D'.
     05  ITCH-TIMESTAMP-NS       PIC 9(18) COMP-5 VALUE 0.
     05  ITCH-ORDER-REF-NUM      PIC 9(18) COMP-5 VALUE 0.
     05  ITCH-BUY-SELL-INDICATOR PIC X(01) VALUE 'B'.
     05  ITCH-SHARES             PIC 9(08) COMP-5 VALUE 0.
     05  ITCH-STOCK-SYMBOL       PIC X(08) VALUE 'BALTIC  '.
     05  ITCH-PRICE-4DEC         PIC 9(08) COMP-5 VALUE 0.
     05  ITCH-MATCH-NUM          PIC 9(18) COMP-5 VALUE 0.
