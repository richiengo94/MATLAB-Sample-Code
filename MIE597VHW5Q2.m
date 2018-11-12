syms w X1 X2 X3;
% Initial conditions
x1_0 = 0;
x2_0 = .05;
x3_0 = 0;
x1_dot_0 = 0;
x2_dot_0 = 0;
x3_dot_0 = 0;
X = [X1; X2; X3];
% Creates M-matrix
m = 200;
M = eye(3)*m;
M(2,2) = 2000;
% Creates K-Matrix
E = .6*10^9;
l = 2;
I = 4.17*10^-5;
k = [9/64 1/6 13/192; 1/6 1/3 1/6; 13/192 1/6 9/64];
K = E*I/l^3*k;
% Creates A-matrix
A = -M*w^2+K;
% Finds characteristic equation and sets to 0 to solve for nat. freq.
char_eq = det(A);
wn = sort(double(solve(char_eq == 0)));
% Finds the corresponding mode shapes for nat. freq.
for i = 1:3
	A_new(i).w = double(subs(A, w, wn(i+3)));
	A_new(i).modes = rref(A_new(i).w);
	disp(wn(i+3));
	disp(A_new(i).w);
	disp(A_new(i).modes);
end
% Solves for x-vector and x_dot-vector
x = rref([1 1 1 0; -.823 0 6.07 .05; 1 -1 1 0]);
x_dot = rref([.304 1.07 1.92 0; -.823*.304 0 6.07*1.92 0; .304 -1.07
1.92 0]);
disp(x);
disp(x_dot);
% Plots as function of time
t = [0:.1:25];
x1 = -.0073*sin(.304.*t+pi/2)+.0073*sin(1.92.*t+pi/2);
x2 = (-.823)*(-.0073*sin(.304.*t+pi/2))+6.07*(.0073*sin(1.92.*t
+pi/2));
x3 = -.0073*sin(.304.*t+pi/2)+.0073*sin(1.92.*t+pi/2);
plot(t, x1,'--', t, x2, t, x3, 'd');
title('MIE 597V HW5Q1');
xlabel('Time (s)');
ylabel('x(t) (m)');
legend('x1', 'x2', 'x3');