library(ggplot2)
library(dplyr)

# get script dir
# https://stackoverflow.com/questions/1815606/determine-path-of-the-executing-script
script_dir <- dirname(sys.frame(1)$ofile)

# two benchmark produced by benchmarkme
benchmark_default_BLAS <- read.csv(paste0(script_dir, "/benchmark_default_BLAS.csv"))
benchmark_vel_BLAS <- read.csv(paste0(script_dir, "/benchmark_vel_BLAS.csv"))

benchmark_default_BLAS$group <- "default"
benchmark_vel_BLAS$group <- "vel"
data <- rbind(benchmark_default_BLAS, benchmark_vel_BLAS)


data %>%
  ggplot(aes(fill = group, y = elapsed, x = test)) +
  geom_bar(position = "dodge", stat = "identity") +
  facet_wrap(~test_group, scales = "free_x") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Benchmark (libRblas.0.dylib vs libRblas.vecLib.dylib)") +
  theme(plot.title = element_text(hjust = 0.5))



ggsave(paste0(script.dir, "/benchmark_plot.jpg"))
