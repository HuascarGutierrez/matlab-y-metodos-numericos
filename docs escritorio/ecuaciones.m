clc, clear all;
fprintf('\t\tMETODO DE LA INVERSA\n')
fprintf('Los datos son:\n')
A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2]
B = [-8;13;8;-1]
%C = [5 4;1 2]
%D = [3 2;-2 -5]
%X = C+D %suma de matrices
%X = C*D %multiplicacion de matrices 
%trace(A)
%det(A)
%inv(A)
%poly(A)
%eig(A)
%RESULTADO = inv(A)*B
det_A = det(A)
if det_A==0
    fprinft('El sistema no tiene solucion')
else
    fprintf('La solucion es: \n')
    RESULTADO = inv(A)*B;
    disp(RESULTADO) %disp 4 decimales
end
