library(tidyverse, lib.loc = "/ifs/home/msph/ehs/eag2186/local/hpc/")

job_num = as.integer(Sys.getenv("SGE_TASK_ID"))
job_num 

sim_out <- tibble()

all = matrix(1:27000, nrow = 1000, byrow = TRUE)
count = all[job_num, ]
count 

for (i in 1:length(count)) {
  if (file.exists(paste0("/ifs/scratch/msph/ehs/eag2186/pcp/param_send/param_out_", count[i], "_upper.RDA"))) {
  load(paste0("/ifs/scratch/msph/ehs/eag2186/pcp/param_send/param_out_", count[i], "_upper.RDA"))
  sim_out <- rbind(sim_out, all_out)
  }
}

sim_out

sim_out <- sim_out %>% 
  mutate_at(vars(2:3), as.factor) %>% 
  dplyr::select(-X, -L, -S, -L_out, -S_out)

save(sim_out, file = paste0("/ifs/scratch/msph/ehs/eag2186/pcp/bundle/param_out_", job_num, "_comb_upper.RDA"))
