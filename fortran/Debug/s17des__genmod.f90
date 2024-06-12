        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:27:59 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DES__genmod
          INTERFACE 
            SUBROUTINE S17DES(ZR,FNU,KODE,N,Y,NZ,CW,TOL,ELIM,ALIM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: ZR
              REAL(KIND=8) :: FNU
              INTEGER(KIND=4) :: KODE
              COMPLEX(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NZ
              COMPLEX(KIND=8) :: CW(2)
              REAL(KIND=8) :: TOL
              REAL(KIND=8) :: ELIM
              REAL(KIND=8) :: ALIM
            END SUBROUTINE S17DES
          END INTERFACE 
        END MODULE S17DES__genmod
