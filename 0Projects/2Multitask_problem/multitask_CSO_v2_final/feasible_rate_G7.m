clear all

n_samples = 2e7;

func = [1, 7, 9];

samples_all = struct();

lb = -10 * ones(1, 10);
ub = 10 * ones(1, 10);

func_num = 7;

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
    



%% calculate FR

% G7
X = samples_all.samples_G7;


num_feasible = 0;
for sol = 1:n_samples
    funcName = sprintf('G7');
    x = X(sol, :);
    [~,~,g] = feval(funcName, x);

    if all(g <= 0)
        num_feasible = num_feasible + 1;
    end
end
disp(funcName);
disp(num_feasible);
Fesible_G7.(funcName) = num_feasible;  % 将数据赋值到结构体的相应字段
FR_G7 = num_feasible / n_samples;

