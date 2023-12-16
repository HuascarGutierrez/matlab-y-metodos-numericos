%METODO DE SIMPSON 3/8
clc, clear all;
fprintf('\n \t \t Metodo de Simpson 3/8 \n \n')
%Datos
f=inline('(5*sin(3*x))./(pi()*x)');

a=-1;
b=1; %limite superior
n=360; %Numero de segmentos
I_exacta=5.8844;
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
   if a+k*h~=0
       suma=suma+2*f(a+k*h);
   else
       suma=suma+2*4.7746;
   end
end
suma=suma+f(b);
I_aprox=suma*h*3/8;
I_aprox=(I_aprox)
e_t=abs((I_aprox-I_exacta)/I_exacta)*100;
fprintf('____________________________________________________________\n')
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n\n',I_aprox)
fprintf('La integral exacta es: \t\t\t\tI_exacta=%4.4f u^2\n\n',I_exacta)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.3f%%\n',e_t)
