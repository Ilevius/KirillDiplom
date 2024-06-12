        !COMPILER-GENERATED INTERFACE MODULE: Sun Mar 10 21:28:00 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE S17DLF__genmod
          INTERFACE 
            SUBROUTINE S17DLF(M,FNU,Z,N,SCALE,CY,NZ,IFAIL)
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: M
              REAL(KIND=8) :: FNU
              COMPLEX(KIND=8) :: Z
              CHARACTER(LEN=1) :: SCALE
              COMPLEX(KIND=8) :: CY(N)
              INTEGER(KIND=4) :: NZ
              INTEGER(KIND=4) :: IFAIL
            END SUBROUTINE S17DLF
          END INTERFACE 
        END MODULE S17DLF__genmod
