#read in the CSV file for my dataset
income<- read.csv("ChinaIncome.csv", header = TRUE)
# Scatter plot using base R
plot(income$transport, income$construction,
     main   = "income of transport vs construction",
     xlab   = "transport",
     ylab   = "construction")

# Histogram using base R
hist(income$industry,
     main = "distribution of industry income",
     xlab = "industry",
     col  = "gold")
# Add lattice to our library
library(lattice)

# Conditional scatter plot (small multiples) using lattice
xyplot(construction ~ transport,
        data = income,
        main = "Lattice: Silver vs. Gold by Year",
        xlab = "transport",
        ylab = "construction")

# Box-and-whisker plot using lattice
bwplot(construction ~ factor(transport),
       data = income,
       main = "Lattice: Construction by transport")
# Add ggplot2 to our library
library(ggplot2)

# Scatter plot with smoothing using ggplot2
ggplot(income, aes(x = transport, y = construction)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: transport vs construction with trend line")

# Faceted histogram using ggplot2
ggplot(income, aes(x=industry)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ commerce) +
  labs(title = "ggplot2: industry distribution by commerce")
