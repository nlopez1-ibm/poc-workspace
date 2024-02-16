       ID DIVISION.
       PROGRAM-ID. DATBATCH.
      * Geneic Batch Cobol Demo with shared code examples.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-AREA1.
          05  FILLER       PIC X(80).
          05  num1         PIC 9(3) value is 000.
       COPY DATDEPND.

      * A copybook in a shared repo  
       COPY DATSHARE.
       
      *
       PROCEDURE DIVISION.
           DISPLAY 'DATBATCH: Main Line v1.1'.
           Display shared-f1.                                                  
      * Call a static sub in this repo     
           CALL 'DEMOSUB'.

      * And a  Static in another repo 
      * doc chg to force a impact and rebuild of static1 from here?     
           CALL 'STATIC1'.

           STOP RUN.
