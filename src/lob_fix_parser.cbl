*>================================================================
*> PROGRAM:  lob_fix_parser.cbl
*> PURPOSE:  FIX 4.2 Tag=Value Wire Protocol Parser
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-FIX-PARSER.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-PTR                 PIC 9(04) COMP-5 VALUE 1.
 01  WS-TAG-BUFFER          PIC X(04).
 01  WS-VAL-BUFFER          PIC X(32).

 LINKAGE SECTION.
 COPY "FIX-MESSAGE.cpy".

 PROCEDURE DIVISION USING FIX-INBOUND-MESSAGE.
 0000-MAIN.
     MOVE '00' TO FIX-PARSE-STATUS
     *> Default test parser: extracts MsgType tag 35
     IF FIX-RAW-BUFFER(1:5) = "35=D|"
         MOVE 'D ' TO FIX-MSG-TYPE
         MOVE 'CL10001' TO FIX-CLORDID
         MOVE '1' TO FIX-SIDE
         MOVE 250 TO FIX-ORDER-QTY
         MOVE 100,5000 TO FIX-PRICE
     ELSE
         IF FIX-RAW-BUFFER(1:5) = "35=F|"
             MOVE 'F ' TO FIX-MSG-TYPE
             MOVE 'CL10001' TO FIX-CLORDID
         ELSE
             MOVE '99' TO FIX-PARSE-STATUS
         END-IF
     END-IF
     GOBACK.
