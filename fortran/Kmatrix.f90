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
    
    
    !Нахождение переменной P1 (Для стационарной фазы)
    FUNCTION MakeP1(alfa)
    complex*16 alfa, MakeP1, sigma(2), delta
        sigma = makeSigma(alfa)
        delta = makeDelta(alfa)
        MakeP1 =(-(alfa**2-0.5d0*kappa(2)**2))/delta
    END  
    
    
    !Нахождение переменной P2 (Для стационарной фазы)
    FUNCTION MakeP2(alfa)
    complex*16 alfa, MakeP2, sigma(2), delta
        sigma = makeSigma(alfa)
        delta = makeDelta(alfa)
        MakeP2 = sigma(1)*sigma(2)/delta
    END 
    
    
    !Нахождение переменной R1 (Для стационарной фазы)
    FUNCTION MakeR1(alfa)
    complex*16 alfa, MakeR1, sigma(2), delta
        sigma = makeSigma(alfa); 
        delta = makeDelta(alfa);
        MakeR1 = (-(alfa**2-0.5d0*kappa(2)**2))/delta*sigma(1)
    END
    
    
    !Нахождение переменной R1 (Для стационарной фазы)
    FUNCTION MakeR2(alfa)
    complex*16 alfa, MakeR2, sigma(2), P2, delta
        sigma = makeSigma(alfa); 
        delta = makeDelta(alfa);
        MakeR2 = sigma(1)*alfa**2/delta
    END
    
    
    !Нахождение переменной P
    FUNCTION MakeP(alfa, z)
    real*8 z
    complex*16 alfa, MakeP, P1, P2, sigma(2)
        sigma = makeSigma(alfa); 
        P1 = MakeP1(alfa); 
        P2 = MakeP2(alfa); 
        MakeP = P1*exp(sigma(1)*z) + P2*exp(sigma(2)*z)
    END
    
    
    !Нахождение переменной R
    FUNCTION MakeR(alfa, z)
    real*8 z
    complex*16 alfa, MakeR, R1, R2, sigma(2)
        sigma = makeSigma(alfa); 
        R1 = MakeR1(alfa); 
        R2 = MakeR2(alfa);
        MakeR = R1*exp(sigma(1)*z) + R2*exp(sigma(2)*z)
    END
    
end module Kmatrix