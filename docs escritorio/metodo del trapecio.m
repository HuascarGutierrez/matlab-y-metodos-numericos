clc, clear all, close all;
x=[2:0.1:8]ñ
f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
plot(x,f(x),'-m');