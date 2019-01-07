library(tidyverse)
filename = "data/[Subject].csv"
dest_file = "rdas/[Subject].rda"
[Subject] = read_csv(filename) %>%
  
head([Subject])
save([Subject], file = dest_file)