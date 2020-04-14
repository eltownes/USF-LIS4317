
# prep environment
library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)

# load data
data("gapminder")
data1 <- gapminder

# create the plot
plotObject <- ggplot(data1, aes(x=gdpPercap,y=lifeExp,
                                col=continent,
                                size=pop) ) +
    guides(col=F) +
    labs(size="Population") +
    geom_point() +
    facet_wrap(~continent) +
    scale_x_log10() +
    labs(title = "Gapminder : Data From 1952 - 2007",
         subtitle = "Year: {frame_time}",
         caption = "From the R gapminder dataset",
         x = "GDP per Capita (log scale)",
         y = "Life Expectancy") +
    theme_bw()

plotObject

# create animation
plotAnim <- plotObject +
    transition_states(data1$continent,
                      transition_length = 8,
                      state_length = 4) +
    transition_time(data1$year)

plotAnim
