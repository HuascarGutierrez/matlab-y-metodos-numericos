%METODO DE SIMPSON 3/8
clc, clear all;
fprintf('\n \t \t Metodo de Simpson 3/8 \n \n')
%Datos
f=inline('exp(-x.^2)+sin(x)./x');
%g=input('Inserte por favor la funcion\n g = ');
%f=inline(g);
a=-4; %limite inferior
%a=input('Inserte por favor el valor del limite inferior\n a = ');
b=-3.1418; %limite superior
%b=input('Inserte por favor el valor del limite superior\n b = ');
n=24; %Numero de segmentos
%n=input('Inserte por favor el valor del numero de segmentos\n n = ');
I_exacta=-0.0937;
fprintf('____________________________________________________________\n')
fprintf('La funcion es:\n')
f
fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.0f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
x=linspace(a,b,100);
plot(x,f(x),'-m');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la integral');
legend('f(x)','Área');
h=(b-a)/n;
suma=f(a);
for i=1:3:n-2
    suma=suma+3*f(a+i*h);
end
for j=2:3:n-1
   suma=suma+3*f(a+j*h);
end
for k=3:3:n-3
   suma=suma+2*f(a+k*h);
end
suma=suma+f(b);
I_aprox=suma*h*3/8;
e_t=abs((I_aprox-I_exacta)/I_exacta)*100;
fprintf('____________________________________________________________\n')
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n\n',I_aprox)
fprintf('La integral exacta es: \t\t\t\tI_exacta=%4.4f u^2\n\n',I_exacta)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)
