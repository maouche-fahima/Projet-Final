---
title: "Are skilled musicians subject to the McGurk effect?"
author: "Maouche Fahima"
date: "3 janvier 2020"
output:
  html_document:
    df_print: paged
  word_document: default
---

##Introduction:
dans ce projet on a choisi de travaillé sur le jeu de donné "Les musiciens qualifiés sont-ils soumis à l'effet McGurk?" par Stephen Politzer-Ahles* & Lei Pan,2017).

"l'effet McGurk est un phénomène illusoire perceptif qui montre une interférence entre l'audition et la vision lors de la perception de la parole".(https://fr.wikipedia.org/wiki/Effet_McGurk)

l'objectif de cette étude est de trouver si Les musiciens qualifiés sont soumis à l'effet McGurk et si ce dernier est plus faible que celui des non-musiciens.


##contenus: 

les différentes variables de jeu de donnée sont:(Stephen Politzer-Ahles* & Lei Pan,2017)

Fullresp: la réponse exacte saisie par le participant.

Modalité: si l'essai était un stimulus audio uniquement ou un stimulus audiovisuel

Audio: la consonne produite dans le stimulus auditif

Visuel: la consonne produite dans le stimulus visuel.

Resp: La réponse des participants nettoyée

ProverbioCond: Quelle condition cela a-t-il été considéré (audio uniquement, audiovisuel congru ou audiovisuel incongruent) dans Proverbio et al. (2016)

audPoA: Lieu d'articulation du stimulus auditif

visPoA: Lieu d'articulation du stimulus visuel

McGurkCond: Quelle condition cela a-t-il été considéré dans l '"analyse ciblée" du présent document

Correct: si la réponse du participant était correcte

Objet: l'identifiant du participant

Groupe: si ce participant était dans le groupe musicien ou non musicien


##importation des données sur Rstudio:
les données sont au format CSV:  

```{r}
library(readr)
combined_data <- read_csv("https://raw.githubusercontent.com/maouche-fahima/Projet-Final/master/combined_data.csv")
View(combined_data)
```


##prérequis nécessaire pour le projet:
avant de commencer le projet on a besoin de lire les packages tidyverse et ggplot2 pour pouvoir réaliser les graphes et aussi le package dplyr qui est nécessaire pour le traitement de donnée. 
```{r}

library(tidyverse)
library(dplyr)
library(ggplot2)
```

##supprimer les données manquantes NA:
on a choisie de supprimer le peu de données manquantes présentes dans notre jeu de donnée afin d'éviter des erreurs d'analyse
```{r}
combined_data_sans_NA = combined_data %>%
  na.omit()
combined_data_sans_NA
```

###résumé des donnée de "combined_data_sans_NA:

```{r}
summary(combined_data_sans_NA)
```

##la distribution des différentes variables:
```{r}
dim(combined_data_sans_NA)
table(combined_data_sans_NA$Fullresp)
table(combined_data_sans_NA$Modality)
table(combined_data_sans_NA$Audio)
table(combined_data_sans_NA$Video)
table(combined_data_sans_NA$Resp)
table(combined_data_sans_NA$ProverbioCond)
table(combined_data_sans_NA$audPoA)
table(combined_data_sans_NA$vidPoA)
table(combined_data_sans_NA$McGurkCond)
table(combined_data_sans_NA$Correct)
table(combined_data_sans_NA$Group)
```
###la distribution des différentes variables en barplot:

dans cette partie nous allons présenter par des bar les distributions des différentes variables. il faut noter que les variables dans notre cas sont des variables qualitatives et donc les diagrammes en bar et des camambert sont les plus adapter pour montrer leur distributions.

####variable Resp:
```{r}
barplot(table(combined_data_sans_NA$Resp))
```
####variable Fullresp:
```{r}
barplot(table(combined_data_sans_NA$Fullresp))
```

####variable Modality:
```{r}
barplot(table(combined_data_sans_NA$Modality))
```

####variable Audio:
```{r}
barplot(table(combined_data_sans_NA$Audio))
```

####variable Video:

```{r}
barplot(table(combined_data_sans_NA$Video))
```

#variable AudPoa:
```{r}
barplot(table(combined_data_sans_NA$audPoA))
```

####variable Vidpoa:
```{r}
barplot(table(combined_data_sans_NA$vidPoA))
```

####variable McGurkCond
```{r}
barplot(table(combined_data_sans_NA$McGurkCond))
```

####variable Correct
```{r}
barplot(table(combined_data_sans_NA$Correct))
```


####variable Group

```{r}
barplot(table(combined_data_sans_NA$Group))
```



###la distribution des différentes variables en camambert:
la distribution en camambert permet elle de montrer le pourcentage qui représente certaines variables par rapport a la totalité de l'echantillon.

####variable Resp:
```{r}
pie(table(combined_data_sans_NA$Resp))
```
####variable Fullresp:
```{r}
pie(table(combined_data_sans_NA$Fullresp))
```

####variable Modality:
```{r}
pie(table(combined_data_sans_NA$Modality))
```

####variable Audio:
```{r}
pie(table(combined_data_sans_NA$Audio))
```

####variable Video:

```{r}
pie(table(combined_data_sans_NA$Video))
```

#variable AudPoa:
```{r}
pie(table(combined_data_sans_NA$audPoA))
```

####variable Vidpoa:
```{r}
pie(table(combined_data_sans_NA$vidPoA))
```

####variable McGurkCond
```{r}
pie(table(combined_data_sans_NA$McGurkCond))
```

####variable Correct
```{r}
pie(table(combined_data_sans_NA$Correct))
```


####variable Group

```{r}
pie(table(combined_data_sans_NA$Group))
```

##comparaison entre musicien et nonmusicien selon les réponse false et True:

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Correct, fill = Group))
```

##comparaison des effets Mcgurkcond entre musicien et nonmusicien:

le graphe montre une comparaison entre musicien et nonmusicien selon leur effets McGurkCond. cette comparaison nous permets de voir s'il existe une diférence entre les musiciens professionnels et les non musiciens selon les conditions McGurk.
l'objectif de l'étude est de montrer si vraiment les musiciens professionnels ne sont pas affecté par l'effet McGurk donc une comparaison avec les non musiciens est trés importante pour montrer les différences qui éxiste. 

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = McGurkCond, fill = Group))
```

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = McGurkCond, fill = Group), position = "dodge")
```


##comparaison des réponses False et True et entre musicien et nonmusicien:


```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Resp, fill = Correct))+
  facet_wrap(~ Group, nrow = 2)
```

##histogramme des effet McGurkCond en pourcentage:

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = McGurkCond, y = ..prop.., group = 1))

```

##comparaison des différent effet McGurkCond avec Correct(true et false):

cette compraison nous permet de voir quelle est la condition McGurk ou on a le plus de réponse True ou False sans faire une différence entre les musiciens professionnels et les non musiciens. sur le graphe on vois clairement que les réponses données quand les conditions McGurk sont en Audio sont True pour plus de 7000 personnes pour seulement 800 réponse False et c'est le méme cas lorsque les conditions sont AUdiovisual Congruent ou les réponses False sont nulle. alors que dans le cas de condition Audiovisual Incongruent les réponses True et False sont identique avec 2500 a 3000 réponses. 
le graphe nous permet pas d'avoir une conclusion mais au moins d'avoir une vision que lorsque les condions McGurk sont Audio et Audiovisual Congruent les réponses données par les musiciens et les non musiciens sont Correct en générale. 
```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = McGurkCond, fill = Correct), position = "dodge")

```


##compraison entre musiciens et non musiciens avec Correct(true et false):

le graphe montre une comparaison entre les musicien et les non musiciens selon la varaible Correct qui montre des réponses False ou True selon les réponses données par les personnes étudiées. cette comparaison nous permets de voir s'il existe une diférence entre les musiciens professionnels et les non musiciens selon les réponses données.
```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Correct, fill = Group))
```


```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Group, fill = Correct), position = "dodge")
```


##Nuage de point entre Fullresp et Resp:

le nuage de point permet de voir la distribution de Fullresp avec la réponse donnée par les individus. elle permets pas de voir grand chose sur les éffets McGurk mais sa nous permet de voir l'évolution. 
```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_point(mapping = aes(x = Fullresp, y = Resp), position = "jitter")
```

##Nuage de point entre Fullresp et Resp avec comparaison entre musicien et nonmusicien:
sur cette partie on a suivie le méme principe que le graphe précedent mais cette fois-ci on a partager en deux graphe (musician et non musician) pour voir la différence entre les deux groupes. 
```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_point(mapping = aes(x = Fullresp, y = Resp), position = "jitter")+
  facet_wrap(~ Group, nrow = 2)
```

##comparaison entre audio et audiovisuel pour musicien et nonmusicien:

les modality d'écoute Audio et Audiovisual aussi joue un role important sur les réponses données par les individus avec ce graphe on vas regarder les différences de réponses données dans le cas de musiciens et non musiciens selon la modality. on voit que si les différences entre musiciens et non musiciens sont négligeable sur les deux modality, les différences de réponse Tue et False selon la modality est trés importantes.
```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Correct, fill = Group), position = "dodge")+
  facet_wrap(~ Modality, nrow = 2)
```

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = Modality, fill = Correct), position = "dodge")+
  facet_wrap(~ Group, nrow = 2)

```

##comparaison entre les différents places d'articulations (audPoA):

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = audPoA, fill = Correct), position = "dodge")+
  facet_wrap(~ Group, nrow = 2)

```

##comparaison entre les différents places d'articulations (vidPoA):

```{r}
ggplot(data = combined_data_sans_NA) + 
  geom_bar(mapping = aes(x = vidPoA, fill = Correct), position = "dodge")+
  facet_wrap(~ Group, nrow = 2)

```

##les trois questions sur les phénomènes observer: 

1- pourquoi les réponses données par les participants sont quasiment correct dans le cas de McGurkcond (audio et audiovisual congruent) alors que dans le cas de (audiovisual incongruent) sont a moitié incorrect?

2- pourquoi l'effet McGurk est plus important dans le cas de place d'articulation alveolar et labial que labiodental et velar?

3- pourquoi dans vidPoA l'effet mcgurk est plus important dans le cas alveolar que labial; alors que dans le cas de audPoA l'effet McGurk est plus important dans la place d'articulation labial que alveolar?


