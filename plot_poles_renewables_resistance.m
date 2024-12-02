clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'color', [1, 1, 1]);

fs=50;
omega_s=2*pi*fs;
delta=1;

% Example data
x = linspace(omega_s-delta,omega_s+delta,100); % 1x100 vector
y = linspace(0.001,1,100); % 1x100 vector (for the other dimension)
[X, Y] = meshgrid(x, y);  % Create a grid for the 100x100 matrix
Z = readmatrix('poles_renewables_resistance.xlsx');            % Example 100x100 matrix

% Plotting
surf(X, Y, Z, 'EdgeColor', 'none'); % Use 'EdgeColor' to remove grid lines
colormap('jet');                    % Set colormap

xlabel('Frequency [Hz]');
ylabel('Resistance [$\Omega$]');
zlabel('Pole value');

ax = gca;
ax.FontSize = 16;
set(gca,'FontSize',30);
set(gcf,'Color','white');
view(3);                            % Ensure it's in 3D view
