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
          05  CHAR-40  PIC X(1) value ' '.
          05  CHAR-41  PIC X(1) value 'Â'.
          05  CHAR-42  PIC X(1) value 'Ã'.
          05  CHAR-4F  PIC X(1) value '¥'.
      *
       COPY DATDEPND.
      *
       PROCEDURE DIVISION.
           DISPLAY 'demo v22'.
          
           STOP RUN.
    