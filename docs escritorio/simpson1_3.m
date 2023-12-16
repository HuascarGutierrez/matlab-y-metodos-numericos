%METODO DE SIMPSON 1/3
clc, clear all;
fprintf('\n \t \t Metodo de Simpson 1/3 \n \n')
%Datos

%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
f=inline('sin(x)./x');

%g=input('Inserte por favor la funcion\n g = ');
%f=inline(g);
a=0; %limite inferior
%a=input('Inserte por favor el valor del limite inferior\n a = ');
b=2; %limite superior
%b=input('Inserte por favor el valor del limite superior\n b = ');
n=10; %Numero de segmentos
%n=input('Inserte por favor el valor del numero de segmentos\n n = ');
I_exacta=3.21083;
fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.0f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
x=linspace(-2,b,100);
plot(x,f(x),'-m');
hold on
area(x,f(x));
h=(b-a)/n;
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la integral');
legend('f(x)','Área')
suma=1;
for i=1:2:n-1
    suma=suma+4*f(a+i*h);
end
for j=2:2:n-2
   suma=suma+2*f(a+j*h);
end
suma=suma+f(b);
I_aprox=suma*h*2/3;
%e_t=abs((I_aprox-I_exacta)/I_exacta)*100;
fprintf('____________________________________________________________\n')
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n\n',I_aprox)
fprintf('La integral exacta es: \t\t\t\tI_exacta=%4.4f u^2\n\n',I_exacta)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.1f%%\n',e_t)
