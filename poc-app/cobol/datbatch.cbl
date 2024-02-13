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

      * Demo shared copybook 
       COPY DATSHARE.
       
      *
       PROCEDURE DIVISION.
           DISPLAY 'DATBATCH: new wass Image dec 2023 v5 '.

      * Call a static sub in this repo     
           CALL 'DEMOSUB'.

      * And a  Static in another repo      
           CALL 'STATIC1'.

           STOP RUN.
