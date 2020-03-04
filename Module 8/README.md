Correlation or Regression Analysis Using ggplot2


Scatter plot matrix.


This is a scatter plot matrix from the urine data set in the boot package. The matrix has a dimension of 79 x 7.


A scatter plot matrix is a great first tool as part of the exploratory phase. This kind of matrix allows for a quick and rich understanding of the interrelationships between variables.


This particular plot extends the pairs{base} function with the ggpairs{GGally} function. By default, it adds a density graph on the diagonal along with correlation statistics.