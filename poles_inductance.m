clear; clc;

Values = linspace(0.001,100,100);
parameterNum = length(Values);
NumDValues = 100;

poleVector = zeros([NumDValues, parameterNum]);

for k = 1:parameterNum
% System parameters
H=1;
V=100;
R=100;
L=Values(k);
fs = 50;

R2 = R^2;
L2 = L^2;
V2 = V^2;

omega_s = 2*pi*fs;
Pref = 3*V^2*R/(R^2 + (omega_s*L)^2);
Pstar = Pref;
Qstar = 3*V^2*omega_s*L/(R^2 + (omega_s*L)^2);
Sstar = (Pstar^2 + Qstar^2)^0.5;
Dth = (Qstar*Pstar/(Sstar - Qstar))/(2*omega_s);

D_values = linspace(0.01, Dth+10,100);

% Simulation parameters
sim_time = 10;

% Run simulation
Elinor1; % opens Simulink file

for i = 1:NumDValues
D = D_values(i);


% Run simulation
Elinor1; % opens Simulink file
sim('Elinor1');  % this will run the simulation automatically

% Linearization
io = getlinio('Elinor1'); % define linear model inputs and outputs
op = operpoint('Elinor1'); 
op.States(1).x = omega_s;
linsys = linearize('Elinor1',io,op); % linearize the system at the operating point
[Ap,Bp,Cp,Dp]=ssdata(linsys); % the linear system
po = pole(linsys);

poleVector(i, k) = po;
end
end

writematrix(poleVector, "poles_inductance_.xlsx");
