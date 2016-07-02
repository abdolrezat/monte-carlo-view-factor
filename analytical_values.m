function F = analytical_values(r1,r2,L)
R1 = r1/L;
R2 = r2/L;
x = 1+1/R1^2+R2^2/R1^2;
y=sqrt(x^2-4*R2^2/R1^2);
F = (x-y)/2;