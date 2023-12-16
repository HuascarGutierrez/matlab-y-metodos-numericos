clc, clear all;
%DERIVADAS NUMERICAS CON 3 TT
%funcion = log(2/7*x).*exp(1/2*x.^2)
%derivada=diff(funcion,grado de derivacion)
%der_1_x0 = subs(derivada,1)

x_0=-2;
h=0.1;
der_1_exacta=-0.1353;
der_2_exacta=0;
der_3_exacta=0.1353;


fprintf('\t\tMETODO DE DERIVACION TT\n')
fprintf('Datos\n')
fprintf('x_i = %1.0f\n',x_0)
fprintf('h = %1.4f\n',h)
fprintf('der1_f_x = %1.4f\n',der_1_exacta)
%fprintf('der2_f_x = %1.4f\n',der_2_exacta)
fprintf('____________________________________________________\n')


%f=inline('log(2/7*x).*exp(1/2*x.^2)');
%f=inline('X.^3+4*X-15');
%f=inline('x.^2+cos(x)');
%f=inline('tan(x./3)');
%f=inline('sin(0.5*x.^(1/2))./x');
f=inline('x.*exp(x)');

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

%tercera derivada
%der_3_f=(f(x_0+2*h)-2*f(x_0+h)+2*f(x_0-h)-f(x_0-2*h))/(2*h^3);
der_3_f=(-f(x_0+3*h)+8*f(x_0+2*h)-13*f(x_0+h)+13*f(x_0-h)-8*f(x_0-2*h)+f(x_0-3*h))/(8*h^3);
e_t=abs((der_3_exacta-der_3_f)/der_3_exacta)*100;
fprintf('La segunda derivada es: %10.4f\n',der_3_f)
fprintf('Con un error de: %17.2f%%\n\n',e_t)
