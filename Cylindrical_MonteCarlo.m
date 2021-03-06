%% this Script Simulates and plots altogether view factor curves 
tic
%
L = 1;
rangeL_r1 = [0:0.01:1,1.02:0.03:2,2.05:0.05:4,4.1:0.5:10];
total = 80000;
r2_L = [0.3,0.4,0.6,0.8,1.0,1.25,1.5,2,3,4,5,6,8];
% CORE = cell(2,length(r2_L));
parfor i = 1:length(r2_L)
    tic
    [MCarlo,Analytic] = Simulator_single(rangeL_r1,r2_L(i),L,total);
    CORE(:,i) = {MCarlo,Analytic};
    toc
end
%save variables to file
save('Cylindrical_Results');
toc
%% Plot Results
h = figure('units','normalized','Name','View Factors','Position',[0.11201 0.2513 0.40996 0.54688]);
for i = 1:length(r2_L)
semilogx(rangeL_r1,CORE{1,i},'b.')
hold on
semilogx(rangeL_r1,CORE{2,i})
end
xlim([0.1,rangeL_r1(length(rangeL_r1))]);
title('View Factors')
f = figure('units','pixels','Name','Error','position',[724 194 560 420]);
hold on
for i = 1:length(r2_L)
plot(rangeL_r1,CORE{2,i}-CORE{1,i});
end

title('Error')

% load handel
% sound(y(1:16500),Fs)