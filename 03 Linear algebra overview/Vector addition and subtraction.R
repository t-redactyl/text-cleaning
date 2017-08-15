library(ggplot2)
library(RColorBrewer)

# Vector addition
x = data.frame(x = c(-1, 3, 2), y = c(2, 1, 3))
bcolours <- brewer.pal(8, "Set2")

# Add just the graph area
p1 <- ggplot(data = x, aes(x = x, y = y)) + 
  theme_bw()
p1

# Add in the vectors
size1 = 0.8
p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = -1, yend = 2, colour = "vector1"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = -1, y = 2, xend = 2, yend = 3, colour = "vector2"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 3, colour = "vector3"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  scale_colour_manual(name = "Vectors",
                      values = c(vector1 = bcolours[1], vector2 = bcolours[2], 
                                 vector3 = bcolours[3]),
                      labels = c("Vector a", "Vector b", "Vector a + vector b"))
p2

# Vector subtraction
y = data.frame(x = c(2, -4, 6), y = c(3, -2, 5))

p1 <- ggplot(data = y, aes(x = x, y = y)) + 
  theme_bw()
p1

p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 3, colour = "vector1"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = -4, yend = -2, colour = "vector2"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = -4, y = -2, xend = 2, yend = 3, colour = "vector3"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  scale_colour_manual(name = "Vectors",
                      values = c(vector1 = bcolours[1], vector2 = bcolours[2], 
                                 vector3 = bcolours[3]),
                      labels = c("Vector a", "Vector b", "Vector a - vector b"))
p2
