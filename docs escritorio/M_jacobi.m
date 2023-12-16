clc, clear all;
%Metodo jacobi
fprintf('Método de Jacobi para sistemas de ecuaciones\n')
fprintf('____________________________________________\n')
fprintf('Datos\n')
A = [10 1 2 -1;-5 4 6 -1;0 0 -5 5;0 -2 3 8]
B = [-3;9;-1;2]
iter_max = 100;
errmax = 0.01;
n=size(A,1);
X = zeros(1,n);
err1 = inf;
err = 0;
iter = 0;
fprintf('e_std = %1.2f\n',errmax)
fprintf('____________________________________________\n')
fprintf('iter    x_1      x_2      x_3      x_4     e_a\n')
fprintf('____________________________________________\n')
    fprintf('%2.0f %8.4f %8.4f %8.4f %8.4f %8.2f%%\n',iter,X(1),X(2),X(3),X(4),err1)
while  err1>errmax && iter<iter_max
   
    X_old = X;
    for i = 1 : n 
        sum = B(i);
        for j=1 : n
            if(j~=i)
                sum = sum - A(i,j)*X_old(j);
            end
        end
        X(i) = sum / A(i,i);
        err1 = max(abs((X-X_old)./X)*100);
    end
    iter = iter +1;
    fprintf('%2.0f %8.4f %8.4f %8.4f %8.4f %8.2f%%\n',iter,X(1),X(2),X(3),X(4),err1)
    
end
fprintf('____________________________________________\n')
fprintf('Los rasultados son:\nX_1:%8.4f\nX_2:%8.4f\nX_3:%8.4f\nX_4:%8.4f',X(1),X(2),X(3),X(4))
