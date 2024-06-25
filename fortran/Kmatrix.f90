module Kmatrix
use globals
implicit none

contains
    
    
    !Нахождение переменной Sigma
    FUNCTION makeSigma(alfa)
    complex*16 alfa, makeSigma(2)
        if (Imag(alfa) == 0d0)  then 
                if (abs(alfa) < Kappa(1)) then
                    MakeSigma(1) = -ci*sqrt(Kappa(1)**2 - real(alfa)**2)
                else 
                    MakeSigma(1) = sqrt(real(alfa)**2 - Kappa(1)**2)
                endif    
                    
                if (abs(alfa) < Kappa(2)) then
                    MakeSigma(2) = -ci*sqrt(Kappa(2)**2 - real(alfa)**2)
                else 
                    MakeSigma(2) = sqrt(real(alfa)**2 - Kappa(2)**2)
                endif                
        else 
                MakeSigma(1) = sqrt(alfa**2 - cmplx(Kappa(1)**2))
                MakeSigma(2) = sqrt(alfa**2 - cmplx(Kappa(2)**2))
        endif  
    END   
    
    
    !Нахождение переменной Delta
    FUNCTION makeDelta(alfa)
    complex*16 alfa, makeDelta, sigma(2)
        sigma = makeSigma(alfa)
        makeDelta = 2d0*mu*(-(alfa**2 - 0.5d0*kappa(2)**2)**2 + alfa**2*sigma(1)*sigma(2)) 
    END
    

    
    FUNCTION MakePn(alfa, n)
    integer n
    complex*16 alfa, MakePn, sigma(2), delta
        sigma = makeSigma(alfa)
        delta = makeDelta(alfa)
        if (n == 1) then
            MakePn =(-(alfa**2-0.5d0*kappa(2)**2))/delta
        else
            MakePn = sigma(1)*sigma(2)/delta  
        endif    
    END  
    
    FUNCTION MakeRn(alfa, n)
    integer n
    complex*16 alfa, MakeRn, sigma(2), delta
        sigma = makeSigma(alfa); 
        delta = makeDelta(alfa);
        if (n == 1) then
            MakeRn = (-(alfa**2-0.5d0*kappa(2)**2))/delta*sigma(1)
        else
            MakeRn = sigma(1)*alfa**2/delta
        endif
    END
    
    
    
    FUNCTION MakeP(alfa, z)
    real*8 z
    complex*16 alfa, MakeP, P1, P2, sigma(2)
        sigma = makeSigma(alfa); 
        P1 = MakePn(alfa, 1); 
        P2 = MakePn(alfa, 2); 
        MakeP = P1*exp(sigma(1)*z) + P2*exp(sigma(2)*z)
    END
    
    
    FUNCTION MakeR(alfa, z)
    real*8 z
    complex*16 alfa, MakeR, R1, R2, sigma(2)
        sigma = makeSigma(alfa); 
        R1 = MakeRn(alfa, 1); 
        R2 = MakeRn(alfa, 2);
        MakeR = R1*exp(sigma(1)*z) + R2*exp(sigma(2)*z)
    END
    
end module Kmatrix