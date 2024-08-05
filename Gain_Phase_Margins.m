clc
clear all
close all

% Define the Loop Transfer Function:
z     = [4];          % Zeros
p     = [-1,-1,-2,3]; % Poles
[a,b] = zp2tf(z,p,10);
sys   = tf(a,b);

% Finding the margions:
[Gm,Pm,Wcg,Wcp] = margin(sys);

% Ploting the Nyquist plot:
nyquist(sys)

% Find roots for crossing with real axis:
Pim = [1 0 3 0 -58 0];
rim = roots(Pim);

% Evaluating GH(jw) for w = 2.5024: 
p1 = [-5 0 -41 0 24];
p2 = [1 0 7 0 -6];
p3 = [1 0 13 0];
y1 = polyval(p1,2.5024);
y2 = polyval(p2,2.5024);
y3 = polyval(p3,2.5024);
yr = 10*(y1/(y2^2+y3^2));

% Finding the roots for crossing with imaginary axis:
Pre = [-5 0 -41 0 24];
rre = roots(Pre);

% Evaluating GH(jw) for w = 0.7407: 
p1 = [1 0 3 0 -58 0];
p2 = [1 0 7 0 -6];
p3 = [1 0 13 0];
y1 = polyval(p1,0.7407);
y2 = polyval(p2,0.7407);
y3 = polyval(p3,0.7407);
yi = 10*(y1/(y2^2+y3^2));

% Multiplication of two polynomials:
syms w
a = w^3 + 13*w; 
b = w^3 + 13*w;
out = expand(a*b);

% Evaluationg PM:
t1 = [1 0 13 0];
t2 = [1 0 7 0 -6];
y1 = polyval(t1,1.8827);
y2 = polyval(t2,1.8827);

PM = (atan(1.8827/(-4)) - atan(-y1/y2))*(180/pi);
