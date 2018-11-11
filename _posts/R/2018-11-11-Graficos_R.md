---
title: Gráficos con R
layout: post
category: [R,Graficos]
type: "normal"
tags: [r,graficos,plot]
author: "Francisco Rodríguez"
comments: true
---
# Contenido
{:.no_toc}

* TOC
{:toc}

Introducción
============

Esto post lo voy a dedicar a ofrecer una ligera introducción a los gráficos en R, pues una exposición detallada de los mismos pueden perfectamente ocupar librosde textos completos que lógicamente no tienen cabida dentro de un post. Debido a esta limitación y con el fin de salvarla, lo que he decidido ha sido escribir dos manuales de gráficos, cada uno de ellos dedicado a una de las dos partes en que se divide la creación de gráficos en R y que se expondrá a continuación. Los enlaces a estos dos manuales los pondrá un poco más adelante.

Los dos grandes bloques o enfoques de realizar un gráfico en R y referenciados anteriormente son los siguientes:

-   **Primer bloque**. Los gráficos se realizan con el paquete gráfico que tiene R al cargarse. Estos gráficos, aunque son potentes y variados, no llegan al nivel de estilo y de adaptación de multitud de circuntancias como ocurre con los gráficos del segundo bloque.

-   **Segundo bloque** . En este bloque incluyo los gráficos que se pueden obtener con un paquete muy cnocido dentro del mundo de R y que se denomina "ggplot2". Sin lugar a dudas con este paquete se consigue un refinamiento de los gráficos muy elevados permitiendo adaptar cada gráfico a las exigencias más ambiciosas y llegando a poder controlar todos los aspectos que se puedan presentar dentro de una grñafica estadística.

Indudablemente, existen más paquetes diseñados para la presentación de gráficos, pero desde luego los dos bloques presentados anteriormente son los que tienen una mayor difusión dentro del campo R y por lo tanto a ellos dos queda enfocado el presente post y los dos documentos que he elaborado y que a continuación ofrezco el enlace para que se pueda ver con más detalles cual es el mecanismo a seguir para generar calquier tipo de gráfico con cualquiera de estas dos alternativas.

1.-[Gráficos en R con el paquete básico.](https://bigdatafran.github.io/big_data/doc/graficosR-Public.pdf){:target="\_blank"}

2.- [Gráficos más avanzados en R con ggplot2](https://bigdatafran.github.io/big_data/doc/ggplot_Publi.pdf){:target="\_blank"}

En la elaboración de dichos tutoriales he empleado mucho tiempo y he puesto todo mi empeño, en poder explicar lo mejor posible, cómo construir gráficos estadísticos con R, y por lo tanto te agradecería me comentaras cual es tu aponión sobre el trabajo, y cuales pueden ser los aspectos que se pueden mejorar. Tu opinión la puedes añadir sin más que escribir un comentario al final del presente post.

Gráficos con paquete básico de R
================================

Como ya he reflejado anteriormente no quiero extenderme en exceso en el presente post, pues en los documentos a los que he hecho referencia anteriormente ya se relatan los métodos existentes para la creación de gráficos con R. Por ese motivo en este apartado tan sólo voy a abordar algún método del paquete básico de R que se encarga de la disposición de los gráficos en el panel gráfico.

Una primera función que se encarga de hacer esto es *split.screen()*, de tal manera que si se ejecuta la instrucción *split.screen(c(1,2))* el dispositivo gráfico quedará dividido en dos partes, y se podrá seleccionar cada una de las dos partes con *screen(1)* ó *screen(2)*. Además con la instrucción *erase.screen()* se borrará la última gráfica dibujada.

Otra funcion interesante para el posicionamiento gráfico, es la función *layout()*, con la cual se puede dividir el dispositivo gráfico en una serie de **partes donde colocar la gráficas de manera sucesiva**. Para trabajar con esta función, básicamente emplea elementos de la clase matrix. A continuación se muestra un ejemplo.

``` r
# Se construye la matriz
mat <- matrix(1:4, 2, 2)
print(mat)
```

    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4

``` r
layout(mat)
#for(i in 1:4) layout.show(i)
layout.show(4)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

En el supuesto de que alguna zona de la salida gráfica se desee no tenga gráfico, se usará el valor cero ( "0" ) en la matriz para indicar esta circunstancia. Un ejemplo clarificador de esta situación es el siguiente.

``` r
mat<- matrix(c(0:4),2,2)
```

    ## Warning in matrix(c(0:4), 2, 2): la longitud de los datos [5] no es un
    ## submúltiplo o múltiplo del número de filas [2] en la matriz

``` r
layout(mat)
layout.show(3)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

Observar que el orden de posicionamiento de los elementos sigue el orden marcado para la creación de matrices en R, es decir primero rellena de arriba hacia abajo (por columnas) para saltar a la siguiente columna y empezar en ese orden de nuevo. Como en el casso de construcción de matrices, este comportamiento se modifica con la instrucción *matrix(..., byrow=TRUE)* y por lo tanto en este caso, se escribirá de izquierda a derecha y luego hacia abajo.

En el supuesto de que se quieran unir varias celdas de una disposición gráfica determinada, lo que hay que hacer es repetir con el mismo número esas celdas. En el siguiente ejemplo se muestra cómo hacerlo.

``` r
mat<-matrix(c(1,1,2,3),2,2)
layout(mat)
layout.show(3)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

Observar la diferencia con la siguiente disposición.

``` r
mat<-matrix(c(1,1,2,3),2,2, byrow = TRUE)
layout(mat)
layout.show(3)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />

Como ya se ha visto en los ejemplos anteriores, la función *layout()* divide el dispositivo gráfico en zonas regulares por defecto. Se puede modificar este comportamiento con las opciones *widths* y *heights*, que indican modificaciones relativas. Veamos a continuación algún ejemplo.

``` r
mat<-matrix(c(1:4),2,2)
layout(mat, widths = c(1,3),heights = c(3,1))
layout.show(4)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-5-1.png" style="display: block; margin: auto;" />

En el ejemplo anterior se está indicando que la primera columna tenga una anchura igual a la tercera parte de la segunda y que la primera fila tenga un ancho triple que la segunda.

Otras disposicones más complejas pueden ser las siguientes

``` r
mat <- matrix(c(1,1,2,1),2,2)
layout(mat, widths=c(2, 1),
heights=c(1, 2))
layout.show(2)
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

Por último también se pueden crear disposiciones gráficas con la función de bajo nivel *par()*. Por ejemplo con *par(mfrow=c(2,2))* se generará una salida de cuatro gráficos con dos filas y dos columnas.

Por mi parte nada más que añadir en este apartado. simplemente insistir que un desarrollo más completo de los gráficos lo puede ver en [este enlace](https://bigdatafran.github.io/big_data/doc/graficosR-Public.pdf){:target="\_blank"}.

Gráficos con ggplot2
====================

Igualmente en este apartado no me voy a parar demasiado, pues en el documento ya indicado se puede ver un desarrollo mucho más extenso y pormenorizado de todo ello, en este apartado me voy a centrar en la librería *grid* que permite hacer disposiciónes gráficas para colocar los gráficos en el formato de disposición que se desee. Primero se construyen los gráficos, que es lo que se hace con el código siguiente.

``` r
if (!require("ggplot2")) install.packages("ggplot2"); require("ggplot2")
```

    ## Loading required package: ggplot2

``` r
if (!require("grid")) install.packages("grid"); require("grid")
```

    ## Loading required package: grid

``` r
data(Orange)
x1<- ggplot(Orange, aes(age, circumference)) +
geom_point(aes(colour=factor(Tree)))
### Quitamos leyendas
x2 <- x1 + theme(legend.position = "none")
### Quitamos aestética
x3 <- ggplot(Orange, aes(age, circumference)) + geom_point()
### Plot sin datos
x4 <- x3 + theme(panel.border = element_rect(linetype = "solid",
colour = "black"))
x5 <- x3 + theme(axis.ticks = element_blank(), axis.text.x =
element_blank(), axis.text.y = element_blank(), panel.grid.major =
element_blank(), panel.grid.minor = element_blank(),
panel.background = element_blank()) + ylab("") + xlab("")
```

Ahora creamos la disposición de la salida de la siguiente manera:

``` r
pushViewport(viewport(layout = grid.layout(nrow=2, ncol=2)))
print(x5, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
print(x4, vp = viewport(layout.pos.row = 1, layout.pos.col = 2))
print(x3, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
print(x2, vp = viewport(layout.pos.row = 2, layout.pos.col = 2))
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-8-1.png" width="95%" style="display: block; margin: auto;" />

Para terminar ste apartado, voy a poner tres ejemplos que muestran las diferentes disposiciones gráficas que pueden tener un diagrama de barras ( lo denominados Stacked Bar Graph). Observar que estas diferentes disposiciones gráficas se consiguen con la opción *position* que puede tener los valores: position\_stack, position\_dodge, y position\_fill.

``` r
ggplot(mtcars,aes(x=carb))+ geom_bar(aes(fill=factor(am)))
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

La salida con position="dodge", sería la siguiente:

``` r
ggplot(mtcars,aes(x=carb))+ 
  geom_bar(aes(fill=factor(am)),position=position_dodge())
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-10-1.png" style="display: block; margin: auto;" /> y para position="fill"

``` r
ggplot(mtcars,aes(x=carb))+ 
  geom_bar(aes(fill=factor(am)),position=position_fill())
```

<img src="./img/R/2018-11-11-Graficos_R/unnamed-chunk-11-1.png" style="display: block; margin: auto;" />