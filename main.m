clear; clc;

% System parameters
R_values = linspace(0.001,1,100); % Resistance values
resistanceNum = length(R_values); % Number of different resistance values
NumDValues = 100; % Number of different damping coefficient values to test

poleMatrix = zeros([NumDValues, resistanceNum]); % This matrix will hold the pole values of the system for different Resistance (R) and Damping coefficient (D) values


for k = 1:resistanceNum
% System parameters
H=1; % Inertia
V=100; % Voltage
R=R_values(k); % choose specific resistance value
L=0.1; % Inductance
fs = 50; % frequency

R2 = R^2;
L2 = L^2;
V2 = V^2;

omega_s = 2*pi*fs;
Pref = 3*V^2*R/(R^2 + (omega_s*L)^2); % reference power

% Active, reactive and total power
Pstar = Pref;
Qstar = 3*V^2*omega_s*L/(R^2 + (omega_s*L)^2);
Sstar = (Pstar^2 + Qstar^2)^0.5;

% Damping coefficient threshold calculated by Popov's criterion
Dth = (Qstar*Pstar/(Sstar - Qstar))/(2*omega_s);

D_values = linspace(0.01, Dth+10,NumDValues); % test different damping coefficient values


% Simulation parameters
sim_time = 10;

column_length = 50006; % number of sampled time steps for simulation time of 10s
omegaMatrix = zeros([NumDValues, column_length]);


for i = 1:NumDValues
D = D_values(i); % choose specific damping value

% Run simulation
SimulationFile; % opens Simulink file
sim('SimulationFile');  % this will run the simulation automatically

maxl = length(ans.omega_y); % the length of the samples recorded changes when altering the systems parameters, thus we ensure size sompitability.
omegaMatrix(i,1:maxl) = ans.omega_y'; % save the recorded behavior of the angular frequency during simulation

% Linearization
io = getlinio('SimulationFile'); % define linear model inputs and outputs
op = operpoint('SimulationFile'); 
op.States(1).x = omega_s;
linsys = linearize('SimulationFile',io,op); % linearize the system at the operating point
[Ap,Bp,Cp,Dp]=ssdata(linsys); % the linear system
po = pole(linsys);

poleMatrix(i, k) = po; % save the poles values
end
end

% save information for plotting
writematrix(omegaMatrix', "frequency.xlsx"); % save the recorded dynamics of the system
writematrix(ans.tsim, "time.xlsx"); % save recorded simulation time for plotting
writematrix(poleMatrix, "poles-v2.xlsx"); % save the recorded pole values

