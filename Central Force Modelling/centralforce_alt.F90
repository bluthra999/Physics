program last
        implicit none
        real :: L, m1, m2, q, e, alpha, r
        real, parameter :: G = 6.67408d-11, pi = 3.14159
        integer :: i
        write(*,'("Enter the mass of particle : ")', advance = "no")
        read *, m1
        write(*,'("Enter the angular momentum of particle : ")', advance = "no")
        read *, L
        write(*,'("Enter the mass of central object : ")', advance = "no")
        read *, m2
        write(*,'("Enter the eccentricity : ")', advance = "no")
        read *, e
        open(19, file = "central_force.dat")
        do i = 0, 360
                r = (l*l)/(m1*G*m1*m2) * (1/(1 + e*cos(i*pi/180)))
                write(19, '(F0.4, 2X, F0.4)') r*cos(i*pi/180), r*sin(i*pi/180)
        end do
end program last
