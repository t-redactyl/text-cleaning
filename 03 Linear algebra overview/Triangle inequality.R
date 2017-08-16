library(ggplot2)
library(RColorBrewer)

# Triangle inequality when vectors are not collinear
x = data.frame(x = c(-1, 3, 2), y = c(2, 1, 3))
bcolours <- brewer.pal(8, "Set2")

# Add just the graph area
p1 <- ggplot(data = x, aes(x = x, y = y)) + 
  scale_x_continuous(limits = c(-1.5, 2.5)) +
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
                      labels = c("Vector x", "Vector y", "Vector x + vector y")) +
  annotate("text", x = -1, y = 1, label = "||x|| = 2.24", size = 3.5,
           fontface = "bold", colour = bcolours[1]) +
  annotate("text", x = 0, y = 2.65, label = "||y|| = 3.16", size = 3.5,
           fontface = "bold", colour = bcolours[2]) +
  annotate("text", x = 1.75, y = 1.5, label = "||x + y|| = 3.61", size = 3.5,
           fontface = "bold", colour = bcolours[3])
p2

# Triangle inequality when vectors are collinear
y = data.frame(x = c(1, 2), y = c(2, 4))

# Add just the graph area
p1 <- ggplot(data = y, aes(x = x, y = y)) + 
  scale_x_continuous(limits = c(-0.8, 3.3)) +
  theme_bw()
p1

# Add in the vectors
p2 <- p1 +
  geom_segment(aes(x = 0.1, y = 0, xend = 3.1, yend = 6, colour = "vector3"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 1, y = 2, xend = 3, yend = 6, colour = "vector2"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 2, colour = "vector1"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  scale_colour_manual(name = "Vectors",
                      values = c(vector1 = bcolours[1], vector2 = bcolours[2], 
                                 vector3 = bcolours[3]),
                      labels = c("Vector x", "Vector y", "Vector x + vector y")) +
  annotate("text", x = -0.2, y = 1, label = "||x|| = 2.24", size = 3.5,
           fontface = "bold", colour = bcolours[1]) +
  annotate("text", x = 1.25, y = 4, label = "||y|| = 4.47", size = 3.5,
           fontface = "bold", colour = bcolours[2]) +
  annotate("text", x = 2.25, y = 2.5, label = "||x + y|| = 6.71", size = 3.5,
           fontface = "bold", colour = bcolours[3])
p2

  

