program projectile
    implicit none
    real,parameter:: pi=22/7
    real,parameter:: g=9.81
    real :: x, y, u, theta, t0, tf, dt,y0
    write(*,fmt="(a)",advance="no")"Enter the initial velocity(m/s): "
    read*,u
    write(*,fmt="(a)",advance="no")"Enter the angle of prjectile (with horizontal): "
    read *, theta
    theta = theta * pi/ 180
    write(*,fmt="(a)",advance="no")"Enter the height at time 0: "
    read *, y0
    ! Calculate the times   
    t0 = 0
    if(theta.ne.0)then
    tf = 2*u*sin(theta)/g
    else
    tf=sqrt(2*y0/g)
    end if 
    dt = (tf - t0)/50

    open (20, file = "projectile.txt")
    do while (t0 .le. tf)
        write (20,*) u*cos(theta)*t0, u*sin(theta)*t0 - 0.5*g*(t0**2)
        write (20, '(/)')
        t0 = t0 + dt
    end do
close(20)
end program projectile