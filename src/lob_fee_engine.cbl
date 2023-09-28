*>================================================================
*> PROGRAM:  lob_fee_engine.cbl
*> PURPOSE:  High-Precision Maker/Taker Fee & Rebate Calculator
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. LOB-FEE-ENGINE.

 ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
 SPECIAL-NAMES.
     DECIMAL-POINT IS COMMA.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
     COPY "FEE-SCHEDULE.cpy".
 01  WS-BASE-NOTIONAL            PIC S9(12)V9(04) COMP-3.
 01  WS-CALC-FEE                 PIC S9(09)V9(04) COMP-3.

 LINKAGE SECTION.
 01  LS-EXECUTION-EVENT.
     05  LS-TRADE-PRICE          PIC S9(09)V9(04) COMP-3.
     05  LS-TRADE-QTY            PIC 9(08) COMP-5.
     05  LS-IS-MAKER             PIC X(01).
         88  LS-LIQUIDITY-MAKER  VALUE 'M'.
         88  LS-LIQUIDITY-TAKER  VALUE 'T'.
 01  LS-NET-FEE                  PIC S9(09)V9(04) COMP-3.
 01  LS-REGULATORY-TAX           PIC S9(09)V9(04) COMP-3.

 PROCEDURE DIVISION USING LS-EXECUTION-EVENT
                          LS-NET-FEE
                          LS-REGULATORY-TAX.
 0000-COMPUTE-FEES.
     COMPUTE WS-BASE-NOTIONAL = LS-TRADE-PRICE * LS-TRADE-QTY.

     IF LS-LIQUIDITY-MAKER
         *> Maker receives rebate (negative fee) of 2 bps
         COMPUTE LS-NET-FEE = (WS-BASE-NOTIONAL * -0,0002)
     ELSE
         *> Taker pays 5 bps + flat clearing
         COMPUTE LS-NET-FEE = (WS-BASE-NOTIONAL * 0,0005) + FEE-CLEARING-FLAT
     END-IF.

     COMPUTE LS-REGULATORY-TAX = WS-BASE-NOTIONAL * FEE-REGULATORY-LEVY.
     GOBACK.
