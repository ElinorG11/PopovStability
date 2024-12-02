clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'color', [1, 1, 1]);

% Example data
x = linspace(0.001,100,100); % 1x100 vector
Dth=8.88509929913383;
y = linspace(0.01, Dth+10,100); % 1x100 vector (for the other dimension)
[X, Y] = meshgrid(x, y);  % Create a grid for the 100x100 matrix
Z = readmatrix('poles_inductance.xlsx');            % Example 100x100 matrix

% Plotting
surf(X, Y, Z, 'EdgeColor', 'none'); % Use 'EdgeColor' to remove grid lines
colormap('jet');                    % Set colormap

xlabel('Inductance [H]');
ylabel('Damping coefficient');
zlabel('Pole value');

ax = gca;
ax.FontSize = 16;
set(gca,'FontSize',30);
set(gcf,'Color','white');
view(3);                            % Ensure it's in 3D view
