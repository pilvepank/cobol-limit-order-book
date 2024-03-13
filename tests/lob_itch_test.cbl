*>================================================================
*> PROGRAM:  lob_itch_test.cbl
*> PURPOSE:  Unit Test Suite for ITCH 5.0 Market Data Decoder
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-ITCH-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "ITCH-MESSAGE.cpy".
 01  WS-DEC-STATUS          PIC X(02) VALUE '  '.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB ITCH 5.0 WIRE PROTOCOL DECODER TEST SUITE   "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 'A' TO ITCH-MSG-TYPE
     MOVE 1629800000000 TO ITCH-TIMESTAMP-NS
     MOVE 987654321 TO ITCH-ORDER-REF-NUM
     MOVE 'B' TO ITCH-BUY-SELL-INDICATOR
     MOVE 500 TO ITCH-SHARES
     MOVE "TAL1T   " TO ITCH-STOCK-SYMBOL
     MOVE 105000 TO ITCH-PRICE-4DEC
     CALL "LOB-ITCH-DECODER" USING ITCH-WIRE-BUFFER, WS-DEC-STATUS
     IF WS-DEC-STATUS = '00'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Valid ITCH Add Order Decoded [PASS]"
     ELSE
         DISPLAY "TEST 1: Valid ITCH Add Order Decoded [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 'Z' TO ITCH-MSG-TYPE
     CALL "LOB-ITCH-DECODER" USING ITCH-WIRE-BUFFER, WS-DEC-STATUS
     IF WS-DEC-STATUS = '90'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Invalid Message Type Rejected [PASS]"
     ELSE
         DISPLAY "TEST 2: Invalid Message Type Rejected [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "ITCH Tests Run:    " WS-TESTS-RUN
     DISPLAY "ITCH Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL ITCH DECODER TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME ITCH DECODER TESTS FAILED <<"
     END-IF
     STOP RUN.
