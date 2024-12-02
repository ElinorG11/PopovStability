clear; clc;

% MSE for damping
trajectory = readmatrix("trajectory_changing_damping_2.xlsx");

ref = trajectory(1:end,30);

trajectoryNum = length(trajectory(1,:));

mse = zeros([1,trajectoryNum]);
for i = 1:trajectoryNum
    mse(1,i) = rmse(ref, trajectory(1:end,i));
end

writematrix(mse, "mse_damping.xlsx");

%%
clear; clc;

% MSE for damping
trajectory = readmatrix("trajectory_changing_resistance_2.xlsx");
trajectory = trajectory(1:100002,1:end);

ref = trajectory(1:end,4);

trajectoryNum = length(trajectory(1,:));

mse = zeros([1,trajectoryNum]);
for i = 1:trajectoryNum
    mse(1,i) = rmse(ref, trajectory(1:end,i));
end

writematrix(mse, "mse_resistance.xlsx");

%%
clear; clc;

% MSE for damping
trajectory = readmatrix("trajectory_changing_inductance_2.xlsx");

ref = trajectory(1:end,15);

trajectoryNum = length(trajectory(1,:));

mse = zeros([1,trajectoryNum]);
for i = 1:trajectoryNum
    mse(1,i) = rmse(ref, trajectory(1:end,i));
end

writematrix(mse, "mse_inductance.xlsx");

%%
clear; clc;

% MSE for damping
trajectory = readmatrix("trajectory_changing_voltage_2.xlsx");

ref = trajectory(1:end,97);

trajectoryNum = length(trajectory(1,:));

mse = zeros([1,trajectoryNum]);
for i = 1:trajectoryNum
    mse(1,i) = rmse(ref, trajectory(1:end,i));
end

writematrix(mse, "mse_voltage.xlsx");