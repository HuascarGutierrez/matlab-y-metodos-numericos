clc, clear all, close all;
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
%f=inline('5./(2*x-3)+exp(-pi*x)+log(x.^(1/3))');
%f=inline('1-exp(-2*x)');
f=inline('1-x-4*x.^3+2*x.^5');
x=[2:0.01:8];
plot(x,f(x),'-m');
%metodo del trapecio
fprintf('\tMétodo del trapecio\n')
a=-1; %limite inferior
b=0.5182; %limite superior
n=50; %nro de segmentos
h=(b-a)/n;
I_exacta=1.7724;

fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.4f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
fprintf('____________________________________________________________\n')


x=linspace(a,b,100);
plot(x,f(x),'-b');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la función x');
legend('f(x)');

s=0;
s=s+f(a);
for i=1:1:n-1
    s=s+2*f(a+i*h);
end
s=s+f(b);
I_aprox=s*h/2;
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n',I_aprox)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)