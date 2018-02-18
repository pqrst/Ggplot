library('ggplot2')
library(readr)
options(repr.plot.width = 6, repr.plot.height = 6) # resize the plots

data(iris)
head(iris)
class(iris)

summary(iris)

# to check relation between Sepal length and Speal width 
# we use theme_minimal() here to adjust the appearance of the plots 
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length)) + geom_point() + theme_minimal()

#marking the species by different colors
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length,color=Species)) + geom_point() + theme_minimal()

# On top of this scatter plot, adding a trend line to visualize the general trend 
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length,color=Species)) + geom_point() +geom_smooth() + theme_minimal()

# turning off the grey area, which is the confident interval, by passing argument se=False
ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length,color=Species)) + geom_point() +geom_smooth(se=FALSE) +
  theme_minimal()

# dividing the plot into multiple plots, one for each species
options(repr.plot.width = 10, repr.plot.height = 6)# to adjust size of plots

ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
  geom_point() + geom_smooth(se=FALSE) +facet_wrap(~Species) +theme_minimal()

# Scaling the separate plots 
options(repr.plot.width = 10, repr.plot.height = 5) # to adjust size of plots

ggplot(data=iris,aes(x=Sepal.Width, y=Sepal.Length,color=Species)) +
  geom_point() + geom_smooth(se=FALSE) +facet_wrap(~Species,scale='free_y') +theme_minimal()



#boxplot
options(repr.plot.width = 5, repr.plot.height = 4)

ggplot(data=iris,aes(x=Species, y=Petal.Length,color=Species)) + geom_boxplot() +theme_minimal()+
  theme(legend.position="none")

# using violin, which could show us the distribution of the data.
options(repr.plot.width = 5, repr.plot.height = 4)
ggplot(data=iris,aes(x=Species, y=Petal.Length,color=Species)) + geom_violin() +theme_minimal()+
  theme(legend.position="none")

# histogram
ggplot(data=iris,aes(x=Sepal.Length)) + geom_histogram() +theme_minimal()

# changing the binwidth by passing argument binwidth= to geom_histogram()
ggplot(data=iris,aes(x=Sepal.Length)) + geom_histogram(binwidth=0.3) +theme_minimal()

# stacked histogram 
ggplot(data=iris,aes(x=Sepal.Length,fill=Species)) + geom_histogram() +theme_minimal()

# splitting the plots
ggplot(data=iris,aes(x=Sepal.Length,fill=Species)) + geom_histogram() +theme_minimal() +facet_wrap(~Species)

# density curve.
ggplot(data=iris,aes(x=Sepal.Length,color=Species)) + geom_density() +theme_minimal()

# explore many more plots by looking at the documentation.
#(http://docs.ggplot2.org/current/)
# Or pressing tab while typed geom_, which would suggest a list of what ggplot could do

ggplot(data=iris,aes(x=Sepal.Length,y=Petal.Length,fill=Species)) + geom_bin2d() + theme_minimal()

ggplot(data=iris,aes(x=Species,y=Petal.Length,color=Species)) + geom_bar(stat = "summary", fun.y = "mean") +
  theme_minimal()

ggplot(data=iris,aes(x=Petal.Width,y=Petal.Length,color=Species)) +geom_density2d()+ theme_minimal()