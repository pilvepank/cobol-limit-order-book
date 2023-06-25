*>================================================================
*> PROGRAM:  lob_market_feed.cbl
*> PURPOSE:  ITCH Market Data Event Serializer & Publisher
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-MARKET-FEED.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-EVENTS-PROCESSED         PIC 9(08) COMP-5 VALUE 0.
 01  WS-BUFFER-HEX               PIC X(64).

 LINKAGE SECTION.
     COPY "FEED-RECORD.cpy".
 01  LS-PUBLISH-STATUS           PIC 9(04) COMP-5.

 PROCEDURE DIVISION USING FEED-EVENT-RECORD
                          LS-PUBLISH-STATUS.
 0000-PUBLISH-FEED.
     ADD 1 TO WS-EVENTS-PROCESSED.
     MOVE 0 TO LS-PUBLISH-STATUS.
     GOBACK.
