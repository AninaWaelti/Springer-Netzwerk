install.packages("igraph")
# installiert das Paket igraph
install.packages("igraphdata")
# installiert das Paket igraphdata
library("igraph")
# Einlesen der Edgelist aus github link: beachte den Separator ","
edges <- read.csv("https://raw.githubusercontent.com/AninaWaelti/Springer-Netzwerk/master/Sicherung%20zum%20AUSPROBIEREN!!!%20-%20Edgelist.csv", header=T, as.is=T, sep = ",")
# Einlesen der Nodelist
nodes <- read.csv("https://raw.githubusercontent.com/AninaWaelti/Springer-Netzwerk/master/Sicherung%20zum%20AUSPROBIEREN!!!%20-%20Nodelist.csv", header=T, as.is=T, sep = ",")
# Überprüfen der Daten
head(edges)
head(nodes)
# wandelt die Edgelist als Matrix um.
edgematrix <-as.matrix(edges)
# ?graph_from_data_frame (erläutert den Befehl genauer)
# erstellt ein igraph-objekt aus der Fusion von Edge- und Nodelist
springer <- graph_from_data_frame(d=edgematrix, vertices=nodes, directed=T)
# das igraph-Objekt heisst jetzt "s" (für springer) und ist ein gerichtetes Netzwerk.
springer

# Visualisierung


V(springer)[(V(springer)$type==1)]$shape<-"square"
V(springer)[(V(springer)$type==1)]$color<-"pink"
V(springer)[(V(springer)$type==2)]$shape<-"circle"
V(springer)[(V(springer)$type==2)]$color<-"lightblue"
E(springer)[(E(springer)$topicality==1)]$color<-"red"


plot(springer,
     edge.arrow.size=.3,
     layout=layout_with_kk,
     main="Axel Springer Netzwerk")

     




