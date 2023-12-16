clc, clear all;
fprintf('\t\tMETODO DE LA INVERSA\n')
fprintf('Los datos son:\n')
A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2]
B = [-8;13;8;-1]

AU = [A B]

AU(1,:) = (1/A(1,1))*AU(1,:);
AU(2,:) = -AU(2,1)*AU(1,:)+AU(2,:);
AU(3,:) = -AU(3,1)*AU(1,:)+AU(3,:);
AU(4,:) = -AU(4,1)*AU(1,:)+AU(4,:);

AU(2,:) = (1/AU(2,2))*AU(2,:);
AU(1,:) = -AU(1,2)*AU(2,:)+AU(1,:);
AU(3,:) = -AU(3,2)*AU(2,:)+AU(3,:);
AU(4,:) = -AU(4,2)*AU(2,:)+AU(4,:);

AU(3,:) = (1/AU(3,3))*AU(3,:);
AU(1,:) = -AU(1,3)*AU(3,:)+AU(1,:);
AU(2,:) = -AU(2,3)*AU(3,:)+AU(2,:);
AU(4,:) = -AU(4,3)*AU(3,:)+AU(4,:);

AU(4,:) = (1/AU(4,4))*AU(4,:);
AU(1,:) = -AU(1,4)*AU(4,:)+AU(1,:);
AU(2,:) = -AU(2,4)*AU(4,:)+AU(2,:);
AU(3,:) = -AU(3,4)*AU(4,:)+AU(3,:);


%MÉTODO DE GAUSS JORDAN simplificado

%DATOS

A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2];
B = [-8;13;8;-1];

%ALGORITMO

AU = [A B];

%TOMA YA
rref(AU);

fprintf('Matriz aumentada en la ultima iteracion\n')
%AU
fprintf('El vector columna de respuestas es: \n')
disp(AU(:,end))
