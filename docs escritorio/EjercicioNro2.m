clc, clear all;

x_0=1;
h=0.08;
der_1_exacta=exp(1)*3;
der_2_exacta=exp(1)*7;

fprintf('\t\tMETODO DE DERIVACION TT\n')
fprintf('Datos\n')
fprintf('x_i = %1.0f\n',x_0)
fprintf('h = %1.4f\n',h)
fprintf('der1_f_x = %1.4f\n',der_1_exacta)
fprintf('der2_f_x = %1.4f\n',der_2_exacta)
fprintf('____________________________________________________\n')

f=inline('x.^2.*exp(x)');
%primera derivada
der_1_f=(-f(x_0+2*h)+8*f(x_0+h)-8*f(x_0-h)+f(x_0-2*h))/(12*h);
e_t=abs((der_1_exacta-der_1_f)/der_1_exacta)*100;
fprintf('La primera derivada es: %10.4f\n',der_1_f)
fprintf('Con un error de: %17.2f%%\n\n',e_t)

%segunad derivada
der_2_f=(-f(x_0+2*h)+16*f(x_0+h)-30*f(x_0)+16*f(x_0-h)-f(x_0-2*h))/(12*h^2);
e_t=abs((der_2_exacta-der_2_f)/der_2_exacta)*100;
fprintf('La segunda derivada es: %10.4f\n',der_2_f)
fprintf('Con un error de: %17.2f%%\n\n',0)

