       ID DIVISION.
       PROGRAM-ID. DATBATCH.
      * az test ++
      * Use Pub GITHUB project's DEVELOP branch test
      * References STATIC MOD DEMOSUB in zdev.main.load for IAC Demos
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-AREA1.
          05  FILLER       PIC X(80).
          05  num1         PIC 9(3) value is 000.
          05  num2         PIC 9(3) value is 003.     
      *
       COPY DATDEPND.
      *
       PROCEDURE DIVISION.
           DISPLAY 'demo v.a.6'.
          
           STOP RUN.
    