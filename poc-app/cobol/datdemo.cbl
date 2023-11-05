       ID DIVISION.
       PROGRAM-ID. DATDEMO.
      *    THIS DEMONSTRATES Impact build with CICS/BMS
      *
      * region is cicsts56  on my zdt_cics vtam session
      * wip - cmci for zDT test
      * Tran ='DAT0' in rpl NLOPEZ.IDZ.LOAD
      * zapp is cloned to my tmp by the pipeline process
      * displays are in cics stc sysout
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      *    COPY DFHAID.
      *
      * My test with my pre-built map
           COPY DATMAPM.
       PROCEDURE DIVISION.
           DISPLAY 'Sending a test map  NEL 11:12'.
           EXEC CICS
                SEND MAP ('DATMLIS')
                     MAPSET('DATMAPM')
                     FROM(DATMLISO)
           END-EXEC.
      *
      *  this sub is a dual mod for datbatch and datdemo
      *
           CALL 'DATSUB'.
           STOP RUN.
