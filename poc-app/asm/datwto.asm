WTO2     CSECT   *  v2
         SAVE  (14,12),,*            SAVE REGISTERS
         BALR  12,0
         USING *,12
         LA    14,SAVEAREA
         ST    13,4(14)
         ST    14,8(13)
         LR    13,14
**********************************************************************
DO       WTO   'DEBUG: NELSON TEST RCode11',ROUTCDE=(11)
**********************************************************************
         L     13,4(0,13)
         RETURN (14,12),,RC=(15)
**********************************************************************
SAVEAREA DS    18F
*        TESTCOPY
*        COPY   TESTCP2
         SPACE 2
         END