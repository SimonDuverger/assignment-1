install.packages("tidyverse")
library(tidyverse)

ggplot2::mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# 3.2.4 EXERCISES

#1

ggplot(data = mpg)

# The data frame mpg

#2 : 234 rows and 11 colums

#3 drv indique quelles roues sont motrices (f=front), (r=rear) et (4=4X4)

#4

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))

#5 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))

# le plot n'aide pas car le type de voiture et la motricit� des roues sont li�s

# 3.3.1 EXERCISES

#1

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

#parce que "color" est dans la parenth�se aes

#2 cat�gorielles : model, year, trans, drv, fl, class
# continue: disp, cyl, cty, hwy
# on peut le voir s'il y a un nombre dans le tableau, et pour l'ann�e le d�but est soulign� s�rement pour indiquer que c'est une cat�gorielle

#3

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue", shape = "square")

# je n'arrive pas � mettre size, cela me cr�e une erreur

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = model, y = hwy), color = "blue", shape = "square")

#avec une variable cat�gorielle cela cr�e l'erreur que l'on peut voir sur le graphique

#4 la variable prend les diff�rents "aesthetic" qu'on lui assigne

# 5 

?geom_point

#stroke rajoute un contour autour du point

#6

ggplot(data = mpg) + 
  geom_point(mapping = aes(color = displ <5, x = displ, y = hwy))

#comme on voit sur le graphique les points sont s�par�s en deux couleurs � partir du nombre d�sign�

# 3.5.1 EXERCISES "

#1 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(displ ~ cyl)

#avec une variable continue comme on voit sur le graphique cela cr�e une erreur

#2

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#c'est car il y a une incompatibilit� avec la variable cat�gorielle drv

#3

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#le . sert � fusionner les cellules

#4

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# l'avantage est que �a rend le tout plus lisible
#un d�savantage pourrait �tre qu'on � les spoints sur plusieurs cellules et que �a peut �tre plus dur de comparer surtout si on a beaucoup de donn�es
# si on a un gros dataset on devrait privil�gier les couleurs et shapes

#5 

#nrow donne le nombre de lignes
#ncol donne le nombre de colonnes
#scales, as.table
#ils n'ont pas besoin car ils en ont le nombre du prduit des deux varialbes

# EXERCISES 3.6.1

#1 a line chart

#2 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#3 show.legend = false fait que la l�gende n'est pas inclue sur le graph, si on l'enl�ve on a la l�gende

#4 se = display confident interval around smooth

#5 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#non ces graphs ne sont pas diff�rents
#car les deux codes reviennent au m�me, dans le deuxi�me on sp�cifie les variables dans geom_point et geom_smooth alors que dans le premier on d�finie une fois le tout puis on ajoute geom_point et geom_smooth

#6 
ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, linetype = drv))

# EXERCISES 3.7.1

#1 it's geom_pointrange

ggplot(data = diamonds) + 
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median,
    stat = "summary"
  )

#2
#geom_col mappe directement les valeurs de x et y en variables du dataset

#3 geom_bar & stat_count
# geom_boxplot & stat_boxplot
# geom_contour & stat_contour
# geom_density & stat_density (and 2d)
# geom_qq_line & stat_qq_line
# geom_quantile & stat_quantile
# geom_violin & stat_ydensity
# geom_sf_text & stat_sf
# geom_smooth & stat_smooth
# geom_hex & stat_bin_hex
# geom_count & stat_sum
# geom_bin2d & stat_bin_2d
# geom_histogram & stt_bin

#5

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

#le probl�me est que si on ne pr�cise pas group=1 alors les plots atteigne le maximum � chaque fois

# EXERCISES 3.8.1 

#1 

# le probl�me est qu'on ne controlait pas position = jitter donc tous les points se superposaient
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

#2 c'est la hauteur et la largeur

#3 avec geom_count on fait varier la taille des points et avec geom_jitter on montre la dispersion
# jitter est s�rement mieux avec des plus petits datasets car sinon �a peut �tre illisible tandis que geom_count pourrait �tre adapt� � de gros datasets

#4

ggplot(data = mpg, mapping = aes(x = cty, y = hwy, group = 1)) + 
  geom_boxplot()

# EXERCISES 3.9.1

#1
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

#2
?labs()

#il sert � nommer, donner un titre, un nom aux axes etc..

#3
#cord_map permet d'avoir une portion de la terre en respectant approximativement l'aspect sph�rique
#cord_quickmap permet d'avoir une approximation en garant les lignes (parall�les et m�ridiens) droites

#4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

#�a nous dit qu'ils sont proportionnels
#coord_fixed permet de d�finir un ratio entre les deux axes
#geom_abline permet d'afficher la diagonale (en l'occurrence) qui sert � visualiser mieux le c�t� proportionnel

#EXERCISES 4.4

#1
my_variable <- 10
my_variable
#> Error in eval(expr, envir, enclos): object 'my_variable' not found

#ce code ne marche pas car ce n'est pas exactement le m�me �l�ment, il manque le point sur le i de variable

#2

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)

#3

#�a affiche tous les raccourcis clavier
#on peut le trouver dans l'onglet Tools, Keyboard Shortcuts Help