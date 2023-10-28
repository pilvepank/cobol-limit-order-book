*>================================================================
*> PROGRAM:  lob_twap_test.cbl
*> PURPOSE:  Test Harness for Algorithmic TWAP Order Slicer
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-TWAP-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "TWAP-CONFIG.cpy".
 01  WS-DISPATCH-QTY        PIC 9(08) COMP-5 VALUE 0.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB TWAP ALGORITHMIC SLICER TEST SUITE          "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 2500 TO TWAP-TOTAL-ORDER-QTY
     MOVE 2500 TO TWAP-REMAINING-QTY
     MOVE 1000 TO TWAP-SLICE-QUANTITY
     MOVE 0 TO TWAP-SLICES-DISPATCHED
     MOVE 'Y' TO TWAP-ACTIVE-FLAG
     
     CALL "LOB-TWAP-ENGINE" USING TWAP-EXECUTION-STATE, WS-DISPATCH-QTY
     IF WS-DISPATCH-QTY = 1000 AND TWAP-REMAINING-QTY = 1500
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: TWAP Standard Slice Dispatch [PASS]"
     ELSE
         DISPLAY "TEST 1: TWAP Standard Slice Dispatch [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     CALL "LOB-TWAP-ENGINE" USING TWAP-EXECUTION-STATE, WS-DISPATCH-QTY
     
     CALL "LOB-TWAP-ENGINE" USING TWAP-EXECUTION-STATE, WS-DISPATCH-QTY
     IF WS-DISPATCH-QTY = 500 AND TWAP-REMAINING-QTY = 0 AND TWAP-IS-COMPLETE
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: TWAP Terminal Remainder Slice [PASS]"
     ELSE
         DISPLAY "TEST 2: TWAP Terminal Remainder Slice [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "TWAP Tests Run:    " WS-TESTS-RUN
     DISPLAY "TWAP Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL TWAP TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME TWAP TESTS FAILED <<"
     END-IF
     STOP RUN.
