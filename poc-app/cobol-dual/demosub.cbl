       ID DIVISION.
       PROGRAM-ID. DEMOSUB.
      * Test sample static call with DATBATCH
      * And lnk card 
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MYDATA              PIC X(1).
       01 MYDATA2             PIC X(1).
       PROCEDURE DIVISION.          
           DISPLAY 'DemoSub HERE In DUAL mode - test 6'.