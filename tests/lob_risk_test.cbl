*>================================================================
*> PROGRAM:  lob_risk_test.cbl
*> PURPOSE:  Pre-Trade Risk & Fat-Finger Filter Test Suite
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-RISK-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-ORDER.
     05  ORD-ID                  PIC 9(12) COMP-5 VALUE 1001.
     05  ORD-SIDE                PIC X(01) VALUE 'B'.
     05  ORD-TYPE                PIC X(01) VALUE 'L'.
     05  ORD-PRICE               PIC S9(09)V9(04) COMP-3 VALUE 100,0000.
     05  ORD-QTY                 PIC 9(08) COMP-5 VALUE 100.
     05  ORD-TRADER              PIC X(08) VALUE 'TRD_001'.
 01  WS-MID                      PIC S9(09)V9(04) COMP-3 VALUE 100,0000.
 01  WS-VERDICT                  PIC 9(04) COMP-5 VALUE 0.

 01  WS-TESTS-RUN                PIC 9(04) COMP-5 VALUE 0.
 01  WS-TESTS-PASSED             PIC 9(04) COMP-5 VALUE 0.
 01  WS-TESTS-FAILED             PIC 9(04) COMP-5 VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "==================================================".
     DISPLAY "  LOB PRE-TRADE RISK FAT-FINGER TEST SUITE        ".
     DISPLAY "==================================================".

     PERFORM 1000-TEST-NOMINAL-RISK.
     PERFORM 2000-TEST-MAX-QTY-BREACH.
     PERFORM 3000-TEST-COLLAR-BREACH.

     DISPLAY "--------------------------------------------------".
     DISPLAY "TEST SUMMARY:".
     DISPLAY "  Total Run:    " WS-TESTS-RUN.
     DISPLAY "  Total Passed: " WS-TESTS-PASSED.
     DISPLAY "  Total Failed: " WS-TESTS-FAILED.
     DISPLAY "==================================================".
     IF WS-TESTS-FAILED = 0
         DISPLAY ">> ALL RISK SUITES PASSED [100% OK] <<"
     END-IF.
     STOP RUN.

 1000-TEST-NOMINAL-RISK.
     ADD 1 TO WS-TESTS-RUN.
     MOVE 100,0000 TO ORD-PRICE.
     MOVE 500 TO ORD-QTY.
     CALL "LOB-RISK-MANAGER" USING WS-ORDER WS-MID WS-VERDICT.
     IF WS-VERDICT = 0
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Nominal Order Risk Check [PASS]"
     ELSE
         ADD 1 TO WS-TESTS-FAILED
     END-IF.

 2000-TEST-MAX-QTY-BREACH.
     ADD 1 TO WS-TESTS-RUN.
     MOVE 999999 TO ORD-QTY.
     CALL "LOB-RISK-MANAGER" USING WS-ORDER WS-MID WS-VERDICT.
     IF WS-VERDICT = 101
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Max Quantity Fat-Finger Check [PASS]"
     ELSE
         ADD 1 TO WS-TESTS-FAILED
     END-IF.

 3000-TEST-COLLAR-BREACH.
     ADD 1 TO WS-TESTS-RUN.
     MOVE 500 TO ORD-QTY.
     MOVE 150,0000 TO ORD-PRICE.
     CALL "LOB-RISK-MANAGER" USING WS-ORDER WS-MID WS-VERDICT.
     IF WS-VERDICT = 103
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 3: Price Collar Violation Check [PASS]"
     ELSE
         ADD 1 TO WS-TESTS-FAILED
     END-IF.
