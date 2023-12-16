clc, clear all;
%metodo dle trapecio
fprintf('\n \t \t Metodo del Trapecio \n \n')
%Datos
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
g=input('Inserte por favor la funcion\n g = ');
f=inline(g);
%a=2; %limite inferior
a=input('Inserte por favor el valor del limite inferior\n a = ');
%b=8; %limite superior
b=input('Inserte por favor el valor del limite superior\n b = ');
%n=11; %Numero de segmentos
n=input('Inserte por favor el valor del numero de segmentos\n n = ');
x=[2:0.01:8];
plot(x,f(x),'-m');

%metodo del trapecio
fprintf('\tM?todo del trapecio\n')
h=(b-a)/n;
I_exacta=14.8888;
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
