clear all

N = 15;

% 获取当前文件夹中所有.txt文件
files = dir('*.txt');

% 初始化一个结构体来存储变量
dataStruct = struct();

% 循环遍历文件
for k = 1:length(files)
    % 获取文件名（不含扩展名）
    [~, name, ~] = fileparts(files(k).name);
    
    % 读取文件内容到向量
    dataStruct.(name) = readmatrix(files(k).name);
end

% 将结构体中的所有向量转换为一个 cell 数组
variableNames = fieldnames(dataStruct);
dataCell = cell(length(variableNames), 1);
for i = 1:length(variableNames)
    dataCell{i} = dataStruct.(variableNames{i});
end

all_result = zeros(length(dataCell), 25);
for i = 1:length(dataCell)
    all_result(i, 1:length(dataCell{i})) = dataCell{i};
end

all_result_round = round(all_result * 100) / 100;

A_Dec = all_result_round(:,1:N);
A_Fit = all_result_round(:,N+1);


