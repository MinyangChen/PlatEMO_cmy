clear all

% alg = @CMME;
% alg = @KTS;
alg = @MGSAEA;
prob = @MW8;

M = 4;
N = 100;
FEs = 1500;

% [Dec,Obj,Con] = platemo('algorithm',alg,'problem',prob,'M',M,'N', N, 'maxFE',FEs);

load MW4_M4_ref_points.mat
Obj = R;

% 生成一个100x4的随机矩阵
obj_data = Obj;
if M > 3

    % 创建四个图形窗口，每个窗口绘制忽略一个维度的3D散点图
    figure;

    % 第一个图：忽略第一个维度，使用第2, 3, 4维
    subplot(2, 2, 1);
    scatter3(obj_data(:, 2), obj_data(:, 3), obj_data(:, 4), 'MarkerEdgeColor', [0.5 0.5 0.5],'MarkerFaceColor', [0.5 0.5 0.5]);


    title('Ignore 1st Dimension');
    xlabel('Dim 2');
    ylabel('Dim 3');
    zlabel('Dim 4');

    % 第二个图：忽略第二个维度，使用第1, 3, 4维
    subplot(2, 2, 2);
    scatter3(obj_data(:, 1), obj_data(:, 3), obj_data(:, 4), 'MarkerEdgeColor', [0.5 0.5 0.5],'MarkerFaceColor', [0.5 0.5 0.5]);

    title('Ignore 2nd Dimension');
    xlabel('Dim 1');
    ylabel('Dim 3');
    zlabel('Dim 4');

    % 第三个图：忽略第三个维度，使用第1, 2, 4维
    subplot(2, 2, 3);
    scatter3(obj_data(:, 1), obj_data(:, 2), obj_data(:, 4), 'MarkerEdgeColor', [0.5 0.5 0.5],'MarkerFaceColor', [0.5 0.5 0.5]);

    title('Ignore 3rd Dimension');
    xlabel('Dim 1');
    ylabel('Dim 2');
    zlabel('Dim 4');

    % 第四个图：忽略第四个维度，使用第1, 2, 3维
    subplot(2, 2, 4);
    scatter3(obj_data(:, 1), obj_data(:, 2), obj_data(:, 3), 'MarkerEdgeColor', [0.5 0.5 0.5],'MarkerFaceColor', [0.5 0.5 0.5]);

%     scatter3(obj_data(:, 1), obj_data(:, 2), obj_data(:, 3), 10, 'r', 'filled');
    title('Ignore 4th Dimension');
    xlabel('Dim 1');
    ylabel('Dim 2');
    zlabel('Dim 3');

    % 调整图形布局
    sgtitle('3D Scatter Plots of 4D Vectors with One Dimension Ignored');
else
    % M = 3
    scatter3(obj_data(:, 1), obj_data(:, 2), obj_data(:, 3), 10, 'r', 'filled');
    title('Ignore 4th Dimension');
    xlabel('Dim 1');
    ylabel('Dim 2');
    zlabel('Dim 3');
end
%     obj_data_KTS = obj_data(end-99:end, :);
%     scatter3(obj_data_KTS(:, 1), obj_data_KTS(:, 2), obj_data_KTS(:, 3), 10, 'r', 'filled');
%     title('Ignore 4th Dimension');
%     xlabel('Dim 1');
%     ylabel('Dim 2');
%     zlabel('Dim 3');