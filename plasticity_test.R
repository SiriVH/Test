library(tidyverse)
source("kode fra git.R")
plasticity
bannerBreak = "-----------------"

RDPI(plasticity %>% filter(phase == "building"), Trait = LDMC, Env = treatment, Indiv = art)


plasticity %>% 
  mutate(phase = factor(phase, levels = c("pioneer", "building", "mature"))) %>% 
  arrange(phase) %>% 
  group_by(phase) %>% 
  nest() %>% 
  mutate(result = map(data, ~RDPI(., Trait = LDMC, Env = treatment, Indiv = art))) %>% 
  unnest(result)
