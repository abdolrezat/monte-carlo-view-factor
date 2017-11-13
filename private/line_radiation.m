function [finish_line,finish_point] = line_radiation(start_line,p)

%% this function starts from one line of the triangle
%% and calculates the finish line for 
%% a random radiation of a point p and random angle a

%% variables
intersection_with_line = -1; %% no line has been intersected yet 
xin_0_line_1 = @(a,p)((a*p)/(a - 3^(1/2)));             % Ok
xin_0_line_2 = @(a,p)(a*p + 3^(1/2))/(a + 3^(1/2)); % Ok
xin_1_line_0 = @(a,p)((p*(a - 3^(1/2)))/(2*a));        %Ok
xin_1_line_2 = @(a,p)(((p*(a - 3^(1/2)))/2 + 3^(1/2))/(a + 3^(1/2))); %Ok
xin_2_line_0 = @(a,p)((a + 3^(1/2)*p + a*p - 3^(1/2))/(2*a));
xin_2_line_1 = @(a,p)((a + 3^(1/2)*p + a*p - 3^(1/2))/(2*a - 2*3^(1/2)));

%% generating line y = a(x-p)
% p = rand();
a = rand()*pi;
%% Switch 
%% Switch line 0
if(start_line == 0)
    a = tan(a);
%% checking intersection with line 1: y = (3^.5) x
x_in1 = xin_0_line_1(a,p);
if( x_in1<0.5 && x_in1 > 0)
    intersection_with_line = 1;    
    finish_point = x_in1/0.5;    
end
%% checking  intersection with line 2: y = -(3^.5) (x - 1)
x_in2 = xin_0_line_2(a,p);
if( x_in2<1 && x_in2 > 0.5)
    intersection_with_line = 2;    
    finish_point = (x_in2-0.5)/0.5;    
end
end
%% End of line 0

%% Switch line 1
if(start_line == 1)
    a = tan(a-deg2rad(120));
%% checking intersection with line 0: y = 0
x_in0 = xin_1_line_0(a,p);
if( x_in0<1 && x_in0 > 0)
    intersection_with_line = 0;    
    finish_point = x_in0;    
end
%% checking  intersection with line 2: y = -(3^.5) (x - 1)
x_in2 = xin_1_line_2(a,p);
if( x_in2<1 && x_in2 > 0.5)
    intersection_with_line = 2;  
        
    finish_point = (x_in2-0.5)/0.5;
end
end
%% End of line 1

%% Switch line 2
if(start_line == 2)
    a = tan(a+deg2rad(120));
%% checking intersection with line 1: y = (3^.5) x
x_in1 = xin_2_line_1(a,p);
if( x_in1<0.5 && x_in1 > 0)
    intersection_with_line = 1;    
    finish_point = x_in1/0.5;

end
%% checking  intersection with line 0: y = 0
x_in0 = xin_2_line_0(a,p);
if( x_in0<1 && x_in0 > 0)
    intersection_with_line = 0;    
    finish_point = x_in0;
end
end
%% End of line 2
finish_line = intersection_with_line;
