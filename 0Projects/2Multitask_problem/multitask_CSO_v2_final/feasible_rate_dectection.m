clear all

n_samples = 2e7;

func = [1, 7, 9];

lb_G1 = zeros(1, 13);
ub_G1 = [1,1,1,1,1,1,1,1,1,100,100,100,1];

lb_G7 = -10 * ones(1, 15);
ub_G7 = 10 * ones(1, 15);

lb_G9 = -10 * ones(1, 7);
ub_G9 = 10 * ones(1, 7);

lb_all = {lb_G1, lb_G7, lb_G9};
ub_all = {ub_G1, ub_G7, ub_G9};

samples_all = struct();
for idx = 1:3
    lb = lb_all{idx};
    ub = ub_all{idx};
    
    func_num = func(idx);
    
    D = length(lb);
    
    samples = [];
    for i = 1:D

        % latin hypercube sample
        perm = randperm(n_samples);
        intervals = ((perm' - 1) + rand(n_samples, 1)) / n_samples;
        samples(:, i) = lb(i) + intervals * (ub(i) - lb(i));
        
        % random sample
%         lb_mat = ones(n_samples, 1) * lb;
%         ub_mat = ones(n_samples, 1) * ub;
%         samples_rand = rand(n_samples, D);
%         samples = lb_mat + samples_rand .* (ub_mat - lb_mat);
    
    end
    
    fieldName = sprintf('samples_G%d', func_num);  % 创建字段名，如 'result_1', 'result_2', ...
    samples_all.(fieldName) = samples;  % 将数据赋值到结构体的相应字段
    
end


%% calculate FR
names = {'00', '11', '12', '21', '22', '31', '32'};

% G1
X = samples_all.samples_G1;

for k = 1:7
    num_feasible = 0;
    for sol = 1:n_samples
        funcName = sprintf('G1_%s', names{k});
        x = X(sol, :);
        [~,~,g] = feval(funcName, x);

        if all(g <= 0)
            num_feasible = num_feasible + 1;
        end
    end
    disp(funcName);
    disp(num_feasible);
    Fesible_G1.(funcName) = num_feasible;  % 将数据赋值到结构体的相应字段
    FR_G1(k) = num_feasible / n_samples;
end

% G7
X = samples_all.samples_G7;

for k = 1:7
    num_feasible = 0;
    for sol = 1:n_samples
        funcName = sprintf('G7_%s', names{k});
        x = X(sol, :);
        [~,~,g] = feval(funcName, x);

        if all(g <= 0)
            num_feasible = num_feasible + 1;
        end
    end
    disp(funcName);
    disp(num_feasible);
    Fesible_G7.(funcName) = num_feasible;  % 将数据赋值到结构体的相应字段
    FR_G7(k) = num_feasible / n_samples;
end

% G9
X = samples_all.samples_G9;

for k = 1:7
    num_feasible = 0;
    for sol = 1:n_samples
        funcName = sprintf('G9_%s', names{k});
        x = X(sol, :);
        [~,~,g] = feval(funcName, x);

        if all(g <= 0)
            num_feasible = num_feasible + 1;
        end
    end
    disp(funcName);
    disp(num_feasible);
    Fesible_G9.(funcName) = num_feasible;  % 将数据赋值到结构体的相应字段
    FR_G9(k) = num_feasible / n_samples;
end