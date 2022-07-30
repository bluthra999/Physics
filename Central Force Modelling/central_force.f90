! This calculates orbits round a point mass with the same mass as the
! Earth. A primitive integrator is used so the orbits won't be very
! accurate.
! For an approximately geostationary orbit enter:
! Initial dist = 42000 km
! Initial vx   = 0
! Initial vy   = 3.08 km/s
program central_force
    implicit none
    ! We'll take the Earth as an example so GM = 5.972E24 x 6.674E-11
    real,parameter :: GM = 3.986E14
    real :: x0,y0,t0=0,tf,dt,t,x,y,ax,ay,vx,vy,vx0,vy0,costheta ,tantheta2,sintheta
    write(*,fmt="(a)",advance="no")"Enter the position from earth (km) "
    read*,x0
    ! taking initial point to be (x0,0)
    x0 = x0*1000.0
    y0=0
    write(*,fmt="(a)",advance="no")"x component of initial velocity in km/s: "
    read*,vx0
    vx0 = vx0*1000.0
    write(*,fmt="(a)",advance="no")"y component of initial velocity in km/s: "
    read*,vy0
    vy0 = vy0*1000.0
    write(*,fmt="(a)",advance="no")"Enter the  time limit:  "
    read*, tf
    write(*,fmt="(a)",advance="no")"Enter the step size: "
    read*, dt
    x=x0
    y=y0
    t=t0
    vx=vx0
    vy=vy0
    open(unit=10,file="centralforce.dat")
    do while(t<tf)
         ! we use trig identities to get sin and cos from tan^2
        tantheta2 = y*y/(x*x)
        ! sin^2 = tan^2/(1 + tan^2)
        sintheta = sqrt(tantheta2/(1.0 + tantheta2))
        ! Make sure sin goes negative for pi < theta < 2pi
        if (y < 0) then
            sintheta = -sintheta
        end if
        
        ! cos^2 = 1/(1 + tan^2)
        costheta = sqrt(1.0/(1.0 + tantheta2))
        ! Make sure cos goes negative for pi/2 < theta < 3pi/2
        if (x < 0) then
            costheta = -costheta
        end if
        ax= -GM*costheta/(x**2+y**2)
        ay= -GM*sintheta/(x**2+y**2)
        x=x+vx*dt+ax*dt*dt*0.5
        y=y+vy*dt+ay*dt*dt*0.5
        vx=vx+ax*dt
        vy=vy+ay*dt
        t= t+dt
        write(10,*)t,x,y
    end do
    close(10)
    end program central_force
