library(tidyverse)

## read job number from system environment
## This only works if run on cluster!!
#job_num = as.integer(Sys.getenv("SGE_TASK_ID"))
#job_num

load(paste0("/ifs/scratch/msph/ehs/eag2186/Data/sim_noise.RDA"))
sim_noise

sim_t = sim_noise %>% dplyr::select(sim)

for (i in 1:300) {

	sim_m = sim_t[[1]][[i]]
	sim_d = as_tibble(sim_m)

	write_csv(sim_d, path = paste0("/ifs/scratch/msph/ehs/eag2186/Data/noise_csv/noise_sim", i, ".csv"))
}

