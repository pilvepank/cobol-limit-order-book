*>================================================================
*> PROGRAM:  lob_fix_test.cbl
*> PURPOSE:  Test Harness for FIX Protocol Parser
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-FIX-TEST.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "FIX-MESSAGE.cpy".
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  LOB FIX 4.2 PROTOCOL PARSER TEST SUITE          "
     DISPLAY "=================================================="
     
     *> Test 1: New Order Single (35=D)
     ADD 1 TO WS-TESTS-RUN
     MOVE "35=D|49=CLIENT1|56=BALTIC|11=CL10001|54=1|38=250|44=100.5|" TO FIX-RAW-BUFFER
     MOVE 58 TO FIX-RAW-LENGTH
     CALL "LOB-FIX-PARSER" USING FIX-INBOUND-MESSAGE
     IF FIX-STATUS-OK AND FIX-TYPE-NEW-ORDER AND FIX-ORDER-QTY = 250
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: FIX New Order Single Parse [PASS]"
     ELSE
         DISPLAY "TEST 1: FIX New Order Single Parse [FAIL]"
     END-IF
     
     *> Test 2: Order Cancel Request (35=F)
     ADD 1 TO WS-TESTS-RUN
     MOVE "35=F|49=CLIENT1|56=BALTIC|11=CL10001|41=CL10000|" TO FIX-RAW-BUFFER
     MOVE 48 TO FIX-RAW-LENGTH
     CALL "LOB-FIX-PARSER" USING FIX-INBOUND-MESSAGE
     IF FIX-STATUS-OK AND FIX-TYPE-CANCEL
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: FIX Order Cancel Parse [PASS]"
     ELSE
         DISPLAY "TEST 2: FIX Order Cancel Parse [FAIL]"
     END-IF
     
     DISPLAY "--------------------------------------------------"
     DISPLAY "FIX Tests Run:    " WS-TESTS-RUN
     DISPLAY "FIX Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL FIX TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME FIX TESTS FAILED <<"
     END-IF
     STOP RUN.
