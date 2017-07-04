library(ggplot2)

x = data.frame(x = 1, y = 1)
bcolours <- brewer.pal(8, "Set2")

# Add just the point
p1 <- ggplot(data = x, aes(x = x, y = y)) + 
  geom_point() +
  scale_x_continuous(name = 'princess',
                     limits = c(0, 1.05),
                     breaks = seq(0, 1, 0.5)) +
  scale_y_continuous(name = 'clever',
                     limits = c(0, 1.05),
                     breaks = seq(0, 1, 0.5)) +
  theme_bw()
p1

# Add the Euclidean distance line
size1 = 0.8
p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 1), colour = bcolours[3], size = size1)
p2

# Add the "short sides" of the triangle
p3 <- p2 + 
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 0), colour = bcolours[3], size = size1) +
  geom_segment(aes(x = 1, y = 0, xend = 1, yend = 1), colour = bcolours[3], size = size1) 
p3

# Add the Manhattan distance line
colour2 = bcolours[2]
size2 = 0.8

p4 <- p3 +
        geom_segment(aes(x = 0, y = 0, xend = 0, yend = 0.25), colour = colour2, size = size2) +
        geom_segment(aes(x = 0, y = 0.25, xend = 0.25, yend = 0.25), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.25, y = 0.25, xend = 0.25, yend = 0.5), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.25, y = 0.5, xend = 0.5, yend = 0.5), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.5, y = 0.5, xend = 0.5, yend = 0.75), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.5, y = 0.75, xend = 0.75, yend = 0.75), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.75, y = 0.75, xend = 0.75, yend = 1.0), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.75, y = 1.0, xend = 1.0, yend = 1.0), colour = colour2, size = size2)
p4



