module stPhase
use globals
use Kmatrix
use test
implicit none

contains
    
    
    subroutine MakeunSPhase(thePsi, thePhi, theR, n, un, vn, wn) 
    implicit none
    integer n
    real*8 thePsi, thePhi, theR, pole
    complex*16 un, vn, wn, alfa1_, alfa2_, alfa_, Pn, Rn, KQ, sPtest(2)
                
            alfa1_ = cmplx(-kappa(n)*sin(thePsi)*cos(thePhi)); alfa2_ = cmplx(-kappa(n)*sin(thePsi)*sin(thePhi)); alfa_ = cmplx(kappa(n)*sin(thePsi));
                       
            Pn = MakePn(alfa_, n); Rn = MakeRn(alfa_, n);
            
            KQ = -ci*alfa1_*Pn; 
            un = ci*cos(thePsi)/(2d0*pi*theR)*KQ*kappa(n)*exp(ci*theR*kappa(n))
            
            KQ = -ci*alfa2_*Pn; 
            vn = ci*cos(thePsi)/(2d0*pi*theR)*KQ*kappa(n)*exp(ci*theR*kappa(n))
            
            KQ = Rn;  !K1Q1 =1d0; !!!!
            wn = ci*cos(thePsi)/(2d0*pi*theR)*KQ*kappa(n)*exp(ci*theR*kappa(n))
            
            sPtest = testStPoint(psi(i), phi(i), alfa1_, alfa2_, alfa_, 2)
            call findPole(pole)
    end subroutine MakeunSPhase   
       
    
    !Нахождение интеграла K1*Q1+K2*Q2    
    subroutine MakeAsymps 
    implicit none
    integer i
    real*8 pole
    complex*16 u1, u2, v1, v2, w1, w2, sPtest(2)
        call findPole(pole)
        do i = 1, pointsNumber
            call MakeunSPhase(psi(i), phi(i), R(i), 1, u1, v1, w1)
            call MakeunSPhase(psi(i), phi(i), R(i), 2, u2, v2, w2)
            u_asym(i) = u1 !+ u2
            v_asym(i) = v1 !+ v2
            w_asym(i) = w1 !+ w2
        enddo
    end subroutine MakeAsymps
    
    
    
    
    !Вывод результатов нахождения интеграла K1*Q1+K2*Q2 в текстовый файл
    subroutine PlotSphase 
    implicit none
        integer i
        !open(3, file="C:\Users\gpesc\Desktop\Расчеты для диплома 2024-06-08\Data\u_Sphase.txt")
        open(3, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\!! Кирилл диплом 2024\data\u_Sphase.txt")
        write(3,'(A)') "% x, y, z, R, phi, psi, real(u_asym), imag(u_asym), real(v_asym), imag(v_asym), real(w_asym), imag(w_asym)"
        do i = 1, pointsNumber
            write(3, '(13(2E15.6E3))') , x(i), y(i), z(i), R(i), phi(i), psi(i), real(u_asym(i)), imag(u_asym(i)), real(v_asym(i)), imag(v_asym(i)), real(w_asym(i)), imag(w_asym(i))
        enddo
    end subroutine PlotSphase
    
end module stPhase