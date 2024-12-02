clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

omega = readmatrix("trajectory_changing_voltage.xlsx");
time = readmatrix("time_changing_voltage.xlsx");

% Define the vector
V_values = linspace(1.5, 220, 20);

% Generate the cell array of strings
legend_labels = arrayfun(@(v) sprintf('V=%.1f', v), V_values, 'UniformOutput', false);



plot(time, omega,'LineWidth',2);
xlabel('Voltage [V]');
ylabel('$\omega$ [rad]');
set(gca,'FontSize',30) %gca returns the current axes in the current figure
set(gcf,'Color','white');

% Add the legend using generated labels
legend(legend_labels, 'Location', 'best', FontSize=20);

grid('on');
