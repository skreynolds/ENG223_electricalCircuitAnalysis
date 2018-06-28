% Theoretical Frequency range
x = 0:10000;
% Empirical frequency range
hz = [10 20 50 100 200 500 1000 2000 4000 5000 8000 10000];
% Empirical data for low pass RC
%gain = [0 0 0 0 0 -0.915 -2.853 -6.375 -11.057 -12.041 -16.478 -18.861];
%phase = [0 0 0 0 -14.4 -33.12 -47.52 -64.80 -74.88 -79.20 -80.64 -86.40];
% Empirical data for low pass RL
% gain = [0 0 0 0 0 0 -0.265 -0.915 -2.615 -3.349 -5.848 -8.291];
% phase = [0 0 0 0 0 0 -17.28 -27.36 -46.08 -51.84 -63.36 -64.80];
% Empirical data for high pass RC
% gain = [-39.172 -33.151 -25.036 -20 -12.76 -6.375 -3.098 -0.724 0 0 0 0];
% phase = [87.84 92.16 90.72 83.52 77.76 66.24 48.96 31.68 0 0 0 0];
% Empirical data for low pass RL
gain = [-41.938 -40.537 -36.249 -31.372 -26.196 -18.562 -12.578 -6.93 -3.223 -2.498 -1.209 -0.915];
phase = [28.80 37.44 63.18 86.40 74.88 77.76 73.44 64.80 51.84 43.20 34.56 31.68];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lowpass RC transfer function
%y = 1./sqrt(1+(x.*330*0.47*10^(-6)).^2);
%theta = -atan(2*pi*x*330*0.47*10^(-6));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lowpass RL transfer function
% y = 75./sqrt(75^2 + (x.*2.4*10^(-3)).^2);
% theta = -atan(2*pi*x*2.4*10^(-3)/75);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Highpass RC Filter
% R = 330;
% C = 0.47*10^(-3);
% y = R./sqrt(R^2 + (1./(x.*C)).^2);
% theta = -atan(-2*pi./(x.*R*C));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Highpass RL filter
R = 75;
L = 2.4*10^(-3);
y = 1./sqrt(1 + (R./(x.*L)).^2);
theta = -atan(-2*pi*R./(x.*L));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% log gain conversion
ylog = 20*log(y);

% frequency vs. gain
subplot(2,1,1)
semilogx(x,ylog)
grid on
xlabel('Frequency, Hz')
ylabel('Gain, dB')
title('Gain vs frequency in a high pass RL filter')
hold on
semilogx(hz,gain,'o')

%frequency vs. phase
subplot(2,1,2)
theta = theta*360/(2*pi);
semilogx(x,theta)
grid on
xlabel('Frequency, Hz')
ylabel('Phase angle, degrees')
title('Phase shift vs frequency in a high pass RL filter')
hold on
semilogx(hz,phase,'o')

