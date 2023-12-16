clc, clear all;
%MÉTODO DE GAUSS JORDAN
fprintf('\t\tMETODO DE GAUSS JORDAN\n')
fprintf('________________________________________\n')
fprintf('Los datos son:\n')
%DATOS

%A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2];
%B = [-8;13;8;-1];
A = [-3 5 2;-1 -2 3;9 -15 -6]
B = [7;4;0]

%ALGORITMO

AU = [A B]
n = size(AU,1);
fprintf('________________________________________\n')
if det(A) ~= 0
    for i=1:n
    AU(i,:) = (1/AU(i,i))*AU(i,:);
    for j=1:n
        if j~=i
            AU(j,:) = -AU(j,i)*AU(i,:)+AU(j,:);
        end
    end
    end
    disp(AU(:,end))
else
    fprintf('El sistema presente varias soluciones o no tiene solucion')
end