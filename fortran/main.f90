
program main
use globals
use integral
use stPhase
use residue
implicit none

    



    call InitGlobals
    call dinn5(u_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,pointsNumber,u)
    call dinn5(v_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,pointsNumber,v)
    call dinn5(w_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,pointsNumber,w)
    call PlotIntegral
    

    call MakeAsymps
    call PlotSphase
    !call plotUres
    
    
CONTAINS
       
  
    
 
end program main

