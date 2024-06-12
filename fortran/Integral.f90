module integral
use globals
use Kmatrix
implicit none

contains
    
    
    !Нахождение u-компоненты интеграла K*Q
    SUBROUTINE u_integrand(alfa, s, n)
    implicit none;
    real*8 cylinderR
    integer n, i, j
    complex*16 alfa, s(n), sigma(2), P, Bessel(1) 
        sigma = makeSigma(alfa)
        do i=1, n
            P = MakeP(alfa, z(i))
            cylinderR = sqrt(x(i)**2+y(i)**2)
            call S17DEF(1d0,alfa*cylinderR,1,'U',Bessel,ibess,jbess)
            s(i) = alfa**2*P*Bessel(1)*cos(phi(i))
            s(i) = s(i)/(2d0*pi)
        enddo
    END SUBROUTINE u_integrand
     
    
    !Нахождение v-компоненты интеграла K*Q
    SUBROUTINE v_integrand(alfa, s, n)
    implicit none;
    integer n, i
    real*8 cylinderR
    complex*16 alfa, s(n), sigma(2), P, Bessel(1) 
        sigma = makeSigma(alfa)
        do i=1, n
            P = MakeP(alfa, z(i))
            cylinderR = sqrt(x(i)**2+y(i)**2)
            call S17DEF(1d0,alfa*cylinderR,1,'U',Bessel,ibess,jbess)
            s(i) = -alfa**2*P*Bessel(1)*sin(phi(i))
            s(i) = s(i)/(2d0*pi)
        enddo
    END SUBROUTINE v_integrand
    
    
    !Нахождение w-компоненты интеграла K*Q
    SUBROUTINE w_integrand(alfa, s, n)
    implicit none;
    integer n, i
    real*8 cylinderR
    complex*16 alfa, s(n), sigma(2), RR, Bessel(1) 
        sigma = makeSigma(alfa)
        do i=1, n
            RR = MakeR(alfa, z(i))
            cylinderR = sqrt(x(i)**2+y(i)**2)
            call S17DEF(0d0,alfa*cylinderR,1,'U',Bessel,ibess,jbess)
            s(i) = -RR*Bessel(1)*alfa
            s(i) = s(i)/(2d0*pi)
        enddo
    END SUBROUTINE w_integrand
    
    
    !Вывод результатов нахождения интеграла K*Q в текстовый файл
    subroutine PlotIntegral 
    implicit none
        integer i
        !open(3, file="C:\Users\gpesc\Desktop\Расчеты для диплома 2024-06-08\Data\u_integral.txt")
        open(3, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\!! Кирилл диплом 2024\data\u_integral.txt")
        write(3,'(A)') "% x, y, z, R, phi, psi, real(u), imag(u), real(v), imag(v), real(w), imag(w)"
        do i = 1, pointsNumber
            write(3, '(12(2E15.6E3))') , x(i), y(i), z(i), R(i), phi(i), psi(i), real(u(i)), imag(u(i)), real(v(i)), imag(v(i)), real(w(i)), imag(w(i))
        enddo
    end subroutine PlotIntegral
    
end module integral