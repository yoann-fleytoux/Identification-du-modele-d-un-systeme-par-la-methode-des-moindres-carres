
load data_ech_10000
Te = 0.001 %pas d'échantillonage
%on note phi =(u1;u2;u3;u4;y1;y2;y3) pour simplifier l'ecriture dans matlab
u1 = u
u2=cumsum(u1*Te)
u3=cumsum(u2*Te)
u4=cumsum(u3*Te)
y1=cumsum(-Ybruit*Te)
y2=cumsum(-y1*Te)
y3=cumsum(-y2*Te)
theta=[ u1 u2 u3 u4 y1 y2 y3]
% Pestime = [a b c d alpha beta gamma]
Pestime = inv(transpose(theta)*theta)*transpose(theta)*Ybruit

Estimation=theta*Pestime
plot(Ybruit, 'R')
hold on;
plot(Estimation, 'B')


load data_ech_50
Te = 0.001
u1 = u
u2=cumsum(u1*Te)
u3=cumsum(u2*Te)
u4=cumsum(u3*Te)
y1=cumsum(-Ybruit*Te)
y2=cumsum(-y1*Te)
y3=cumsum(-y2*Te)
theta=[ u1 u2 u3 u4 y1 y2 y3]
% Pestime = [a b c d alpha beta gamma]
Pestime = inv(transpose(theta)*theta)*transpose(theta)*Ybruit

Estimation=theta*Pestime
figure;
plot(Estimation, 'R')
hold on;
plot(Ybruit, 'B')