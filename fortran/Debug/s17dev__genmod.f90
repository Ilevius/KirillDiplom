        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:01 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DEV__genmod
          INTERFACE 
            SUBROUTINE S17DEV(Z,FNU,KODE,IKFLG,N,Y,NUF,TOL,ELIM,ALIM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: Z
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              INTEGER(KIND=4) :: IKFLG
              COMPLEX(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NUF
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DEV
          END INTERFACE 
        END MODULE S17DEV__genmod
