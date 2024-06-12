        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:01 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DEY__genmod
          INTERFACE 
            SUBROUTINE S17DEY(Z,FNU,KODE,N,Y,NZ,NUI,NLAST,FNUL,TOL,ELIM,&
     &ALIM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: Z
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              COMPLEX(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NZ
              INTEGER(KIND=4) :: NUI
              INTEGER(KIND=4) :: NLAST
              REAL(KIND=8) :: FNUL
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DEY
          END INTERFACE 
        END MODULE S17DEY__genmod
