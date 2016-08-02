%reads the data from simulation
CL = load('Cylindrical_Results_Detailed')
r2_L = CL.r2_L;
rangeL_r1 = CL.rangeL_r1;
h = figure('units','normalized','Name','View Factors','Position',[0.11201 0.2513 0.40996 0.54688]);
for i = 1:length(r2_L)
semilogx(CL.rangeL_r1,CL.CORE{1,i},'b.')
hold on
semilogx(CL.rangeL_r1,CL.CORE{2,i})
end
xlim([0.1,rangeL_r1(length(rangeL_r1))]);
xlabel('L/r1')
ylabel('r2/L')
title('View Factors')
f = figure('units','pixels','Name','Error','position',[724 194 560 420]);
hold on
for i = 1:length(r2_L)    
    C = CL.CORE{2,i}-CL.CORE{1,i};
    Err(i,:) = [max(C),rangeL_r1(find(C == max(C))),r2_L(i)];
    plot(CL.rangeL_r1,C);
end
xlabel('L/r1')
ylabel('Error')
title('Error')
e1 = figure();
Q(:,1) = Err(:,1);
Q(:,2) = Err(:,3)./Err(:,2);
f2 = fit(Q(:,1),Q(:,2),'exp1')
f1 = @(x)((log(x)-log(f2.a))/f2.b);
range = [0:0.001:70];
F = [range',f1(range)'];
plot(F(:,1),F(:,2)*100);
hold on
plot(Q(:,2),Q(:,1)*100,'r.');
hold off
xlabel('r2/r1')
ylabel('%Error')
title('Error')