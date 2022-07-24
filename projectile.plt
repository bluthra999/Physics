set terminal gif animate delay 5 optimize
set output "projectile.gif"
stats "projectile.txt" name "projectile"
set xrange[projectile_min_x:projectile_max_x]
set yrange[projectile_min_y:projectile_max_y]
set xlabel "y(x)"
set ylabel "Displacement(x)"
do for[i=0:projectile_blocks]{plot "projectile.txt" index i with circle title sprintf("time = %.3f", i*0.005)}