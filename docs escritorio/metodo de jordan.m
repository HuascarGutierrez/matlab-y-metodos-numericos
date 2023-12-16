clc, clear all;
fprintf('\t\tMETODO DE LA INVERSA\n')
fprintf('Los datos son:\n')
A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2]
B = [-8;13;8;-1]

AU = [A B]
AU(2,:) = 4*AU(2,:)