       ID DIVISION.
       PROGRAM-ID. DATDEMO.
      *  v2  
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      *    COPY DFHAID.
      *
      * My test with my pre-built map

         PROCEDURE DIVISION.
           DISPLAY 'demo depth check c2'.

           STOP RUN.




      * old dummy out for now
      *     COPY DATMAPM.
      * PROCEDURE DIVISION.
      *     DISPLAY 'Sending a test map  NEL 11:12'.
      *     EXEC CICS
      *          SEND MAP ('DATMLIS')
      *               MAPSET('DATMAPM')
      *               FROM(DATMLISO)
      *     END-EXEC.
      *
      *  this sub is a dual mod for datbatch and datdemo
      *
      *     CALL 'DATSUB'.
      *     STOP RUN.
