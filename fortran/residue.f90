module residue
use globals
use Kmatrix
implicit none

contains

    FUNCTION DeltaHamin(alfa)
    implicit none
    real*8 alfa, DeltaHamin
    complex*16 Mydelta, alfa_c
        alfa_c = alfa*(1d0,0d0)
        Mydelta = makeDelta(alfa_c)
        DeltaHamin = abs(Mydelta)
    END FUNCTION DeltaHamin
    
    subroutine plotUres ! здесь интеграл считается при помощи вычетов
    implicit none
    integer i, j, Ndz
    real*8 dzetaMin, dzetaMax, haminStep, haminEps, dz(10), ht 
    complex*16 alfa, Up, Um, Vp, Vm, Wp, Wm, dzp, dzm, Pp, Pm, Rp, Rm, HankelP(1), HankelM(1), HankelP0(1), HankelM0(1)
        !open(1, file='C:\Users\gpesc\Desktop\Расчеты для диплома 2024-06-08\Data\u_residue.txt', FORM='FORMATTED')
        open(1, file='C:\Users\tiama\OneDrive\Рабочий стол\IMMI\!! Кирилл диплом 2024\data\u_residue.txt', FORM='FORMATTED')
        dzetaMin = 1d-5
        dzetaMax = 2d0*kappa(2)  
        haminStep = 1d-4
        haminEps = 1d-12
        ht = 1d-10
        call Hamin(DeltaHamin,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
   
        do j = 1, pointsNumber
            alfa = dz(1)
            
            dzp = (alfa + ht); dzm = (alfa - ht);           
            Pp = MakeP(dzp, z(j)); Pm = MakeP(dzm, z(j));
            Rp = MakeR(dzp, z(j)); Rm = MakeR(dzm, z(j));
            
            call S17DLF(1, 1d0, dzp*R(j),1,'U',HankelP,ibess,jbess);
            call S17DLF(1, 1d0, dzm*R(j),1,'U',HankelM,ibess,jbess);
            
            call S17DLF(1, 0d0, dzp*R(j),1,'U',HankelP0,ibess,jbess);
            call S17DLF(1, 0d0, dzm*R(j),1,'U',HankelM0,ibess,jbess);
            
            Up = ( dzp**2*Pp*HankelP(1)*cos(phi(j)) )/(2d0);
            Um = ( dzm**2*Pm*HankelM(1)*cos(phi(j)) )/(2d0);
            
            Vp = ( dzp**2*Pp*HankelP(1)*sin(phi(j)) )/(2d0);
            Vm = ( dzm**2*Pm*HankelM(1)*sin(phi(j)) )/(2d0);
            
            Wp = -dzp*Rp*HankelP0(1)/2d0;
            Wm = -dzm*Rm*HankelM0(1)/2d0;
            
            u_res(j) = ht/2d0*(Up-Um)*ci; v_res(j) = ht/2d0*(Vp-Vm)*ci; w_res(j) = ht/2d0*(Wp-Wm)*ci;
        enddo  
        write(1,'(A)') "% x, y, z, R, phi, psi, real(u_asym), imag(u_asym), real(v_asym), imag(v_asym), real(w_asym), imag(w_asym)"
        do i = 1, pointsNumber
            write(1, '(15E15.6E3)') x(i), y(i), z(i), R(i), phi(i), psi(i), real(u_res(i)), imag(u_res(i)), real(v_res(i)), imag(v_res(i)), real(w_res(i)), imag(w_res(i))
        enddo
        close(1)
        
    end subroutine plotUres
    
    
    
end module residue