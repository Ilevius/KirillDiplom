        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:03 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DEZ__genmod
          INTERFACE 
            SUBROUTINE S17DEZ(Z,FNU,KODE,N,CY,NZ,RL,FNUL,TOL,ELIM,ALIM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: Z
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              COMPLEX(KIND=8) :: CY(N)
              INTEGER(KIND=4) :: NZ
              REAL(KIND=8) :: RL
              REAL(KIND=8) :: FNUL
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DEZ
          END INTERFACE 
        END MODULE S17DEZ__genmod
