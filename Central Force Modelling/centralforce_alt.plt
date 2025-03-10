set terminal gif animate delay 10 optimize
set output "geostationary.gif"
stats "central_force.dat" name "orbit" nooutput
set xlabel "x"
set ylabel "y"
set title "Geostationary Orbit Path"
set grid

# Set ranges to cover the full trajectory
set xrange [orbit_min_x:orbit_max_x]
set yrange [orbit_min_y:orbit_max_y]

do for [i=1:int(orbit_records)] {
    plot "central_force.dat" every ::0::i u 1:2 w l lw 2 lc rgb "blue" \
        title sprintf("Progress: %.1f%%", 100.0*i/orbit_records)
}
