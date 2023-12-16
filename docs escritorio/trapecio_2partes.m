clc, clear all, close all;
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
%f=inline('5./(2*x-3)+exp(-pi*x)+log(x.^(1/3))');
%f=inline('1-exp(-2*x)');
%f=inline('exp(-x.^2)');
%f=inline('1-x-4*x.^3+2*x.^5');
f=inline('3*sin(x).*cos(2*x)');
%metodo del trapecio
fprintf('\tMétodo del trapecio\n')
a_1=0; %limite inferior
b_1=0.7852; %limite superior
n=500; %nro de segmentos

a_2=0.7852;
b_2=1;

h_1=(b_1-a_1)/n;
h_2=(b_2-a_2)/n;

fun = @(x) 3*sin(x).*cos(2*x);

I_exacta=integral(fun,a_1,b_1)+abs(integral(fun,a_2,b_2));

fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a_1)
fprintf('El valor de b es:\tb=%3.0f\n',b_2)
fprintf('El valor de n es:\tn=%3.0f\n',n)
fprintf('El valor de la integral exacta es:\tn=%3.4f\n',I_exacta)
fprintf('____________________________________________________________\n')


x=linspace(a_1,b_2,100);
plot(x,f(x),'-b');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la función x');
legend('f(x)');

s=0;
s=s+f(a_1);
for i=1:1:n-1
    s=s+2*f(a_1+i*h_1);
end
s=s+f(b_1);
I_aprox=s*h_1/2;

s=0;
s=s+abs(f(a_2));
for i=1:1:n-1
    s=s+abs(2*f(a_2+i*h_2));
end
s=s+abs(f(b_2));
I_aprox=I_aprox+s*h_2/2;

fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n',I_aprox)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)