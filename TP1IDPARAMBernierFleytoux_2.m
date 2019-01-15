close all
clear all

load data_ech_50
t2=t
Te = 0.2041;%pas d'échantillonage
%on note phi =(u1;u2;u3;u4;y1;y2;y3) pour simplifier l'ecriture dans matlab
u1 = u
u2=cumsum(u1*Te)
u3=cumsum(u2*Te)
u4=cumsum(u3*Te)
y1=cumsum(-Ybruit*Te)
y2=cumsum(-y1*Te)
y3=cumsum(-y2*Te)
Phi2=[ u1 u2 u3 u4 y1 y2 y3]
% Pestime = [a b c d alpha beta gamma]
Pestime2 = inv(transpose(Phi2)*Phi2)*transpose(Phi2)*Ybruit

Estimation2=Phi2*Pestime2


load data_ech_10000
t1=t
Te1 = 0.001 %pas d'échantillonage
%on note phi =(u1;u2;u3;u4;y1;y2;y3) pour simplifier l'ecriture dans matlab
u1 = u
u2=cumsum(u1*Te1)
u3=cumsum(u2*Te1)
u4=cumsum(u3*Te1)
y1=cumsum(-Ybruit*Te1)
y2=cumsum(-y1*Te1)
y3=cumsum(-y2*Te1)
Phi1=[ u1 u2 u3 u4 y1 y2 y3]
% Pestime = [a b c d alpha beta gamma]
Pestime1 = inv(transpose(Phi1)*Phi1)*transpose(Phi1)*Ybruit

Estimation1=Phi1*Pestime1


% figure;
% hold on;
% plot(t1,Estimation1, 'b')
% plot(t2,Estimation2, 'r')
% %plot(t1,Ybruit, 'b')

load('data_sinus_10000.mat')

num = [1 0];
den = [1 0 1];
%sys = tf(Numerator,Denominator) creates a continuous-time transfer
%function with numerator(s) and denominator(s) specified by Numerator
%and Denominator.
F=tf([Phi1(1) Phi1(2) Phi1(3) Phi1(4)], [1 Phi1(5) Phi1(6) Phi1(7)]);
Sin = tf(num,den);
G = F*Sin;
Estimation3=impulse(G)

figure;
plot(t,Ysinus,'R') %comportement réel du système
figure;
plot(Estimation3,'B')







