clear; clc;

%R_values = [0.1, 0.5, 1, 5, 10, 100];
R_values = linspace(0.001,1,100);
resistanceNum = length(R_values);
NumDValues = 100;

poleVector = zeros([NumDValues, resistanceNum]);

for k = 1:resistanceNum
% System parameters
H=1;
V=100;
R=R_values(k);
L=0.1;
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

%D_values = [0.01, 0.03 , 0.04, 0.06, 0.5, 1, 10, Dth, Dth+10]; % test different damping coefficient values
%D_values = [0.01, 0.03 , 0.07, 0.5, 1, 10, Dth, Dth+10, Dth+50]; % test different damping coefficient values
D_values = linspace(0.01, Dth+10,100);




% Simulation parameters
sim_time = 10;

% Run simulation
Elinor1; % opens Simulink file

column_length = 50006;
omegaMatrix = zeros([NumDValues, column_length]);


for i = 1:NumDValues
D = D_values(i);


% Run simulation
Elinor1; % opens Simulink file
sim('Elinor1');  % this will run the simulation automatically

maxl = length(ans.omega_y);
omegaMatrix(i,1:maxl) = ans.omega_y';

% Linearization
io = getlinio('Elinor1'); % define linear model inputs and outputs
op = operpoint('Elinor1'); 
op.States(1).x = omega_s;
linsys = linearize('Elinor1',io,op); % linearize the system at the operating point
[Ap,Bp,Cp,Dp]=ssdata(linsys); % the linear system
po = pole(linsys);

poleVector(i, k) = po;

% writematrix(omegaMatrix', "frequency.xlsx");
% if i == 1
% writematrix(ans.tsim, "time.xlsx");
% end
end
end
writematrix(poleVector, "poles-v2.xlsx");


%figure(); plot(real(po),imag(po),'x'); title('poles');
%figure(); plot(omegaMatrix); title('frequency');
