module stPhase
use globals
use Kmatrix
use test
implicit none

contains
    
    
    !Нахождение интеграла K1*Q1+K2*Q2
    subroutine MakeAsymps 
    implicit none
    integer i
    real*8 pole
    complex*16 u1, u2, v1, v2, w1, w2, alfa1, alfa2, alfa, P1, R1, K1Q1, P2, R2, K2Q2, sPtest(2)
    
        call findPole(pole)
        do i = 1, pointsNumber
            
            alfa1 = -kappa(1)*sin(psi(i))*cos(phi(i)); alfa2 = -kappa(1)*sin(psi(i))*sin(phi(i)); alfa = kappa(1)*sin(psi(i));
            sPtest = testStPoint(psi(i), phi(i), alfa1, alfa2, alfa, 1)
            
            
            P1 = MakeP1(alfa); R1 = MakeR1(alfa);
            K1Q1 = -ci*alfa1*P1; 
            u1 = ci*cos(psi(i))/(2d0*pi*R(i))*K1Q1*kappa(1)*exp(ci*R(i)*kappa(1))
            
            K1Q1 = -ci*alfa2*P1; 
            v1 = ci*cos(psi(i))/(2d0*pi*R(i))*K1Q1*kappa(1)*exp(ci*R(i)*kappa(1))
            
            K1Q1 = R1;  !K1Q1 =1d0; !!!!
            w1 = ci*cos(psi(i))/(2d0*pi*R(i))*K1Q1*kappa(1)*exp(ci*R(i)*kappa(1))
            
            
            alfa1 = -kappa(2)*sin(psi(i))*cos(phi(i)); alfa2 = -kappa(2)*sin(psi(i))*sin(phi(i)); alfa = kappa(2)*sin(psi(i));
            sPtest = testStPoint(psi(i), phi(i), alfa1, alfa2, alfa, 2)
            
            P2 = MakeP2(alfa); R2 = MakeR2(alfa);
            
            K2Q2 = -ci*alfa1*P2; 
            u2 = ci*cos(psi(i))/(2d0*pi*R(i))*K2Q2*kappa(2)*exp(ci*R(i)*kappa(2))   
            
            K2Q2 = -ci*alfa2*P2; 
            v2 = ci*cos(psi(i))/(2d0*pi*R(i))*K2Q2*kappa(2)*exp(ci*R(i)*kappa(2))   
            
            K2Q2 = R2; !K2Q2 =1d0; !!!
            w2 = ci*cos(psi(i))/(2d0*pi*R(i))*K2Q2*kappa(2)*exp(ci*R(i)*kappa(2)) 
            
            u_asym(i) = u1 + u2
            v_asym(i) = v1 + v2
            w_asym(i) = w1 + w2
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
            write(3, '(12(2E15.6E3))') , x(i), y(i), z(i), R(i), phi(i), psi(i), real(u_asym(i)), imag(u_asym(i)), real(v_asym(i)), imag(v_asym(i)), real(w_asym(i)), imag(w_asym(i))
        enddo
    end subroutine PlotSphase
    
end module stPhase