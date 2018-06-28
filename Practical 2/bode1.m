% Theoretical Frequency range
x = 0:100000;
% Empirical frequency range
hz = [100 200 500 1000 2000 4000 5000 8000 10000 20000 50000 100000];
% Empirical data for low pass RC
% gain = [-19.288 -14.155 -7.230 -3.479 -1.830 -1.724 -1.884 -2.615 -3.223 -6.558 -13.351 -19.332];
% phase = [80.64 80.64 59.04 38.88 15.84 -9.22 -14.40 -34.56 -41.76 -60.48 -77.76 -87.84];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bandpass RC transfer function
R = 330;
C1 = 0.47*10^(-6);
C2 = 0.047*10^(-6);
y1 = 1./sqrt(1 + (2*pi*C2*R.*x).^2);
y2 = R./sqrt(R^2 + (1./(2*pi*C1.*x)).^2);
y = y1.*y2;
theta1 = -atan(2*pi*R*C2.*x);
theta2 = -atan(-1./(2*pi*R*C1.*x));
theta = theta1 + theta2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% log gain conversion
ylog = 20*log(y);

% frequency vs. gain
subplot(2,1,1)
semilogx(x,ylog)
grid on
xlabel('Frequency, Hz')
ylabel('Gain, dB')
title('Gain vs frequency in a band pass RC filter')
% hold on
% semilogx(hz,gain,'o')

%frequency vs. phase
subplot(2,1,2)
theta = theta*360/(2*pi);
semilogx(x,theta)
grid on
xlabel('Frequency, Hz')
ylabel('Phase angle, degrees')
title('Phase shift vs frequency in a band pass RC filter')
% hold on
% semilogx(hz,phase,'o')