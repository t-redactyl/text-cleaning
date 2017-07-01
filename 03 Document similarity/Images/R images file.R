library(ggplot2)
library(RColorBrewer)

# Frequency 1 charts
tales = read.csv("/Users/jodieburchell/Documents/text-mining/03 Document similarity/raw_frequency_sample.csv",
                 header = TRUE)
tales$term <- factor(tales$term, 
                     levels = c('say', 'go', 'come', 'will', 'thou', 'king', 'take',
                                'see', 'can', 'little', 'give', 'man', 'get','away',
                                'thee'))

bcolours <- brewer.pal(8, "Set2")

ggplot(tales, aes(x = term, y = frequency)) + 
  geom_bar(stat="identity", colour = bcolours[3], fill = bcolours[3]) + 
  scale_x_discrete(name = "Term") +
  scale_y_continuous(name = "Raw frequency") +
  theme_bw()

# Frequency 2 charts
tales = read.csv("/Users/jodieburchell/Documents/text-mining/03 Document similarity/prop_frequency_sample.csv",
                 header = TRUE)

tales$term <- factor(tales$term, 
                     levels = c('say', 'go', 'come', 'will', 'thou', 'king', 'take', 'see',
                                'can', 'little', 'give', 'man', 'get', 'away', 'thee'))

ggplot(tales, aes(x = term, y = frequency)) + 
  geom_bar(stat="identity", colour = bcolours[3], fill = bcolours[3]) + 
  scale_x_discrete(name = "Term") +
  scale_y_continuous(name = "Sublinear term frequency") +
  theme_bw() 

# Frequency of 'say' in all tales


