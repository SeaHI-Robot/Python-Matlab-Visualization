clear; clc;

% 创建深度数据的示例二维数组
rawData = load("raw_data.mat");  
depthTable = rawData.raw_data;

% 将表格数据转换为矩阵
depthData = table2array(depthTable);
depthData = depthData;
max_dep = max(depthData(:));
min_dep = min(depthData(:));

depthData = (depthData - min_dep)/(max_dep - min_dep);
% 创建 X 和 Y 网格，与深度数据大小匹配
[X, Y] = meshgrid(1:size(depthData, 2), 1:size(depthData, 1));

% 创建 3D 表面图
figure;
h = surf(X, Y, depthData);
% title('海底曲面地形 3D示意图');
xlabel('X');
ylabel('Y');
zlabel('Z');
% 设置横纵轴单位长度相等
% axis equal;
% 设置 x 和 y 轴的范围
xlim([-60, 261]); % 设置 x 轴范围为 
ylim([-60, 311]); % 设置 y 轴范围为 
% 关闭黑线渲染
set(h, 'EdgeColor', 'none'); % 这一行代码将表面的边缘颜色设置为 'none'，即不显示黑线
% 添加 colorbar
colorbar;
% axis equal