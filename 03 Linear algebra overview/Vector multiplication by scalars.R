library(ggplot2)
library(RColorBrewer)

x = data.frame(x = c(2, 4, 10, -3), y = c(1, 2, 5, -1.5))
bcolours <- brewer.pal(8, "Set2")

p1 <- ggplot(data = x, aes(x = x, y = y)) + 
  theme_bw()
p1

size1 = 0.8
p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 10, yend = 5, colour = "vector3"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 4, yend = 2, colour = "vector2"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 1, colour = "vector1"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = -3, yend = -1.5, colour = "vector4"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  scale_colour_manual(name = "Vectors",
                      values = c(vector1 = bcolours[3], vector2 = bcolours[2], 
                                 vector3 = bcolours[1], vector4 = bcolours[4]),
                      labels = c("v", "2v", "5v", "-1.5v"))
p2

# Parallel lines
y = data.frame(x = c(2, 4, 10, -3, 4, 6, 12, -1), y = c(1, 2, 5, -1.5, 5, 6, 9, 2.5),
               line = c('cv', 'cv', 'cv', 'cv', 'cv + x', 'cv + x', 'cv + x', 'cv + x'))

size2 = 0.5
p1 <- ggplot(data = y, aes(x = x, y = y, colour = line)) +
  geom_point() +
  geom_line() +
  theme_bw() +
  scale_colour_brewer(palette = "Accent") +
  labs(colour = "Line") +
  geom_segment(aes(x = 2, y = 1, xend = 4, yend = 5), size = size2, colour = "darkgrey",
               linetype = "dashed", arrow = arrow(length = unit(0.2,"cm"))) +
  geom_segment(aes(x = 4, y = 2, xend = 6, yend = 6), size = size2, colour = "darkgrey",
               linetype = "dashed", arrow = arrow(length = unit(0.2,"cm"))) +
  geom_segment(aes(x = 10, y = 5, xend = 12, yend = 9), size = size2, colour = "darkgrey",
               linetype = "dashed", arrow = arrow(length = unit(0.2,"cm"))) +
  geom_segment(aes(x = -3, y = -1.5, xend = -1, yend = 2.5), size = size2, colour = "darkgrey",
               linetype = "dashed", arrow = arrow(length = unit(0.2,"cm")))
p1

# Finding a line that goes between two vectors
z = data.frame(x = c(-2, -4, 4), y = c(5, 7, -1))

p1 <- ggplot(data = z, aes(x = x, y = y)) +
  geom_point(colour = bcolours[2]) +
  geom_line(colour = bcolours[2], size = size1) +
  theme_bw()
p1

p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 1), size = size1, colour = bcolours[1],
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 3), size = size1, colour = bcolours[3],
               arrow = arrow(length = unit(0.3,"cm")))
p2
