%% Richie Ngo MIE 402 27413591 Pre-Lab 6

% Initializes circuit values
R = 470;        % resistance, ohms
L = 100*10^-3;  % inductance, henrys
Rl = 70;        % inductor resistance, ohms
Req = R + Rl;   % equivalent resistance in series, ohms
C = 1*10^-6;    % capacitance, farads

% 1.
figure(1)
G1 = tf([L 0], [L*C*Req L R]);
bode(G1)
grid

% 2.
figure(2)
G2 = tf(1, [R*C 1]);
bode(G2)
grid

% 3.
figure(3)
G3 = tf(1, [L*C Req*C 1]);
bode(G3)
grid

% 4.
figure(4)
G4 = tf([L 0 0], [L Req 1/C]);
bode(G4)
grid

% 5.
figure(5)
G5 = tf(R, [L*C*Req L Req]);
bode(G5)
grid

% 6.
figure(6)
G6 = tf(L, [Req L]);
bode(G6)
grid

% 7.
figure(7)
G7 = tf([R*C 0], [R*C 1]);
bode(G7)
grid