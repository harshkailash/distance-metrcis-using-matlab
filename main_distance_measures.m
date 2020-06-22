df = csvread("data.csv");
query = [4, 20, 70, -1, 200, 0.0025, 45234, 15.23, 19.45, 490];

lis_abs = [];
lis_aSq = [];
lis_quc = [];
lis_can = [];
lis_ctb = [];
lis_min = [];
lis_chi = [];
lis_ham = [];
lis_cos = [];
lis_emd = [];
lis_pea = [];
ranks = [];
top = [];
div = 0;

for i = 1:100
    lis_abs = [lis_abs, absDiff(df(i, :), query)];
    lis_aSq = [lis_aSq, absSquared(df(i, :), query)];
    lis_quc = [lis_quc, euclidean(df(i, :), query)];
    lis_can = [lis_can, canbberaDist(df(i, :), query)];
    lis_ctb = [lis_ctb, cityB(df(i, :), query)];
    lis_min = [lis_min, minkDist(df(i, :), query)];
    lis_chi = [lis_chi, chisqDist(df(i, :), query)];
    lis_ham = [lis_ham, hamDist(df(i, :), query)];
    lis_cos = [lis_cos, cosDist(df(i, :), query)];
    lis_emd = [lis_emd, emd(df(i, :), query)];
    lis_pea = [lis_pea, pear(df(i, :), query)];
end
disp(lis_ctb)
df = [df reshape(lis_abs,[100,1]) reshape(lis_aSq,[100,1]) reshape(lis_quc,[100,1]) reshape(lis_can,[100,1]) reshape(lis_ctb,[100,1]) reshape(lis_min,[100,1]) reshape(lis_ham,[100,1]) reshape(lis_cos,[100,1]) reshape(lis_emd,[100,1]) reshape(lis_pea,[100,1])];

csvwrite('final.csv', df);

% Initializing indices for all distance metrics
for i = 11:20
    [x, ind] = sort(df(:,i), 'ascend');
    ranks = [ranks ind];
end

% Creating CSV for the ranks
csvwrite('ranks.csv', ranks);

% Finding top 20 indices (ascending order)
for i = 1:10
    idx = find(ranks(:,i) < 21);
        top = [top idx];
end

% Creating CSV for top 20
csvwrite('top20.csv', top);
