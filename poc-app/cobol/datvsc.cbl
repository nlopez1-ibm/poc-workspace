       ID DIVISION.
       PROGRAM-ID. DATVSC.
      * hotfix 1 test2
      * Simple demo code for VSCode ub in zDT 
      * no shre repo ref support yet 
      *
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY DATDEPND.
       PROCEDURE DIVISION.
           DISPLAY 'DATVSC here- v1.2209'.
           DISPLAY 'CPYBK=DATDEPND -> ' WS-VER.
           STOP RUN.
