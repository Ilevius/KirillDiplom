        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:02 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DLY__genmod
          INTERFACE 
            SUBROUTINE S17DLY(Z,FNU,KODE,MR,N,Y,NZ,TOL,ELIM,ALIM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: Z
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              INTEGER(KIND=4) :: MR
              COMPLEX(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NZ
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DLY
          END INTERFACE 
        END MODULE S17DLY__genmod
