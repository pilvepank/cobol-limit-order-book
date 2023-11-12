*>================================================================
*> PROGRAM:  lob_trailing_test.cbl
*> PURPOSE:  Test Harness for Trailing Stop-Loss Ratchet Engine
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-TRAILING-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "TRAILING-STOP.cpy".
 01  WS-TICK-PRICE          PIC S9(09)V9(04) COMP-3 VALUE 0.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB TRAILING STOP-LOSS TEST SUITE               "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 100,0000 TO TS-PEAK-HIGH-PRICE
     MOVE 2,0000 TO TS-TRAIL-DELTA-AMOUNT
     MOVE 98,0000 TO TS-STOP-TRIGGER-PRICE
     MOVE 'N' TO TS-TRIGGERED-FLAG
     
     MOVE 105,0000 TO WS-TICK-PRICE
     CALL "LOB-STOP-TRAILING" USING TRAILING-STOP-STATE, WS-TICK-PRICE
     IF TS-PEAK-HIGH-PRICE = 105,0000 AND TS-STOP-TRIGGER-PRICE = 103,0000
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Peak Price Ratchet Upward [PASS]"
     ELSE
         DISPLAY "TEST 1: Peak Price Ratchet Upward [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 102,5000 TO WS-TICK-PRICE
     CALL "LOB-STOP-TRAILING" USING TRAILING-STOP-STATE, WS-TICK-PRICE
     IF TS-IS-TRIGGERED
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Stop Trigger On Market Drop [PASS]"
     ELSE
         DISPLAY "TEST 2: Stop Trigger On Market Drop [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Trailing Tests Run:    " WS-TESTS-RUN
     DISPLAY "Trailing Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL TRAILING STOP TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME TRAILING STOP TESTS FAILED <<"
     END-IF
     STOP RUN.
