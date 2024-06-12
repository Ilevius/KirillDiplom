        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:01 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DEW__genmod
          INTERFACE 
            SUBROUTINE S17DEW(ZR,FNU,IKFLG,IPMTR,TOL,INIT,PHI,ZETA1,    &
     &ZETA2,SUM,CWRK,ELIM)
              COMPLEX(KIND=8) :: ZR
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: IKFLG
              INTEGER(KIND=4) :: IPMTR
              REAL(KIND=8) :: TOL
              INTEGER(KIND=4) :: INIT
              COMPLEX(KIND=8) :: PHI
              COMPLEX(KIND=8) :: ZETA1
              COMPLEX(KIND=8) :: ZETA2
              COMPLEX(KIND=8) :: SUM
              COMPLEX(KIND=8) :: CWRK(16)
              REAL(KIND=8) :: ELIM
            END SUBROUTINE S17DEW
          END INTERFACE 
        END MODULE S17DEW__genmod
