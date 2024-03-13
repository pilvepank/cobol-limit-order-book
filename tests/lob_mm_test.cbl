*>================================================================
*> PROGRAM:  lob_mm_test.cbl
*> PURPOSE:  Unit Test Suite for Market Maker Quoter with Inventory Skew
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-MM-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "MARKET-MAKER.cpy".
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB MARKET MAKER INVENTORY SKEW TEST SUITE      "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 100,0000 TO MM-BASE-MID-PRICE
     MOVE 0,5000 TO MM-HALF-SPREAD-DELTA
     MOVE 0 TO MM-INVENTORY-POSITION
     MOVE 0,0010 TO MM-SKEW-PER-UNIT
     CALL "LOB-MARKET-MAKER" USING MM-QUOTER-STATE
     IF MM-BID-QUOTE-PRICE = 99,5000 AND MM-ASK-QUOTE-PRICE = 100,5000
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Balanced Inventory Produces Symmetrical Quotes [PASS]"
     ELSE
         DISPLAY "TEST 1: Balanced Inventory Produces Symmetrical Quotes [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 500 TO MM-INVENTORY-POSITION
     CALL "LOB-MARKET-MAKER" USING MM-QUOTER-STATE
     IF MM-BID-QUOTE-PRICE = 99,0000 AND MM-ASK-QUOTE-PRICE = 100,0000
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Long Position Skews Quotes Downward [PASS]"
     ELSE
         DISPLAY "TEST 2: Long Position Skews Quotes Downward [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Market Maker Tests Run:    " WS-TESTS-RUN
     DISPLAY "Market Maker Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL MARKET MAKER TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME MARKET MAKER TESTS FAILED <<"
     END-IF
     STOP RUN.
