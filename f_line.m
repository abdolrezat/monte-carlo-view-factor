function hit = f_line(r1,r2,L)
x_p = rand()*2*r1-r1;
y_p = rand()*2*r1-r1;
%generating random direction vector by angles t and s
t = asin(sqrt(rand()));
s = rand()*2*pi;
% u_vector = [cos(t)*cos(s);sin(t)*cos(s);sin(s)];
u_x = cos(s)*sin(t);
u_y = sin(s)*sin(t);
u_z = cos(t);
%equation of a line from starting point following the direction vector
J =L/u_z;
y_intersect = J*u_y + y_p;
x_intersect = J*u_x + x_p;
%checking if the line has hit the target radius
if(y_intersect^2 + x_intersect^2 < r2^2)
    hit = 1;
else
    hit = 0;
end
