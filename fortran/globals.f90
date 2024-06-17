module globals
implicit none

integer i, pointsNumber, ibess, jbess
real*8 lamda, mu, rho
real*8 xmin, xstep, xmax, ww, pi, f, psimin, psistep,  psimax, RSngl, phiSngl, ySngl, zSngl
real*8 kappa(2), PwaveLen, SwaveLen
real*8 brk, tmp
complex*16 sigma(2), ci
parameter (pi=3.141592653589793d0)
parameter (ci=(0d0,1d0))
real*8, allocatable:: x(:), y(:), z(:), phi(:), psi(:), R(:)
complex*16, allocatable:: u(:), v(:), w(:), u_asym(:), v_asym(:), w_asym(:), u_res(:), v_res(:), w_res(:) 
real*8 t1, t2, t3, t4, tm, tp, eps, step, IntLimit
character (len=10) :: mode

    contains
   
    subroutine InitGlobals
    implicit none
! Material parameters
        lamda = 55.5d0; mu = 26.1d0; rho = 2.698d0;
        
! Study mode  'segment' or 'arc'
        mode = 'arc';
        pointsNumber = 201;  
        
! Points at line segment       
        xmin = 0.5d0; xmax = 2d0 !  в длинах р волн
        zSngl = -0.01d0; ySngl = 0d0;
        
! Points at arc
        psimin = pi/2d0;  psimax = pi
        RSngl = 10d0; ! в длинах p волн!!! 
        phiSngl = 0d0;
        
! Frequency        
        f = 0.7d0
               
! Work settings        
        ibess=0
        jbess=0
        tm = 2d-2
        tp = 0d0 
        eps = 1d-6 
        step = 1d-2 
        IntLimit = 1d3
        
! Preparing calculations                        
        ww = 2d0*pi*f
        
        kappa(1) = sqrt(rho*ww**2/(lamda+2d0*mu))
        kappa(2) = sqrt(rho*ww**2/(mu))
        
        SwaveLen = sqrt(mu/rho); PwaveLen = sqrt((lamda+2d0*mu)/rho);
        
        Rsngl = PwaveLen*Rsngl
        xMin = xMin*PwaveLen; xMax = xMax*PwaveLen;
        
        t1 = Kappa(1)*0.5; t2 = t1; t3 = t1; t4 = (Kappa(2)*1.4d0);
        allocate(x(pointsNumber), y(pointsNumber), z(pointsNumber), R(pointsNumber), phi(pointsNumber), psi(pointsNumber),&
            u(pointsNumber), v(pointsNumber), w(pointsNumber), u_asym(pointsNumber), v_asym(pointsNumber), w_asym(pointsNumber), &
            u_res(pointsNumber), v_res(pointsNumber), w_res(pointsNumber))
        
        
        open(1, file="C:\Users\tiama\OneDrive\–абочий стол\IMMI\!!  ирилл диплом 2024\COMSOL\points.txt")
        write(1,'(A)') "% x, y, z"

        if (mode == 'segment') then
            xStep = (xMax-xMin)/pointsNumber;
            do i = 1, pointsNumber
                x(i) = xmin+xstep*(i-1); y(i) = ySngl; z(i) = zSngl;
                R(i) = sqrt(x(i)**2+y(i)**2); phi(i) = 0d0; psi(i) = 0d0; ! здесь не учитываютс€ значени€ x, y !!!
                
                write(1, '(7(2E15.6E3))') , x(i), y(i), z(i)
            enddo
        else if (mode == 'arc') then
            psiStep = (psiMax-psiMin)/pointsNumber;
            do i = 1, pointsNumber
                psi(i) = psiMin+psiStep*(i-1); phi(i) = 0d0; R(i) = RSngl;
                x(i) = RSngl*sin(psi(i))*cos(phi(i)); y(i) = RSngl*sin(psi(i))*sin(phi(i)); z(i) = RSngl*cos(psi(i));
                
                write(1, '(7(2E15.6E3))') , x(i), y(i), z(i)
            enddo
        endif
        close(1)
        

    end subroutine InitGlobals
    
 end module globals