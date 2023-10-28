*>================================================================
*> COPYBOOK: FIX-MESSAGE.cpy
*> PURPOSE:  Financial Information eXchange (FIX) Message Layout
*> ================================================================
 01  FIX-INBOUND-MESSAGE.
     05  FIX-RAW-BUFFER          PIC X(256).
     05  FIX-RAW-LENGTH          PIC 9(04) COMP-5.
     05  FIX-MSG-TYPE            PIC X(02).
         88  FIX-TYPE-NEW-ORDER  VALUE 'D '.
         88  FIX-TYPE-CANCEL     VALUE 'F '.
         88  FIX-TYPE-LOGON      VALUE 'A '.
     05  FIX-SENDER-COMP-ID      PIC X(08).
     05  FIX-TARGET-COMP-ID      PIC X(08).
     05  FIX-CLORDID             PIC X(12).
     05  FIX-SIDE                PIC X(01).
         88  FIX-SIDE-BUY        VALUE '1'.
         88  FIX-SIDE-SELL       VALUE '2'.
     05  FIX-ORDER-QTY           PIC 9(08) COMP-5.
     05  FIX-PRICE               PIC S9(09)V9(04) COMP-3.
     05  FIX-PARSE-STATUS        PIC X(02).
         88  FIX-STATUS-OK       VALUE '00'.
         88  FIX-STATUS-BAD-FMT  VALUE '99'.
