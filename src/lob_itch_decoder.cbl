*>================================================================
*> PROGRAM:  lob_itch_decoder.cbl
*> PURPOSE:  High-Throughput ITCH 5.0 Market Data Message Decoder
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-ITCH-DECODER.

 DATA DIVISION.
 WORKING-STORAGE SECTION.

 LINKAGE SECTION.
 COPY "ITCH-MESSAGE.cpy".
 01  LS-DECODE-STATUS       PIC X(02).
     88  DEC-SUCCESS        VALUE '00'.
     88  DEC-INVALID-TYPE   VALUE '90'.
     88  DEC-ZERO-QTY       VALUE '91'.

 PROCEDURE DIVISION USING ITCH-WIRE-BUFFER, LS-DECODE-STATUS.
 0000-MAIN.
     EVALUATE ITCH-MSG-TYPE
         WHEN 'A'
             IF ITCH-SHARES = 0
                 MOVE '91' TO LS-DECODE-STATUS
             ELSE
                 MOVE '00' TO LS-DECODE-STATUS
             END-IF
         WHEN 'E'
         WHEN 'X'
         WHEN 'D'
             MOVE '00' TO LS-DECODE-STATUS
         WHEN OTHER
             MOVE '90' TO LS-DECODE-STATUS
     END-EVALUATE
     GOBACK.
