clc,clear all;
fprintf('\n\t\t Método Gauss Seidel\n');
%Datos
fprintf('____________________________________________\n')
fprintf('Datos:\n');
A=[3 -1 2;1 1 0;-2 3 -4]
B=[3;3;3]
iter_max=100;
e_max=0.0001;
fprintf('Error estandar: \tE_a = %.2f\n\n\n',e_max);
%inicializando
n=size(A,1);
x_new=zeros(1,n);
%x_new = [27 5 25 4]
iter = 0;
E_a = inf;%e absoluto
%Algoritmo
fprintf('____________________________________________\n')

fprintf('La Solución es: \n')

while iter<iter_max && E_a>e_max
    x_old = x_new;
    for i=1:n
        suma = 0;
        %nuevos
        for j=1:i-1
            suma=A(i,j)*x_new(j)+suma;
        end
        %antiguos
        for j=i+1:n
            suma=A(i,j)*x_old(j)+suma;
        end
        x_new(i)= (B(i)-suma)/A(i,i);
    end
    iter = iter+1;
    E_a=max(abs((x_new-x_old)));
    E_a_porc=max(abs((x_new-x_old)./x_new)*100);
    y(iter,:)=[iter x_new E_a E_a_porc];
end

if iter<iter_max && E_a<e_max
    fprintf('\nEl Método converge en %d iteraciones.\n',iter);
else
    fprintf('\nEl Método no converge en %d iteraciones.\n',iter);
end
fprintf('____________________________________________\n')

display(y);
fprintf('____________________________________________\n')
fprintf('Los rasultados son:\nX_1:%8.4f\nX_2:%8.4f\nX_3:%8.4f\n',y(end,2),y(end,3),y(end,4))
