        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:27:57 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DET__genmod
          INTERFACE 
            SUBROUTINE S17DET(Z,FNU,KODE,N,Y,NZ,NLAST,FNUL,TOL,ELIM,ALIM&
     &)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: Z
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              COMPLEX(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NZ
              INTEGER(KIND=4) :: NLAST
              REAL(KIND=8) :: FNUL
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DET
          END INTERFACE 
        END MODULE S17DET__genmod
