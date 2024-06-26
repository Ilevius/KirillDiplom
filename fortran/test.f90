module test
use globals
use residue
implicit none

contains
    
    function testStPoint(psi, phi, alfa1, alfa2, alfa, i)
    integer i
    real*8 psi, phi
    complex*16 alfa1, alfa2, alfa, testStPoint(2)

        testStPoint(1) = alfa1*cos(psi)/sqrt(kappa(i)**2 - alfa**2) - cos(phi)*sin(psi);
        
        testStPoint(2) = alfa2*cos(psi)/sqrt(kappa(i)**2 - alfa**2) - sin(psi)*sin(phi)
    
    end function testStPoint     
    
    
    
    
    subroutine findPole(pole) ! ����� �������� ��������� ��� ������ �������
    implicit none
    integer Ndz
    real*8 dzetaMin, dzetaMax, haminStep, haminEps, dz(10), pole 
        dzetaMin = 1d-5
        dzetaMax = 2d0*kappa(2)  
        haminStep = 1d-4
        haminEps = 1d-12
        call Hamin(DeltaHamin,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
        pole = dz(1)
    end subroutine findPole
    
    end module test 
    
    
    subroutine testFreq(psi, phi, alfa1, alfa2, alfa, i)
    integer i
    real*8 psi, phi
    complex*16 alfa1, alfa2, alfa

    teta(i)=-(sqrt(kappa(1)**2-alfa**2)*cos(psi)+(alfa1*cos(phi)+alfa2*sin(phi))*sin(psi))
        
    end subroutine testFreq 
    !
    !call findPole(pole)
    !    do i = 1, pointsNumber
    !        call testFreq(psi(i), phi(i), alfa1, alfa2, alfa, i)
    !enddo
    !
    !do i = 1, pointsNumber
    !    write(4, '(1(2E15.6E3))') , teta(i)
    !enddo