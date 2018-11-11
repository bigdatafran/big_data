#Mirar tutorial de http://www.sthda.com/english/wiki/data-visualization
if (!require("ggplot2")) install.packages("ggplot2"); require("ggplot2")
qplot(Sepal.Width, Sepal.Length, data=iris)
ggplot(data=iris,aes(x=Sepal.Width,y=Sepal.Length)) + geom_point()

#Wide format: each row is an observation, each column is a variable of the observation.
#Tidy format: each row is the value of a variable for each observation. Only a value is given. This is the format that ggplot understands better
#iris dataset in the wide format
head(iris,3)
#iris dataset in the tidy format
if(!require("reshape2")){install.packages("reshape2")}  ;library("reshape2")
head(melt(iris,id.vars=c("Species")),3)
#Wide to tidy: use the melt function
iris$id <- row.names(iris)
iris.tidy <- melt(iris, id.vars=c("id", "Species"), variable.name="Part.Measure", value.name="Value")
head(iris.tidy,3)
#Tidy to wide:
iris.wide <- dcast(iris.tidy, id + Species ~ Part.Measure, value.var=c("Value"))
head(iris.wide,3)
#Aesthetics can be defined when data is given to ggplot or when a new geometry is given
summary(ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Species)))
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Species)) + geom_point()
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width)) + geom_point(aes(col=Species))
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width)) + geom_point(aes(col=Species,size=3))
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width)) + geom_point(col='blue')

head(diamonds,2)
ggplot(diamonds,aes(x=carat,y=price))+geom_point()
ggplot(diamonds,aes(x=carat,y=price))+geom_point(color="blue")
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(colour=color))

#Change transparency to 0.4 or according to the clarity variable
ggplot(diamonds,aes(x=carat,y=price,alpha=0.3))+geom_point()
ggplot(diamonds,aes(x=carat,y=price,alpha=clarity))+geom_point()
#Change color to red or according to the cut variable
ggplot(diamonds,aes(x=carat,y=price),col ="blue")+geom_point() #Así no funciona lo del color
ggplot(diamonds,aes(x=carat,y=price))+geom_point(col="red") #Asi si que funiona correctamente
ggplot(diamonds,aes(x=carat,y=price,col=color))+geom_point() #Así damos el color de una variable

ggplot(diamonds,aes(x=carat,y=price,col=cut))+geom_point()
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(col=cut)) #Es igual al anterior
#Observar que al menos con la geometría puntos, cuando un parámetros es constante, se pone 
#dentro de geom_point y no dentro de aes(). Pero si el parámetros es igual a una variable
#entonces se pone dentro de aes().
ggplot(diamonds,aes(x=carat,y=price))+geom_point(shape=0) #Shape=forma de los puntos
ggplot(diamonds,aes(x=carat,y=price,shape=cut))+geom_point()
ggplot(diamonds,aes(x=carat,y=price))+geom_point(size=0.1)
ggplot(diamonds,aes(x=carat,y=price,size=depth))+geom_point(size=0.6)+
  geom_jitter(col='red',alpha=0.2,size=0.6)+xlim(2,3)+ylim(10000,15000)
ggplot(diamonds,aes(x=carat,y=price,size=depth))+geom_jitter(col='red')

#Change line type according cut variable (http://www.cookbook-r.com/Graphs/Shapes_and_line_types/)
ggplot(diamonds,aes(x=carat,y=price))+geom_smooth()
ggplot(diamonds,aes(x=carat,y=price))+geom_point()+geom_smooth()
ggplot(diamonds,aes(x=carat,y=price,linetype=cut))+geom_smooth()

ggplot(iris, aes(x=Sepal.Length,y=Sepal.Width))+geom_point()+geom_smooth()
ggplot(iris, aes(x=Sepal.Length,y=Sepal.Width))+geom_point()+geom_smooth(method = lm)


#Modification of the scale on a continuous variable
gg.cont <- ggplot(diamonds, aes(x = x * y * z, y = price)) + 
  geom_point()
gg.cont
gg.cont + 
  scale_x_continuous(name = "size",
                     limits = c(0, 800),
                     breaks = seq(0, 800, 200),
                     minor_breaks = seq(0, 800, 50))

gg.cont + 
  scale_x_continuous(name = "size",
                     limits = c(0, 800),
                     breaks = seq(0, 800, 200),
                     minor_breaks = seq(0, 800, 25))
#Ejemplo con iris
gg<- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_point()
gg
gg<-gg+scale_x_continuous(name='preba',
                      limits = c(5,7),
                      breaks = seq(5,7,0.5),
                      minor_breaks = seq(5,7,0.25))
gg

head(mtcars)


#Modification of the scale on a discrete variable
gg.disc <- ggplot(diamonds, aes(x = clarity, y = price)) + 
  geom_jitter()
gg.disc
gg.disc + 
  scale_x_discrete(name = "clarity",
                   limits = c("I1", "SI2", "VVS2", "IF"),
                   label = c("Bad", "Normal", "Good", "Ideal")) + 
  scale_y_continuous(limits = c(1000, 2000))

p1<- ggplot(iris, aes(x=Species, y=Sepal.Length) )+geom_jitter()
p1

p2<-p1+ scale_x_discrete( name="Eje X",
                  limits=c("setosa","versicolor"),
                  label=c("Tipo1","Tipo2"))+
  scale_y_continuous(
    limits = c(5,7))
p2

#Modification of position (linear/logarithmic/reversed) of continuous variable
gg.cont <- ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point()
gg.cont
gg.cont + 
  scale_y_log10(name = "log(price)",
                breaks = c(500, 1000, 5000, 10000, 15000))
gg.cont + 
  scale_y_reverse(name = "price (descendant)")


# Lo hacemos para iris
p1<- ggplot(iris, aes(x=Sepal.Length,y=Sepal.Width))+ geom_point()+
  scale_y_log10(name="log(Sepal.Width)")
p1

p2<-p1+scale_y_reverse(name="Valores descendentes")
p2

##*********8-11- 2018******************

#Modification of position (reversed) of discrete variable
gg.disc <- ggplot(diamonds, aes(x = cut, y = price)) + 
  geom_jitter()
gg.disc
gg.disc + 
  scale_x_discrete(name = "cut (descendant)",
                   limits = rev(levels(diamonds$cut)))

#Modification of colors in continuous variables
gg.cont <- ggplot(diamonds, aes(x = carat, y = price, col = carat)) + 
  geom_point()
gg.cont
#Color scale with gradient between two colors
gg.cont + 
  scale_color_gradient(low = "green4", high = "red1")
#Gradient scale between three colors
gg.cont + 
  scale_color_gradient2(low = "green4", high = "red1", mid = "yellow", midpoint = mean(diamonds$carat))
#Gradient scale between n colors
gg.cont + 
  scale_color_gradientn(colours = c("green4", "yellow", "red1", "blue4"))


# Con dataset iris
p1<-ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Petal.Length))+geom_point()+
  scale_color_gradient(low = "green4", high = "red1")
p1

p2<- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Petal.Length))+geom_point()+
  scale_color_gradient2(low = "green4", high = "red1", mid = "yellow")
p2

#Para utilizar n colores
p1<-ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Petal.Length))+geom_point()+
  scale_color_gradientn(colours = c("green4", "yellow", "red1", "blue4"))
p1
#utilizando una paleta de colores 
p2<- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,col=Petal.Length))+geom_point()+
  scale_color_gradientn(colours = rainbow(5))
p2

#Gradient scale using palettes
gg.cont + 
  scale_color_gradientn(colours = rainbow(5))
#Palette functions: rainbow, heat.colors, topo.colors, cm.colors


#Modification of colors in discrete variables
gg.disc <- ggplot(diamonds, aes(x = clarity, fill=cut)) + 
  geom_bar()
gg.disc
#Black and white scale
gg.disc + scale_fill_grey()
#Color scale based on palettes
gg.disc + scale_fill_brewer(palette = "Blues")
#List of palettes available in ggplot2: http://colorbrewer2.org/

#para iris
head(mtcars)
p1<- ggplot(mtcars, aes(x = cyl, fill=factor(gear))) + 
  geom_bar()
p1
#Escala de grises
p2<- ggplot(mtcars, aes(x = cyl, fill=factor(gear))) + 
  geom_bar()+ scale_fill_grey()
p2
# Con paleta de colores
p3<-ggplot(mtcars, aes(x = cyl, fill=factor(gear))) + 
  geom_bar()+scale_fill_brewer(palette = "Blues")
p3

# Otro tipo de escala
p4 <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile()+scale_fill_continuous(type = "gradient")
p4

if (!require("RColorBrewer")) install.packages("RColorBrewer"); require("RColorBrewer")

display.brewer.all()
#Mofification of the shapes on a continuous variable
gg.cont <- ggplot(diamonds, aes(x = carat, y = price, size = price)) + 
  geom_point()
gg.cont
#Changing the radius
gg.cont +   scale_size_continuous(range = c(1, 10))
#Changing the area
gg.cont +   scale_size_area(max_size = 10)
#Mofification of the shapes on a discrete variable
gg.disc <- ggplot(diamonds, aes(x = carat, y = price, size = clarity)) + 
  geom_point()
gg.disc
#A complete list of geometries can be found here: http://sape.inf.usi.ch/quick-reference/ggplot2/geom
###***********************************************************
#Let's use the mtcars dataset
head(mtcars,3)
#Basic histograms
gg <- ggplot(mtcars, aes(x = hp))
gg +   geom_histogram(binwidth=20)
gg
gg +   geom_bar(binwidth=20)
gg +  geom_density()
#For two continuous variables
gg <- ggplot(mtcars, aes(x = mpg, y = hp))
gg +  geom_point()
#Scatter plot with some noise
gg +  geom_jitter()
#Line
gg + geom_line()
#Marginal rug plots.
gg + geom_rug()
#Smooth conditional mean of the data
gg + geom_smooth()
gg + geom_point()+geom_smooth()
#Contours from a 2d density estimate
gg + geom_density2d()
#Text
gg + geom_text(aes(label = cyl))
#For one continuous and one discrete variables
gg <- ggplot(mtcars, aes(x = as.factor(am), y = hp))
#Bar
gg +  geom_bar(stat="identity")
#Scatter
gg +  geom_point()
#Scatter with some noise
gg +  geom_jitter()
#Boxplot
gg +   geom_boxplot()
#
gg +   geom_violin()
#For two discrete variables
gg <- ggplot(mtcars, aes(x = as.factor(am), y = as.factor(cyl)))
#Scatter with noise
gg +  geom_jitter()
#Heatmap of 2d bin counts
gg +  geom_bin2d()
#Sigue en la diapositiva 51
#Let's come back to the diamonds datase
gg <- ggplot(diamonds, aes(x = carat, y = price))
#Smoothing stats (including or not the points)
gg + geom_point() + geom_smooth()
gg + geom_smooth()
#Modify the geom of the stat
gg +  stat_smooth(geom = "line")
gg+ stat_smooth(geom = "point", col = "red")
#Modify the stat parameters
gg +  stat_smooth(n = 5) #n = number of points to evaluate smoother at
gg +   stat_smooth(se = F) #without the confidence interval
gg +   stat_smooth(level = 0.99) # with 99% confidence interval
#Aggregation stats
#Count the number of observations at each location
gg <- ggplot(diamonds, aes(x = cut, y = clarity))
gg +  stat_sum(aes(group = 1))
#Discretization stats
#Histogram
ggplot(diamonds, aes(x = price)) +   stat_bin()
#Quantiles
ggplot(diamonds, aes(x = carat, y = price)) +   
  stat_quantile()
ggplot(diamonds, aes(x = carat, y = price)) +     
  stat_quantile(quantiles = c(0, 0.25, 0.50, 0.75, 1))
#Components of ggplot : Facets
#Facets allow to disaggregate a graphic into multiple subgraphics as a function of one or several variables of the dataset.
#There are two ways to do facets in ggplot
#wrap Disaggregation by a given variable (or variables) over one axis
#grid Disaggregation by a given variable (or variables) over two axes
#Let's use the diamonds dataset to show the carat and price as a function of clarity
gg <- ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_point()
gg
#Much better:
gg +   facet_wrap(~clarity)
#Let's plot distributions of prices as a function of the cut
gg <- ggplot(diamonds, aes(x = price, fill = cut))
gg + geom_density()
gg +  geom_density() +  facet_wrap(~cut, nrow = 1)
#Let's try disaggregation by two variables. Study the relationship between hp (horse power) 
#and mpg (miles per gallon) as a function of the type of change (am) and cylinder volume (cyl)
gg <- ggplot(mtcars, aes(x = mpg, y = hp, col = as.factor(am), shape = as.factor(cyl)))
gg +  geom_point(size=4)
gg + geom_point(size=4) + facet_grid(am ~ cyl)
#Coordinates of ggplot : Coordinates (Diapositiva 60)
#A typical bar chart
gg <- ggplot(diamonds, aes(x = clarity, fill = clarity))
gg +  geom_bar()
#A pie-bar chart
gg +  geom_bar() + coord_polar()
#Modifications
gg +  geom_bar() + coord_polar(theta="y") #bars along the angle
ggplot(diamonds, aes(x = "", fill = clarity)) + geom_bar(width=1) + coord_polar(theta="y") #typical pie chart

#Con mtcards
p1<-ggplot(mtcars, aes(x = cyl, fill = factor(cyl)))
p1 <- p1+geom_bar()
p1

p2<-p1+coord_polar()
p2

p3<-p1+ coord_polar(theta="y")
p3

#Limits and zoom
gg <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
#Zoom to see the gap in the prices at 1500 using scales
gg +  scale_x_continuous(limits = c(0, 1.5)) + scale_y_continuous(limits = c(0, 2000))
#Better way to do that using coords (does not complain)
gg +  coord_cartesian(xlim = c(0, 1.5), ylim = c(0, 2000))
#Change the aspect ratio between axes # Gr?fico de corte contra claridad
gg <- ggplot(diamonds, aes(x = cut, y = clarity)) +   geom_jitter() 
gg
#Change the orientation of the axes
gg +  coord_flip() # inverted axis 
#Components of ggplot : Themes
#The complete set of elements can be found here: http://docs.ggplot2.org/0.9.2.1/theme.html
#Basic style graph
gg <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) + 
  geom_jitter()
gg
### themes #######
newtheme<-theme_bw()+theme(plot.title=element_text(color="darkred"))

newtheme$panel.border

newtheme<-newtheme+
  theme(panel.border = element_rect(color="steelblue",size = 12))

p<-ggplot(iris,aes(x=Petal.Length, y=Petal.Width, color=Species))+geom_point()
p+theme_bw()

#Change line properties
gg <- gg + 
  theme(axis.line = element_line(color = "black", size=1),
        axis.ticks = element_line(color = "black", size=1),        
        panel.grid.major = element_line(color = "lightgrey", linetype=2),
        panel.grid.minor = element_line(color = "lightgrey", linetype=2))
gg
#Change properties of the space
gg <- gg + 
  theme(panel.background = element_blank(),
        legend.background = element_rect(color="black"),
        legend.key = element_blank()) 
gg
#Change properties of the text
gg <- gg + 
  theme(axis.title = element_text(size = 14, color = "#555555", face="bold", hjust = 1),
        axis.text = element_text(color = "black", size=12, face = "bold"),
        legend.title = element_text(size = 14, color = "#555555", face="bold", hjust = 1),
        legend.text = element_text(size = 14, color = "#555555"))
gg
#Use predefined themes
gg <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) + 
  geom_jitter()
gg + theme_bw()
gg + theme_light()
gg + theme_linedraw()

### GGally ####
if (!require("GGally")) install.packages("GGally"); require("GGally")
ggpairs(iris, color='Species', alpha=0.4)

# Otra salida diferente
ggpairs(iris, upper=list(continuous="density"), color='Species')

# Moficiamos la salida inferior
ggpairs(iris, upper=list(continuous="density"),
        lower=list(continuous="smooth"))

ggpairs(iris, upper=list(continuous="density"),
        lower=list(continuous="smooth",combo="facetdensity"),
        color="Species")

### heatmaps ####
x1 <- seq(-10, 10, length.out = 10)
y1 <- seq(-10, 10, length.out = 10)
d1 <- expand.grid(x = x1, y = y1)
d1$z <- d1$x^2 - d1$y^2
qplot(x=x, y=y, data=d1, fill=z, geom="tile")
x2 <- seq(-10, 10, length.out = 100)
y2 <- seq(-10, 10, length.out = 100)
d2 <- expand.grid(x = x2, y = y2)
d2$z <- d2$x^2 - d2$y^2
ggplot(data=d2, aes(x=x, y=y, fill=z)) +
  geom_tile() + scale_fill_gradient(low="red", high="green")

### representaciones cartográfica

if (!require("ggmap")) install.packages("ggmap"); require("ggmap")
punto<- geocode("paseo de zorrila 13 valladolid spain", source = "dsk")



map.punto <- get_map(location = as.numeric(punto),
                     source = "osm",
                     scale= 2,zoom=16)
# Da un error de falta de permiso porque hay que sacar api-key en google

# Con get_opendtreepmap
m<- get_openstreetmap(bbox = c(left = -95.80204, bottom = 29.38048, right =
                                 -94.92313, top = 30.14344))

if (!require("maps")) install.packages("maps"); require("maps")
if (!require("OpenStreetMap")) install.packages("OpenStreetMap"); require("OpenStreetMap")
mp <- openmap(c(41.6504,-4.7482), ##Hay que dar lat y lon en este orden
              c(41.6342,-4.7082),type="bing",zoom = NULL,mergeTiles = TRUE)

plot(mp)
#Se ha usado type="bing", pero hay muchos más tipos,
# ver https://www.r-bloggers.com/the-openstreetmap-package-opens-up/

mp.pro<-openproj(mp, projection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
#Paquete para georreferenciar con OSM (herramienta Nominatim ) 
if (!require("tmaptools")) install.packages("tmaptools"); require("tmaptools")
punto2<-geocode_OSM("paseo de zorrilla 13 valladolid spain")
print(punto2)

mp.punto<-autoplot(mp.pro)+geom_point(data=punto,aes(x=punto2$coords[1],
                                                     y=punto2$coords[2]),size=12,shape=21,
                                      fill='red')
mp.punto
plot(mp.punto)



LAT1 =  30 ; LAT2 = 50
LON1 = -10 ; LON2 = 10

map <- openmap(c(LAT2,LON1), c(LAT1,LON2), zoom = NULL,
               type = c("osm", "stamen-toner", "stamen-terrain","stamen-watercolor", "esri","esri-topo")[6],
               mergeTiles = TRUE)
## As Google maps, OSM uses Mercator projection. In this example, for convenience, I prefer 
##to work in standard WGS84 longlat coordinates
## OSM CRS :: "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs"

map.latlon <- openproj(map, projection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

bias.dtf <-  data.frame(LON  = runif(10, LON1, LON2),
                        LAT  = runif(10, LAT1, LAT2),
                        BIAS = runif(10, 5, 10),
                        ID   = paste("Pt.",sprintf("%02d",1:10)))
mytheme <- theme(plot.title = element_text(face = "bold",size = rel(1.2), hjust = 0.5),
                 panel.background = element_rect(colour = NA),
                 plot.background = element_rect(colour = NA),
                 axis.title = element_text(face = "bold",size = rel(1)),
                 axis.title.y = element_text(angle=90,vjust =2),
                 axis.title.x = element_text(vjust = -0.2))

OSMap <- autoplot(map.latlon)  +
  labs(title = "Plot over OpenStreetMap", subtitle = "Bias [%]",x = "Longitude", y="Latitude")+
  geom_label(data=bias.dtf, aes(x=LON ,y=LAT, label=ID, fontface=7), hjust=1, vjust=0, size=4) +
  geom_point(data=bias.dtf, aes(x=LON, y=LAT, fill=BIAS), size=4, shape=21) +
  scale_fill_gradientn(colours = rainbow(10)) + mytheme

OSMap



