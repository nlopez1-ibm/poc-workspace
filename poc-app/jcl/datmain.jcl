//NLOPEZ1Z JOB CLASS=A,MSGCLASS=H,NOTIFY=NLOPEZ,MSGLEVEL=(1,1)
//*
//* Sample jcl to run batch datmain.pli sample 
//*
//DBB     EXEC PGM=DATMAIN
//STEPLIB  DD  DISP=SHR,DSN=IBMUSER.VSCODE.LOAD         vscode Load
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//**********************************************************
