close all; clear; clc;
%%
tol     =   1E-14;
a    	=   1.0;
b    	=   2.0;
%% Example 1
I    	=   Romberg(@(x)func(x),a,b,tol);
fprintf('I\t=\t%21.14E\n',I);
%% Example 2
RombergDisp(@(x)func(x),a,b,3);
%% 
function[y]=func(x)
y   	=   log(x-cos(x.^2));
% y   	=   1./x;
end
%%