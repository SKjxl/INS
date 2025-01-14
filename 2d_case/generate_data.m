clear
%load('/home/nvidia/code/INS/data/GPSaidedINS_data.mat');
load('../data/turtlebot1.mat');

% GPS;
data2d.GPS.t = data.GPS.t;
data2d.GPS.pos_EN = data.GPS.pos(1:2,:);
% imu
data2d.IMU.t = data.IMU.t;
data2d.IMU.acc = data.IMU.acc(1:2,:);
data2d.IMU.gyro = -data.IMU.gyro(3,:);
save('../data/turtlebot_data2d', 'data2d');

