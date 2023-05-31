function[]=RombergDisp(func,a,b,K)
%   function[]=RombergDisp(func,a,b,k)
%   Romberg integrates function "func" of one variable and nonsingular    
%   from "a" to "b" with order of "K" and displays all results. 
%   k>0
%  	I = RombergDisp(@func,a,b,k)
%   e.g. 
%   RombergDisp(@sin,0,pi,2)
%   0.000000000000000	
%   1.570796326794897	2.094395102393195	
%   1.896118897937040	2.004559754984421	1.998570731823836
tol    	=   1E-10;
kmax   	=	abs(K);
R    	=	zeros(1,kmax+1);
err    	=	1;
Ip    	=	0;
R(1)   	=   ((b-a)/2)*(func(a)+func(b));
fprintf('%21.14E\n',R(1));
k     	=   1;
while(err>tol*abs(Ip))
	R(k+1) 	=   trapm(func,a,b,k+1,R(k));
    fprintf('%21.14E\t',R(k+1));
    for j=k:-1:1
        p       =	4^(k-j+1);
        R(j)	=	(p*R(j+1)-R(j))/(p-1);
        fprintf('%21.14E\t',R(j));
    end
    fprintf('\n');
  	err  	=	abs(R(1)-Ip);
    Ip   	=	R(1);
    k    	=	k+1;
    if k==K+1
        break;
    end
end
end
%%
function[I]=trapm(func,a,b,k,Ip)
I      	=   0.5*Ip+((b-a)/(2^(k-1)))*sum(func(a+(2*(1:2^(k-2))-1)*(b-a)/(2^(k-1))));
end
%%

