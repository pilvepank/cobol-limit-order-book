*>================================================================
*> PROGRAM:  lob_iceberg_test.cbl
*> PURPOSE:  Unit Test Suite for LOB Iceberg Hidden Orders
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-ICEBERG-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "ICEBERG-CONFIG.cpy".
 01  WS-EXEC-QTY            PIC 9(08) COMP-5 VALUE 0.
 01  WS-RELOADED            PIC 9(08) COMP-5 VALUE 0.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB ICEBERG HIDDEN RESERVE TEST SUITE           "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 10001 TO ICE-ORDER-ID
     MOVE 10000 TO ICE-TOTAL-QTY
     MOVE 2000 TO ICE-DISPLAY-PEAK-QTY
     MOVE 2000 TO ICE-CURRENT-VISIBLE-QTY
     MOVE 8000 TO ICE-HIDDEN-REMAIN-QTY
     MOVE 0 TO ICE-REPLENISH-COUNT
     MOVE 'A' TO ICE-STATUS-FLAG
     
     MOVE 2000 TO WS-EXEC-QTY
     CALL "LOB-ICEBERG-ENGINE" USING ICEBERG-ORDER-RECORD, WS-EXEC-QTY, WS-RELOADED
     IF WS-RELOADED = 2000 AND ICE-HIDDEN-REMAIN-QTY = 6000 AND ICE-REPLENISH-COUNT = 1
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Peak Exhaustion Triggers Full Replenish [PASS]"
     ELSE
         DISPLAY "TEST 1: Peak Exhaustion Triggers Full Replenish [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 500 TO WS-EXEC-QTY
     CALL "LOB-ICEBERG-ENGINE" USING ICEBERG-ORDER-RECORD, WS-EXEC-QTY, WS-RELOADED
     IF ICE-CURRENT-VISIBLE-QTY = 1500 AND WS-RELOADED = 0
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Partial Fill Consumes Visible Peak [PASS]"
     ELSE
         DISPLAY "TEST 2: Partial Fill Consumes Visible Peak [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Iceberg Tests Run:    " WS-TESTS-RUN
     DISPLAY "Iceberg Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL ICEBERG TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME ICEBERG TESTS FAILED <<"
     END-IF
     STOP RUN.
