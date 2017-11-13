%% Monte Carlo Simulation for Radiation Inside an Equilateral Triangle
% tip: enable output (disp(s)) on lines 7,14,17 to see what's going on
% but disable them in order to improve execution speed 

% triangle vectors V1 = [0 0]; V2 = [0.5 sqrt(3)/2]; V3 = [1 0];
total = 10000; %total number of simulations
z = zeros(2,total);
fprintf('Starting Simulation...\n')
h = waitbar(0,'Simulation in progress...');
for i=1:total
%     disp('--Start from line 0')
    start_line = 0;
    start_point= rand();
    while(1)
        [finish_line,finish_point] = line_radiation(start_line,start_point);
        if(rand() > 0.5)
           z(:,i) = [finish_line;finish_point];
%            disp(['radiation successfully hit line ',num2str(finish_line)])
           break;
        else
%          disp(['bounced from line ',num2str(finish_line)]);
         start_line = finish_line;
         start_point = finish_point;
       end
    
    end 
        waitbar(i/total)
end
close(h) %close waitbar handle

Result_0 = nnz(z == 0);
Result_1 = nnz(z == 1);
Result_2 = nnz(z == 2);
R_0 = Result_0/total;
R_1 = Result_1/total;
R_2 = Result_2/total;
E_0 = (R_0 - 0.2)*100;
E_1 = (R_1 - 0.4)*100;
E_2 = (R_2 - 0.4)*100;
%print results
fprintf('Simulation Done. Total number of simulations: %.0f\n',total)
fprintf('%.0f radiations hit surface 1, Radiation View Factor = %.2f, error: %.2f%%\n',Result_0,R_0,E_0);
fprintf('%.0f radiations hit surface 2, Radiation View Factor = %.2f, error: %.2f%%\n',Result_1,R_1,E_1);
fprintf('%.0f radiations hit surface 3, Radiation View Factor = %.2f, error: %.2f%%\n',Result_2,R_2,E_2);
