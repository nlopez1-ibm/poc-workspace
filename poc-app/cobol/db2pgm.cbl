       ID DIVISION.
       PROGRAM-ID. DB2PGM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           EXEC SQL INCLUDE ORG   END-EXEC.
           EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE DIVISION.
           EXEC SQL
              SELECT DEPTNAME INTO :DEPTNAME
               FROM  Q.org
               WHERE DEPTNUMB = 15
           END-EXEC.
           DISPLAY 'Selected  Dept 10 from Org value=' DEPTNAME-TEXT.
           STOP RUN.