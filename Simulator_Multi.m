tic
%
L = 1;
rangeL_r1 = 0:0.01:10;
total = 5000000;
r2_L = [0.3,0.4,0.6,0.8,1.0,1.25,1.5,2,3,4,5,6,8];
parfor i = 1:length(r2_L)
    [MCarlo,Analytic] = Simulator_single(rangeL_r1,r2_L(i),L,total);
    CORE(:,i) = {MCarlo,Analytic};
end
hold on;
for i = 1:length(r2_L)
    plot(rangeL_r1,CORE{1,i},'b.')
    plot(rangeL_r1,CORE{2,i},'r')
end
%
toc
% load handel
% sound(y(1:16500),Fs)