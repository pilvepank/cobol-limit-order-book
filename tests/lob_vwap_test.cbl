*>================================================================
*> PROGRAM:  lob_vwap_test.cbl
*> PURPOSE:  Unit Test Harness for LOB VWAP Calculator
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-VWAP-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "VWAP-STATE.cpy".
 01  WS-PRICE               PIC S9(09)V9(04) COMP-3 VALUE 0.
 01  WS-QTY                 PIC 9(08) COMP-5 VALUE 0.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB VWAP ENGINE TEST SUITE                      "
     DISPLAY "=================================================="
     
     *> Test 1: Single Trade VWAP
     ADD 1 TO WS-TESTS-RUN
     MOVE 100,0000 TO WS-PRICE
     MOVE 500 TO WS-QTY
     CALL "LOB-VWAP-ENGINE" USING VWAP-CALCULATOR-STATE, WS-PRICE, WS-QTY
     IF VW-CURRENT-VWAP = 100,0000 AND VW-TOTAL-VOLUME = 500
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Single Trade VWAP [PASS]"
     ELSE
         DISPLAY "TEST 1: Single Trade VWAP [FAIL]"
     END-IF
     
     *> Test 2: Second Trade Weighted Calculation
     ADD 1 TO WS-TESTS-RUN
     MOVE 110,0000 TO WS-PRICE
     MOVE 500 TO WS-QTY
     CALL "LOB-VWAP-ENGINE" USING VWAP-CALCULATOR-STATE, WS-PRICE, WS-QTY
     *> Total notional: (100*500) + (110*500) = 50000 + 55000 = 105000 / 1000 = 105.00
     IF VW-CURRENT-VWAP = 105,0000 AND VW-TOTAL-VOLUME = 1000
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Two-Trade Weighted Average [PASS]"
     ELSE
         DISPLAY "TEST 2: Two-Trade Weighted Average [FAIL]"
     END-IF
     
     DISPLAY "--------------------------------------------------"
     DISPLAY "VWAP Tests Run:    " WS-TESTS-RUN
     DISPLAY "VWAP Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL VWAP TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME VWAP TESTS FAILED <<"
     END-IF
     STOP RUN.
