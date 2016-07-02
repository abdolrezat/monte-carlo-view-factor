tic
L = 1;
r2_L = 1.25;
j = 1;
rangeL_r1 = 0:0.1:5;
total = 2000000;
parfor j = 1:length(rangeL_r1)
    r2 = r2_L*L;
    r1 = L/L_r1;
    MCarlo(j) = monte_carlo(r1,r2,L);
    Analytic(j) = analytical_values(r1,r2,L,total);
end

plot(rangeL_r1,MCarlo,'b.');
hold on;
plot(rangeL_r1,Analytic,'r');
toc