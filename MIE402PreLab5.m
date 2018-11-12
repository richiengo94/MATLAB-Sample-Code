% Richie Ngo MIE402 27412591 Prelab Mechanical Vibration

% Initializes variables used for systems
s = tf('s');
omega_n = 2*pi;
zeta_under = .5;
zeta_crit = 1;
zeta_over = 1.5;

% Creates systems with different zeta values
sys_under = 1/(s^2 + 2*zeta_under*omega_n*s + omega_n^2);
sys_crit = 1/(s^2 + 2*zeta_crit*omega_n*s + omega_n^2);
sys_over = 1/(s^2 + 2*zeta_over*omega_n*s + omega_n^2);

% Plots systms in response to impulse function
impulse(sys_under, '--',sys_crit, 'r*-', sys_over, 'g-');
legend('zeta = .5', 'zeta = 1', 'zeta = 1.5');

% General Solution of X*exp(-zeta*omega_n)*sin(omega_d*t + phi)
% exp(-zeta_n*omega_n) is rate of amplitude decay
decay_rate_under = exp(-zeta_under*omega_n)
decay_rate_crit = exp(-zeta_crit*omega_n)
decay_rate_over = exp(-zeta_over*omega_n)