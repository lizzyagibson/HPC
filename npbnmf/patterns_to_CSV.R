library(tidyverse, lib.loc = "/ifs/home/msph/ehs/eag2186/local/hpc/")

## read job number from system environment
## This only works if run on cluster!!
#job_num = as.integer(Sys.getenv("SGE_TASK_ID"))
#job_num

load(paste0("/ifs/scratch/msph/ehs/eag2186/Data/sim_noise.RDA"))
sim_noise

for (i in 1:300) {

	patterns <- as_tibble(sim_noise$true_patterns[[i]])
	scores <- as_tibble(sim_noise$true_scores[[i]])

	write_csv(patterns, path = paste0("/ifs/scratch/msph/ehs/eag2186/Data/noise_csv/noise_patterns_", i, ".csv"))
	write_csv(scores, path = paste0("/ifs/scratch/msph/ehs/eag2186/Data/noise_csv/noise_scores_", i, ".csv"))
}

