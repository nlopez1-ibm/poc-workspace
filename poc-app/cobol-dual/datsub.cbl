       ID DIVISION.
       PROGRAM-ID. DATSUB.
      * Test sample static call c2 imp with main v3
      * Since this is in a folder mapped to the isDUal property,
      * cobol.groovy will produce 2 artifacts CICS and batch
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MYDATA              PIC X(1).
       01 MYDATA2             PIC X(1).
       PROCEDURE DIVISION.
           MOVE MYDATA TO MYDATA2.
           DISPLAY 'DATSUB HERE In DUAL mode - test v5    '.