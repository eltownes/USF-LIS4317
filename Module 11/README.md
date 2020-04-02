Tufte in R

Marginal boxplot scatterplot

This assignment uses one of Tufte's ideas as presented by Dr. Lukasz Piwek in the post titled Tufte in R.

This post does not use a data set for the plot but instead uses the sample() function to generate 5000 numbers from -4 to 4 inclusive. The best analogy for this plot is a stock chart. As time passes (1-5000), the generated number will determine how much to go up or down. 

We will examine the distribution of all 5000 numbers. First we'll consider the distribution of all numbers. There is one boxplot next to the plot and it is all white. Then we'll consider the distribution above (green) and the distribution below (red) zero - two boxplots here.

As the plot is a time series one, only the distribution of the y-axis is shown. As usual, the boxplot provides a concise five number summary along with displaying any outliers. As expected, aTufte theme provides essential formatting without fluff.