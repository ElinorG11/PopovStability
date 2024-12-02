clear; clc;
omega = readmatrix("trajectory_changing_frequency.xlsx");
time = readmatrix("time_changing_frequency.xlsx");

%%
plot(time, omega);
