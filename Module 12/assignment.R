
# prep environment
library(igraph)
library(ggraph)

# load data
data("whigs")
data1 <- as.matrix(whigs)

# matrix multiplacation using transpose &
# delete the diagonal relationships
groupsByPeople <- t(data1) %*% data1
    diag(groupsByPeople) <- NA
peopleByGroups <- data1 %*% t(data1)
    diag(peopleByGroups) <- NA

# group
groupNet <- graph_from_adjacency_matrix(
    groupsByPeople, weighted=T, mode="undirected", diag=FALSE)
plot(groupNet,
     edge.width=get.edge.attribute(groupNet,"weight"),
     )

# people
peopleNet <- graph_from_adjacency_matrix(
    peopleByGroups, weighted=T, mode="undirected", diag=FALSE)
plot(peopleNet,
     vertex.shape="none",
     vertex.label.cex=0.75,
     edge.width=0.25,
    )
