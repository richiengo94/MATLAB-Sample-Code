%{  
    Richie Ngo
    MIE 402
    27413591
    Pre-Lab #2
%}

f_max = 70/2;
f_s1 = 8*f_max;
f_s2 = 3*f_max;
f_s3 = 1.4*f_max;
f_s4 = f_s1;
N1 = 281;
N2 = 106;
N3 = N1;
N4 = 45;
T_max1 = N1/f_s1;
T_max2 = N2/f_s2;
T_max3 = N3/f_s3;
T_max4 = N4/f_s4;
t1 = 1/f_s1:1/f_s1:T_max1;
t2 = 1/f_s2:1/f_s2:T_max2;
t3 = 1/f_s3:1/f_s3:T_max3;
t4 = 1/f_s4:1/f_s4:T_max4;

v1 = 1.5*sin(70*pi*t1);
v2 = 1.5*sin(70*pi*t2);
v3 = 1.5*sin(70*pi*t3);
v4 = 1.5*sin(70*pi*t4);
V1 = fft(v1)/(N1/2);
V2 = fft(v2)/(N2/2);
V3 = fft(v3)/(N3/2);
V4 = fft(v4)/(N4/2);
dt1 = 1/f_s1;
dt2 = 1/f_s2;
dt3 = 1/f_s3;
dt4 = 1/f_s4;
f1 = (1/(N1*dt1))*(0:N1-1);
f2 = (1/(N2*dt2))*(0:N2-1);
f3 = (1/(N3*dt3))*(0:N3-1);
f4 = (1/(N4*dt4))*(0:N4-1);

subplot(4, 2, 1);
plot(t1, v1);
title('(I)');
xlabel('Frequency [Hz]');
ylabel('v(t) [V]');
xlim([0, t1(end)]);
subplot(4, 2, 2);
plot(f1(1:N1/2), abs(V1(1:N1/2)), '*');
title('(I)');
xlabel('Frequency [Hz]');
ylabel('V(f)');
subplot(4, 2, 3);
plot(t2, v2);
title('(II)');
xlabel('Frequency [Hz]');
ylabel('v(t) [V]');
xlim([0, t2(end)]);
subplot(4, 2, 4);
plot(f2(1:N2/2), abs(V2(1:N2/2)), '*');
title('(II)');
xlabel('Frequency [Hz]');
ylabel('V(f)');
subplot(4, 2, 5);
plot(t3, v3);
title('(III)');
xlabel('Frequency [Hz]');
ylabel('v(t) [V]');
xlim([0, t3(end)]);
subplot(4, 2, 6);
plot(f3(1:N3/2), abs(V3(1:N3/2)), '*');
title('(III)');
xlabel('Frequency [Hz]');
ylabel('V(f)');
subplot(4, 2, 7);
plot(t4, v4);
title('(IV)');
xlabel('Frequency [Hz]');
ylabel('v(t) [V]');
xlim([0, t4(end)]);
subplot(4, 2, 8);
plot(f4(1:N4/2), abs(V4(1:N4/2)), '*');
title('(IV)');
xlabel('Frequency [Hz]');
ylabel('V(f)');