clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

omega = readmatrix("trajectory_changing_damping.xlsx");
time = readmatrix("time_changing_damping.xlsx");

% Define the vector
Dth=8.88509929913383;
D_values = linspace(0.01, Dth+10,10);

% Generate the cell array of strings
legend_labels = arrayfun(@(v) sprintf('D=%.1f', v), D_values, 'UniformOutput', false);



plot(time, omega,'LineWidth',2);
xlabel('Damping Coefficient');
ylabel('$\omega$ [rad]');
set(gca,'FontSize',30) %gca returns the current axes in the current figure
set(gcf,'Color','white');

% Add the legend using generated labels
legend(legend_labels, 'Location', 'best', FontSize=20);

grid('on');
