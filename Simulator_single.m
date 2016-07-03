function [MCarlo,Analytic] = Simulator_single(rangeL_r1,r2_L,L,total)
% MCarlo = zeros(1,length(rangeL_r1));
% Analytic = zeros(1,length(rangeL_r1));
parfor j = 1:length(rangeL_r1)
    r2 = r2_L*L;
    r1 = L/rangeL_r1(j);
    MCarlo(j) = monte_carlo(r1,r2,L,total);
    Analytic(j) = analytical_values(r1,r2,L);
end

% plot(rangeL_r1,MCarlo,'b.');
% hold on;
% plot(rangeL_r1,Analytic,'r');
