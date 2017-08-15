library(ggplot2)
library(RColorBrewer)

x = data.frame(x = 1, y = 1)
bcolours <- brewer.pal(8, "Set2")

# Add just the point
p1 <- ggplot(data = x, aes(x = x, y = y)) + 
  geom_point() +
  scale_x_continuous(name = 'princess',
                     limits = c(0, 1.05),
                     breaks = seq(0, 1, 0.25)) +
  scale_y_continuous(name = 'clever',
                     limits = c(0, 1.05),
                     breaks = seq(0, 1, 0.25)) +
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
colour2 = bcolours[4]
size2 = 0.8

p4 <- p1 +
        geom_segment(aes(x = 0, y = 0, xend = 0, yend = 0.25), colour = colour2, size = size2) +
        geom_segment(aes(x = 0, y = 0.25, xend = 0.25, yend = 0.25), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.25, y = 0.25, xend = 0.25, yend = 0.5), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.25, y = 0.5, xend = 0.5, yend = 0.5), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.5, y = 0.5, xend = 0.5, yend = 0.75), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.5, y = 0.75, xend = 0.75, yend = 0.75), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.75, y = 0.75, xend = 0.75, yend = 1.0), colour = colour2, size = size2) +
        geom_segment(aes(x = 0.75, y = 1.0, xend = 1.0, yend = 1.0), colour = colour2, size = size2)
p4

# Plotting the three different vectors
y = data.frame(clever = c(2, 2, 2), princess = c(7, 9, 1))
bcolours <- brewer.pal(8, "Set2")

p1 <- ggplot(data = y, aes(x = clever, y = princess)) + 
  scale_x_continuous(name = 'clever') +
  scale_y_continuous(name = 'princess',
                     limits = c(0, 10)) +
  theme_bw()

p1

size1 = 0.8
p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 7), colour = bcolours[1], size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 9), colour = bcolours[2], size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 1), colour = bcolours[3], size = size1,
               arrow = arrow(length = unit(0.3,"cm")))
p2


p2 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 7, colour = "document1"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 9, colour = "document2"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 1, colour = "document3"), size = size1,
               arrow = arrow(length = unit(0.3,"cm"))) +
  scale_colour_manual(name = "Corpus",
                      values = c(document1 = bcolours[1], document2 = bcolours[2], 
                                 document3 = bcolours[3]),
                      labels = c("Document 1", "Document 2", "Document 3"))
p2

# Plot triangle number 1
size2 = 0.6
p3 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 1.93, yend = 6.755), colour = "grey34", size = size2) +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 1), colour = "grey34", size = size2) +
  geom_segment(aes(x = 2, y = 1, xend = 1.93, yend = 6.755), colour = "grey34", size = size2) +
  geom_curve(aes(x = 0.5, y = 0.25, xend = 0.42, yend = 1.47), curvature = 0.5, size = 0.8,
             colour = bcolours[3])
p3

# Plot triangle number 2
p4 <- p1 +
  geom_segment(aes(x = 0, y = 0, xend = 2, yend = 7), colour = "grey34", size = size2) +
  geom_segment(aes(x = 0, y = 0, xend = 1.865, yend = 8.3925), colour = "grey34", size = size2) +
  geom_segment(aes(x = 2, y = 7, xend = 1.865, yend = 8.3925), colour = "grey34", size = size2) +
  geom_curve(aes(x = 0.5, y = 1.75, xend = 0.46, yend = 2.07), curvature = 0.5, size = 0.8,
             colour = bcolours[3])
p4





