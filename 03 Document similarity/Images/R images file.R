library(ggplot2)
library(RColorBrewer)
tales = read.csv("/Users/jodieburchell/Documents/text-mining/03 Document similarity/raw_frequency_sample.csv",
                 header = TRUE)

# Frequency 1 charts
ggplot(tales, aes(x = term, y = frequency, fill = titles)) + 
  geom_bar(stat="identity") + 
  scale_x_discrete(name = "Term") +
  scale_y_continuous(name = "Frequency") +
  theme_bw() +
  theme(legend.position="bottom", legend.direction="vertical",
        legend.title = element_blank()) +
  scale_fill_brewer(palette="Set2")

# Frequency 2 charts
