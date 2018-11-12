% Richie Ngo, Johhny Zhu
% MIE 597G
% Lab  #1: Analog Circuits
% Part 2.3

s = tf('s');
R1 = 4.7*10^3;  % Ohms
R2 = 470*10^3;  % Ohms
C1 = 1*10^-6;   % Farads
C2 = .01*10^-6; % Farads
tau = R1*C1;    % Time constant
G = R2*C1;      % Gain
sys = -G*s/(tau*s+1)^2;
bode(sys);