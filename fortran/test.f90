module test
use globals
implicit none

contains
    
    function testStPoint(psi, phi, alfa1, alfa2, alfa, i)
    integer i
    real*8 psi, phi
    complex*16 alfa1, alfa2, alfa, testStPoint(2)

        testStPoint(1) = alfa1*cos(psi)/sqrt(kappa(i)**2 - alfa**2) - cos(phi)*sin(psi);
        
        testStPoint(2) = alfa2*cos(psi)/sqrt(kappa(i)**2 - alfa**2) - sin(psi)*sin(phi)
    
    end function testStPoint     
    
end module test 