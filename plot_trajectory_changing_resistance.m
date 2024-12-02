clear; clc;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

omega = readmatrix("trajectory_changing_voltage.xlsx");
time = readmatrix("time_changing_voltage.xlsx");

% Define the vector
values = linspace(0.001,1000,20);

% Generate the cell array of strings
legend_labels = arrayfun(@(v) sprintf('R=%.1f', v), values, 'UniformOutput', false);


%%
plot(time, omega,'LineWidth',2);
xlabel('Resistane [$\Omega$]');
ylabel('$\omega$ [rad]');
set(gca,'FontSize',30) %gca returns the current axes in the current figure
set(gcf,'Color','white');

% Add the legend using generated labels
legend(legend_labels, 'Location', 'best', FontSize=20);

grid('on');