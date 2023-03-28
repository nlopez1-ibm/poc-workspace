//NLOPEZ1Z JOB CLASS=A,MSGCLASS=H,NOTIFY=NLOPEZ,MSGLEVEL=(1,1)
//*
//* Sample jcl to run batch DATDEMO pgm v22.f zDt
//*
//DBB     EXEC PGM=DATBATCH
//*STEPLIB  DD  DISP=SHR,DSN=ZDEV.MAIN.LOAD                   ucd Load
//*STEPLIB  DD  DISP=SHR,DSN=IBMUSER.VSC.LOAD              vscode Load
//STEPLIB  DD  DISP=SHR,DSN=IBMUSER.IDZ.LOAD                 idz Load
//*STEPLIB  DD  DISP=SHR,DSN=IBMUSER.JENKINS.LOAD      Jenkins CI Load
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//**********************************************************
