Visual Social Network Analysis

Using igraph and ggraph

This visualization uses the dataset whigs{ggraph} i.e. the Whig Party from the mid-1800s. I also used some of the instructions as written by Kieran Healy in the article "Using Metadata to find Paul Revere"  at https://kieranhealy.org/blog/archives/2013/06/09/using-metadata-to-find-paul-revere/

This dataset is interesting because it isn’t formulated in the typical format one would expect from a dataset prepped for social network analysis. The dataset is really a list of memberships in various organizations. The dimensions are 254 x 7 - it shows the affiliation of 254 people in 7 organizations. Matrix multiplication allows us to format the original data for proper social network analysis.

This first graph shows the group view on how groups are related by their shared memberships. Here we see heavy shared memberships between the London Enemies and the North Caucus. Much less so between for example, the London Enemies and the Loyal Nine.

This second graph shows the people view on how groups are related by their shared memberships. Enlarging the image makes it easier to see. In the top right we most likely see the London Enemies. Also, it isn’t too difficult to see the other 3 major groups of the North Caucus, the Tea Party, and the Boston Committee. It is also easy to see the somewhat lone memberships. Lastly, near the middle we see the venerable Paul Revere, the midnight rider.

