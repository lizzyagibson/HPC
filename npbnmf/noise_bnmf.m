%% Get job number
i = getenv('SGE_TASK_ID')

%% Import the data
simdata1 = readtable(strcat("/ifs/scratch/msph/ehs/eag2186/Data/noise_csv/noise_sim", num2str(i), ".csv"));

%% Convert to output type
simdata1 = table2array(simdata1);

%% Run BN2MF
[EWA, EH, varH, alphaH, betaH, varWA] = NPBayesNMF(simdata1);

%% Save output
save(strcat("/ifs/scratch/msph/ehs/eag2186/npbnmf/bnmf_noise_out/ewa_noise_", num2str(i), ".mat"), 'EWA');
save(strcat("/ifs/scratch/msph/ehs/eag2186/npbnmf/bnmf_noise_out/eh_noise_",  num2str(i), ".mat"), 'EH');
