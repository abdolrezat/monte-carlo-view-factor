function F12 = monte_carlo(r1,r2,L,total)
z = zeros(1,total); %set to number of parameters
for i=1:length(z)
%% processing
z(1,i) = f_line(r1,r2,L);
%% end of processing
end
%count and divide by total
F12 = nnz(z(1,:)==1)/total;