function [data2d] = select_data( data2d )
% delete last ones;
t_delete = [20, 300000];
data2d = deletedata(data2d, t_delete);
% delete the first ones;
t_delete = [-1,0];
data2d = deletedata(data2d, t_delete);
end

function data2d = deletedata(data2d, t_delete)
% delete imu
size_imu = length(data2d.IMU.t);
ids_delete = [];
for i = size_imu:-1:1
    t = data2d.IMU.t(i);
    if (t > t_delete(1)) && t < t_delete(2)
       ids_delete = cat(1,ids_delete,i);
    end
end
data2d.IMU.t(ids_delete) = [];
data2d.IMU.gyro(:,ids_delete) = [];
data2d.IMU.acc(:,ids_delete) = [];

% delete gps;
size_gps = length(data2d.GPS.t);
ids_delete = [];
for i = size_gps:-1:1
    t = data2d.GPS.t(i);
    if (t > t_delete(1)) && t < t_delete(2)
       ids_delete = cat(1,ids_delete,i);
    end
end
data2d.GPS.t(ids_delete) = [];
data2d.GPS.pos_EN(:,ids_delete) = [];
end

