clear all

N = [13, 15, 7];

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

AA_result = struct;
for i = 1:3
    funcs = [1,7,9];
    func_num = funcs(i);
    NP = N(i);
    
    dec = all_result_round((i-1)*7+1:i*7, 1:NP);
    fit = all_result_round((i-1)*7+1:i*7, NP+1);
    
    fieldName = sprintf('G%d', func_num);  % 创建字段名，如 'result_1', 'result_2', ...
    A_Dec.(fieldName) = dec;  % 将数据赋值到结构体的相应字段
    A_Fit.(fieldName) = fit;  % 将数据赋值到结构体的相应字段
end


