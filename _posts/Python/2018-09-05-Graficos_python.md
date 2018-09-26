---
title: Gráficos Python
layout: post
category: [Python,Graficos]
type: "normal"
tags: [Python,Matplotlib,Gráficos,Plot]
author: "Francisco Rodríguez"
---


# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción

Python cuenta con una potente librería para generar gráficos [denominada matplotlib](https://matplotlib.org/index.html){:target="_blank"}. 

Gracias a esta librería se pueden visualizar desde diferentes puntos de vista la estructura de los datos con los que estamos trabajando. Antes de entrar en detalle en la generación de gráficos, conviene exponer y aclarar dos conceptos básicos sobre los que se sustenta la generación de este tipo de objetos.

Todo gráfico generado con matplotlib tiene dos zonas que son las a continuación se detallan.

1.- figure. Es una instancia de un objeto [matplotlib.figure.Figure](https://matplotlib.org/api/figure_api.html#matplotlib.figure.Figure){:target="_blank"} y **va a ser el contenedor** de los gráficos que se van a generar.

2.- axes. Es una instancia de un objeto [matplotlib.axes.Axes](https://matplotlib.org/api/axes_api.html#matplotlib.axes.Axes){:target="_blank"} y representa la zona donde realmente se va introducir todos los elementos que conforman el gráfico.

Para entender mejor la anatomía con la que trabaja matplotlib [en este enlace](https://github.com/matplotlib/AnatomyOfMatplotlib){:target='_blank'} puedes encontrar una expliación clara y detallada sobre los conceptos que rodean a esta herramienta.

A la hora de trabajar con matplotlib es importante distinguir entre **modo interactivo y modo no interactivo**. Cuando se inicia una nueva sesión con esta librería, por defecto se entra en modo no interactivo, lo cual significa que aunque se genere un gráfico, el mismo no se muestra hasta que se utilice la propiedad show().

Para iniciar una sesión con matplotlib, se puede hacer con la siguiente instrucción.


```python
import matplotlib.pyplot as plt

```

Como podemos ver en la instrucción anterior se importa "matplotlib.pyplot", que según la documentación de matplotlib contiene un conjunto de comandos inspirados MATLAB.

Como ya se ha dicho antes, al inicio de una sesión se entra en modo no interactivo. Para comprobarlo se utiliza la siguiente instrucción:


```python
plt.isinteractive()
```




    False



Para cambiar al modo interactivo, se puede utilizar el siguiente comando:

> plt.ion()

o bien

> %matplotlib inline

Si quieres tener información sobre " %matplotlib " puedes ejecutar en Jupyter notebook la siguiente instrucción:

> ?%matplotlib

Si quieres cambiar al modo no interactivo de matplotlib se tendrá que ejecutar la siguiente instrucción:

> plt.ioff()

Si se quiere que los gráficos se sobrescriban, es decir generar uno para posteriormente poner otro encima, **se deberá utilizar el conmutador**

> plt.hold()

Para saber si este conmutador está activo o no, se utilizará el siguiente comando:

>  plt.ishold()

Veamos un ejemplo sencillo sobre esto:


```python
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline
print("Solapamiento gráficos?: ", plt.ishold())
print("Está en modo interactivo?:",plt.isinteractive() )

plt.plot(np.random.rand(6))
plt.plot(np.random.rand(6))

plt.show()
```

    D:\programas\Anaconda\lib\site-packages\ipykernel_launcher.py:4: MatplotlibDeprecationWarning: pyplot.hold is deprecated.
        Future behavior will be consistent with the long-time default:
        plot commands add elements without first clearing the
        Axes and/or Figure.
      after removing the cwd from sys.path.
    No handles with labels found to put in legend.
    

    Solapamiento gráficos?:  True
    Está en modo interactivo?: True
    


![png](./img/jupyter/2018-09-05-Graficos_python/output_6_2.png)


# Activación de ventanas.

Como ya se ha dicho en apartados anteriores, los objetos de tipo "Figure", **son el contenedor de los gráficos que se van generando**. Se pueden crear varios contenedores y depositar sobre ellos diferentes gráficos. Veamos un ejemplo.


```python
plt.figure('scatter') # Creamos un objeto de tipo Figure denominado 'scatter'
plt.figure('plot') # Creamos otro objeto de tipo Figure denominado 'plot'
a = np.random.rand(10) # Generamos un vector de valores aleatorios
b = np.random.rand(10) # Generamos otro vector de valores aleatorios
# Con la siguiente instrucción indicamos que la ventana activa es 'scatter'

plt.figure('scatter')
plt.scatter(a,b,label='scatter') # Dibujamos un scatterplot en la ventana 'scatter'
plt.legend()
plt.figure('plot') # Ahora la ventana  activa sería 'plot' y dibujamos un plot
plt.plot(a,b,label='Plot')
plt.legend()
```




    <matplotlib.legend.Legend at 0x255dac979e8>




![png](./img/jupyter/2018-09-05-Graficos_python/output_8_1.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_8_2.png)


# Trabajar con subplots

Si en lugar de sacar los gráficos de forma independiente, como se ha hecho en el caso anterior, los queremos sacar relacionados y con una cierta disposición, se puede conseguir esto utilizando los subplots.

A continuación veamos un ejemplo sobre cómo obtener los gráficos anteriores, pero en una disposición de dos gráficos en una sola fila.


```python
plt.figure(figsize=(20,10))  # Con esto cambiamos tamaño figura
plt.ion() # Nos ponemos en modo interactivo
# Dividimos la ventana en una fila y dos
# columnas y dibujamos el primer gráfico
plt.subplot(1,2,1) # Divide la ventana en en una fila y dos columnas, y toma
#la primera posición 
plt.plot((1,2,3,4,5),label='Plot 1')
plt.legend()
# Dividimos la ventana en una fila y dos
# columnas y dibujamos el segundo gráfico
plt.subplot(1,2,2) # Divide la ventana en en una fila y dos columnas, y toma
#la segunda posición 
plt.plot((5,4,3,2,1),label='Plot 2')
plt.legend()
```




    <matplotlib.legend.Legend at 0x255dab58198>




![png](./img/jupyter/2018-09-05-Graficos_python/output_10_1.png)


# Dos formas de generar plots 

Anteriormente hemos visto los conceptos de "Figure" y "Axes" que rodean a matplotlib. Igualmente hemos visto que para importar esta librería, lo hacíamos con *import matplotlib.pyplot as plt*, es decir importábamos pylot. 

Para comprender mejor cómo trabaja cada uno has de tener en cuenta que cuando pones en un gráfico *plt.xlim* es equivalente a poner ax.set_xlim() ( Con ax de la instrucción anterior me estoy refiriendo a un objeto de tipo Axes que se haya definido anteriormente ). En general, has de tener cuenta que **todos los métodos de un objeto Axes tienen una función con finalidad similar en el módulo pyplot**. 

Por lo tanto se pueden utilizar caminos diferentes, para obtener el mismo resultado. Para ver la equivalencia de estos dos métodos, a continuación se muestran dos ejemplos, con construcciones diferentes, pero resultados iguales.


```python
# método utilizando objeto figure y axes
import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot([1, 2, 3, 4], [10, 20, 25, 30], color='lightblue', linewidth=3)
ax.scatter([0.3, 3.8, 1.2, 2.5], [11, 25, 9, 26], color='red', marker='o')
ax.set_xlim(0.5, 4.5)
```




    (0.5, 4.5)




![png](./img/jupyter/2018-09-05-Graficos_python/output_12_1.png)



```python
import matplotlib.pyplot as plt
plt.plot([1, 2, 3, 4], [10, 20, 25, 30], color='lightblue', linewidth=3)
plt.scatter([0.3, 3.8, 1.2, 2.5], [11, 25, 9, 26], color='red', marker='o')
plt.xlim(0.5, 4.5)
```




    (0.5, 4.5)




![png](./img/jupyter/2018-09-05-Graficos_python/output_13_1.png)


Como se puede ver el segundo método es más intuitivo y rápido, por lo que se suele utilizar más sobre todo en las representaciones más sencillas.

Cada objeto de tipo axes tiene además otros dos elementos : **x-axis** e **y-axis**, los cuales a su vez contienen major y minor ticklines y ticklabels. Además hay que tener en cuenta que también cuentan con: labels, título y leyenda.

Además hay que tener en cuenta los **objetos de tipo matplotlib.spines**, que son las marcas de los ejes que rodean al gráfico. Para mejor conocer este concepto, a continuación se transcribe un ejemplo de la documentación de matplotlib. 


```python
'''
Este código muestra:
    - Ejes normales con spines en los cuatro lados;
    - spines sólo abajo y a la izquierda
    - Un eje con un spine ajustado.
'''

import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 2 * np.pi, 100)
y = 2 * np.sin(x)

fig, (ax0, ax1, ax2) = plt.subplots(nrows=3)

ax0.plot(x, y)
ax0.set_title('normal spines')

ax1.plot(x, y)
ax1.set_title('bottom-left spines')

# Hide the right and top spines
ax1.spines['right'].set_visible(False)
ax1.spines['top'].set_visible(False)
# Only show ticks on the left and bottom spines
ax1.yaxis.set_ticks_position('left')
ax1.xaxis.set_ticks_position('bottom')

ax2.plot(x, y)

# Only draw spine between the y-ticks
ax2.spines['left'].set_bounds(-1, 1)
# Hide the right and top spines
ax2.spines['right'].set_visible(False)
ax2.spines['top'].set_visible(False)
# Only show ticks on the left and bottom spines
ax2.yaxis.set_ticks_position('left')
ax2.xaxis.set_ticks_position('bottom')

# Tweak spacing between subplots to prevent labels from overlapping
plt.subplots_adjust(hspace=0.5)
plt.show()
```


![png](./img/jupyter/2018-09-05-Graficos_python/output_15_0.png)


# Añadiendo sublpots

Anteriormente ya se ha visto la manera de añadir subplots a un gráfico generado con matplotlib, el formato era: *plt.subpot(...)* que recordemos es lo mismo que ejecutar un código similar al siguiente:

> fig=plt.figure()
> ax = fig.add_subplot(111)

**NOTA**: Observar que el significado de  fig.add_subplot(111) es el siguiente: (111) es equivalente a (1,1,1) y lo dos primeros 1,1 significan línea 1 columna 1 y el siguiente 1 indica que se ocupe la primera posición.

Sin embargo existe otro método, para generar subplots. El código genérico sería el siguiente:

> fig.add_axes([0,0,1,1])

El primer método, se puede decir que es útil para generar subplots relativos, mientras que con el segundo se fija el lugar donde se insertará el gráfico, ya que en sus parámetros hay que incluir la coordenada x y la coordenada y donde se colocará el gráfico, junto a la anchura y la altura del mismo.


```python
#Ejemplo de construcción de objetos tipo Axes
import matplotlib.pyplot as plt
fig=plt.figure()
fig.add_axes([100,0,1,0.8])
```




    <matplotlib.axes._axes.Axes at 0x255daff7668>




![png](./img/jupyter/2018-09-05-Graficos_python/output_17_1.png)


# Algunos ejemplos

A continuación se muestran algunos ejemplos sobre el uso de esta librería.


```python
plt.plot(np.arange(100), 'b') # Dibujamos una línea recta azul
plt.xlabel('Valores de x') # Ponemos etiqueta al eje x
plt.ylabel(u'Línea azul') # Ponemos etiqueta al eje y
plt.twinx() # Creamos un segundo eje y
# Dibuja una exponencial de 0 a 5 con la y representada en el
# segundo eje y
plt.plot(np.exp(np.linspace(0,5,100)), 'g')
plt.ylabel(u'Línea verde') # Ponemos etiqueta al segundo eje y
# Limitamos los valores del eje x para que vayan desde -10 a 110
plt.xlim(-10,110) 
```




    (-10, 110)




![png](./img/jupyter/2018-09-05-Graficos_python/output_19_1.png)



```python
# Dibujamos una serie temporal
import calendar
# Para generar el lugar del primer días de cada mes en un año
dias = [np.array(calendar.mdays)[0:i].sum()+ 1 for i in np.arange(12)+1]
# Creamos una lista con los nombres de los meses
meses = calendar.month_name[1:13]
plt.axes([0.1,0.2,0.8,0.65])
# Creamos un plot con 365 valores
plt.plot(np.arange(1,366), np.random.rand(365), label = 'valores al azar')
plt.xlim(-5,370) # Los valores del eje y variarán entre -5 y 370
plt.ylim(0,1.2) # Los valores del eje y variarán entre 0 y 1.2
plt.legend() # Creamos la caja con la leyenda
plt.title(u'Ejemplo de título') # Ponemos un título
# Ponemos un título superior
plt.suptitle(u'Ejemplo de título superior')
# Pedimos que se vean subrrayas de división en los ejes
plt.minorticks_on()
# Colocamos las etiquetas, meses, en las posiciones, días,
# con color azul y rotadas 45º
plt.xticks(dias, meses, size = 'small', color = 'b', rotation = 45)
plt.xlabel(u't (días)')
plt.ylabel('Media diaria')


```




    Text(0,0.5,'Media diaria')




![png](./img/jupyter/2018-09-05-Graficos_python/output_20_1.png)



```python
# Creamos unos valores para la altura de 100 españolas
alt_esp = np.random.randn(100)+165 + np.random.randn(100) * 10
# Creamos unos valores para la altura de 100 alemanas
alt_ale = np.random.randn(100)+172 + np.random.randn(100) * 12
# Creamos unos valores para la altura de 100 tailandesas
alt_tai = np.random.randn(100)+159 + np.random.randn(100) * 9
# El valor por defecto para los bigotes es 1.5*IQR pero lo escribimos
# explícitamente
plt.boxplot([alt_esp, alt_ale, alt_tai], sym = 'ko', whis = 1.5)
# Colocamos las etiquetas para cada distribución
plt.xticks([1,2,3], ['Esp', 'Ale', 'Tai'], size = 'small', color ='k')
plt.ylabel(u'Altura (cm)')
```




    Text(0,0.5,'Altura (cm)')




![png](./img/jupyter/2018-09-05-Graficos_python/output_21_1.png)



```python
# Construimos un histograma
# Definimos un vector de números
# aleatorios de una distribución normal
x = np.random.randn(10000)
# Dibuja un histograma dividiendo el
# vector x en 20 intervalos del mismo ancho
plt.hist(x, bins = 20,density=True, linewidth=1.2, edgecolor='black') 
# linewidth=1.2, edgecolor='black' sirven para obtener las líneas del borde de rectángulos
plt.title('Ejemplo de función distribución')
```




    Text(0.5,1,'Ejemplo de función distribución')




![png](./img/jupyter/2018-09-05-Graficos_python/output_22_1.png)



```python
import numpy as np
import matplotlib.mlab as mlab

import matplotlib.pyplot as plt

mu, sigma = 100, 15
x = mu + sigma*np.random.randn(10000)

# Generamos el histograma de los datos
n, bins, patches = plt.hist(x, 50, normed=1, facecolor='green', alpha=0.75, linewidth=0.8, edgecolor='black')

# Añadimos la linea con datos que siguen una normal
# la función mlab.normpdf es "deprecated". Utilizamos Scipy
#y = mlab.normpdf( bins, mu, sigma)
from scipy.stats import norm
#Ver http://scipy.github.io/devdocs/tutorial/stats.html
# pdf: Probability Density Function
y=norm.pdf(bins,mu,sigma)

l = plt.plot(bins, y, 'r--', linewidth=1)

plt.xlabel('valores')
plt.ylabel('Probabilidad')
plt.title(r'$\mathrm{Histograma\ de\ IQ:}\ \mu=100,\ \sigma=15$')
plt.axis([40, 160, 0, 0.03])
plt.grid(True)

plt.show()
```

    D:\programas\Anaconda\lib\site-packages\matplotlib\axes\_axes.py:6462: UserWarning: The 'normed' kwarg is deprecated, and has been replaced by the 'density' kwarg.
      warnings.warn("The 'normed' kwarg is deprecated, and has been "
    


![png]./img/jupyter/2018-09-05-Graficos_python/(output_23_1.png)


# imshow()

Para poder mostrar imágenes con matplotlib se utliza la función imshow(), que lo que hace es en un array que puede representar pixeles, cada valor indica un color diferente. Veamos un pequeño ejemplo sobre su uso.


```python
a=np.array([[ 0.72080244,  0.25576786,  0.67696279],
       [ 0.47049696,  0.54773236,  0.9342035 ],
       [ 0.83608481,  0.96395743,  0.24782517]])

plt.imshow(a)
```




    <matplotlib.image.AxesImage at 0x255dededa90>




![png](./img/jupyter/2018-09-05-Graficos_python/output_25_1.png)


# Generando contornos

Matplotlib también tiene una herramienta para poder generar contornos, esta librería se denomina *matplotlib.pyplot.contour* 
y un ejemplo entresacado de la galería de gráficos de matplotlib, se muestra a continuación.


```python
import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

matplotlib.rcParams['xtick.direction'] = 'out'
matplotlib.rcParams['ytick.direction'] = 'out'

delta = 0.025
x = np.arange(-3.0, 3.0, delta)
y = np.arange(-2.0, 2.0, delta)
X, Y = np.meshgrid(x, y)
Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 0.0, 0.0)
Z2 = mlab.bivariate_normal(X, Y, 1.5, 0.5, 1, 1)
# difference of Gaussians
Z = 10.0 * (Z2 - Z1)


# Create a simple contour plot with labels using default colors.  The
# inline argument to clabel will control whether the labels are draw
# over the line segments of the contour, removing the lines beneath
# the label
plt.figure()
CS = plt.contour(X, Y, Z)
plt.clabel(CS, inline=1, fontsize=10)
plt.title('Simplest default with labels')


# contour labels can be placed manually by providing list of positions
# (in data coordinate). See ginput_manual_clabel.py for interactive
# placement.
plt.figure()
CS = plt.contour(X, Y, Z)
manual_locations = [(-1, -1.4), (-0.62, -0.7), (-2, 0.5), (1.7, 1.2), (2.0, 1.4), (2.4, 1.7)]
plt.clabel(CS, inline=1, fontsize=10, manual=manual_locations)
plt.title('labels at selected locations')


# You can force all the contours to be the same color.
plt.figure()
CS = plt.contour(X, Y, Z, 6,
                 colors='k',  # negative contours will be dashed by default
                 )
plt.clabel(CS, fontsize=9, inline=1)
plt.title('Single color - negative contours dashed')

# You can set negative contours to be solid instead of dashed:
matplotlib.rcParams['contour.negative_linestyle'] = 'solid'
plt.figure()
CS = plt.contour(X, Y, Z, 6,
                 colors='k',  # negative contours will be dashed by default
                 )
plt.clabel(CS, fontsize=9, inline=1)
plt.title('Single color - negative contours solid')


# And you can manually specify the colors of the contour
plt.figure()
CS = plt.contour(X, Y, Z, 6,
                 linewidths=np.arange(.5, 4, .5),
                 colors=('r', 'green', 'blue', (1, 1, 0), '#afeeee', '0.5')
                 )
plt.clabel(CS, fontsize=9, inline=1)
plt.title('Crazy lines')


# Or you can use a colormap to specify the colors; the default
# colormap will be used for the contour lines
plt.figure()
im = plt.imshow(Z, interpolation='bilinear', origin='lower',
                cmap=cm.gray, extent=(-3, 3, -2, 2))
levels = np.arange(-1.2, 1.6, 0.2)
CS = plt.contour(Z, levels,
                 origin='lower',
                 linewidths=2,
                 extent=(-3, 3, -2, 2))

# Thicken the zero contour.
zc = CS.collections[6]
plt.setp(zc, linewidth=4)

plt.clabel(CS, levels[1::2],  # label every second level
           inline=1,
           fmt='%1.1f',
           fontsize=14)

# make a colorbar for the contour lines
CB = plt.colorbar(CS, shrink=0.8, extend='both')

plt.title('Lines with colorbar')
#plt.hot()  # Now change the colormap for the contour lines and colorbar
plt.flag()

# We can still add a colorbar for the image, too.
CBI = plt.colorbar(im, orientation='horizontal', shrink=0.8)

# This makes the original colorbar look a bit out of place,
# so let's improve its position.

l, b, w, h = plt.gca().get_position().bounds
ll, bb, ww, hh = CB.ax.get_position().bounds
CB.ax.set_position([ll, b + 0.1*h, ww, h*0.8])


plt.show()
```

    D:\programas\Anaconda\lib\site-packages\ipykernel_launcher.py:14: MatplotlibDeprecationWarning: The bivariate_normal function was deprecated in version 2.2.
      
    D:\programas\Anaconda\lib\site-packages\ipykernel_launcher.py:15: MatplotlibDeprecationWarning: The bivariate_normal function was deprecated in version 2.2.
      from ipykernel import kernelapp as app
    


![png](./img/jupyter/2018-09-05-Graficos_python/output_27_1.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_27_2.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_27_3.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_27_4.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_27_5.png)



![png](./img/jupyter/2018-09-05-Graficos_python/output_27_6.png)


# Galería de ejemplos

Una buena galería de ejemplos de gráficos realizados con marplotlib la [podemos encontrar en este enlace](https://matplotlib.org/2.1.1/gallery/index.html){:target="_blank"}.

# Guardar Gráficos

Todo lo que hemos explicado hasta este momento lo que ha conseguido es generar una serie de gráficos, pero sin que hasta este momento se haya explicado, como poder guardar estos resultados en un fichero en un formato determinado para que luego se puedan utilizar como elementos gráficos en otro documento. Lógicamente matplotlib permite tambien hacer esto de una forma sencilla y fácil de utilizar. Veamos a continuación cómo hacerlo.

Para poder guardar una figura obtenida en matplotlib, tan sólo tenemos que utilizar una sentencia similar a la siguiente:

> plt.savefig("nombre.png")

Si queremos obtener una figura con fondo transparente, se jecutaría el siguiente comando:

> plt.savefig("nombre.png", transparent=True)

Se puede guardar también múltiples plot's en un determinado fichero pdf, para ello inicialmente se importa una librería que permite generar este tipo de utilidades. A continuación se muestra cómo poder hacerlo.


~~~~
from matplotlib.backends.backend_pdf import PdfPages # Import PdfPages
pp = PdfPages('multipage.pdf') # Initialize the pdf file
pp.savefig() # Save the figure to the file
pp.close() # Close the file
~~~~


# Formato salida ggplot2

Para los amantes de R, matplotlib también puede establecer un formato de salida similar al que utiliza la librería de R ggplot2, para tan sólo hay que añadir la instrucción: plt.style.use("ggplot").

A continación volvemos a generar un gráfico anterior, pero en esta ocasión dándole un formato del tipo ggplot2.


```python
plt.style.use("ggplot") #Definimos el formato de salida de tipo ggplot2 

plt.plot(np.arange(100), 'b') # Dibujamos una línea recta azul
plt.xlabel('Valores de x') # Ponemos etiqueta al eje x
plt.ylabel(u'Línea azul') # Ponemos etiqueta al eje y
plt.twinx() # Creamos un segundo eje y
# Dibuja una exponencial de 0 a 5 con la y representada en el
# segundo eje y
plt.plot(np.exp(np.linspace(0,5,100)), 'g')
plt.ylabel(u'Línea verde') # Ponemos etiqueta al segundo eje y
# Limitamos los valores del eje x para que vayan desde -10 a 110
plt.xlim(-10,110) 
```




    (-10, 110)




![png](./img/jupyter/2018-09-05-Graficos_python/output_31_1.png)


Para dar más formatos a los gráficos generados, se pueden utilizar las normas e instrucciones que [se pueden ver en este enlace](https://matplotlib.org/users/customizing.html){:target="_blank"}.

# Gráficos en 3D

Existe también la posibilidad de generar gráficos en tres dimensiones dentro de Python. Para conseguirlos hay que utilizar la librería *mpl_toolkits.mplot3d* y ejecutar código como el que se muestra a continuación.


```python
import numpy as np

a=np.random.uniform(low=0.0, high=10.0,size=10)
b=np.random.uniform(low=0.0, high=10.0,size=10)
c=np.random.uniform(low=0.0, high=10.0,size=10)
```


```python
from mpl_toolkits.mplot3d import Axes3D
```


```python
import matplotlib.pyplot as plt
%matplotlib inline
fig = plt.figure()
ax = fig.add_subplot(111,projection='3d')
```


![png](./img/jupyter/2018-09-05-Graficos_python/output_36_0.png)



```python
fig = plt.figure()
ax = fig.add_subplot(111,projection='3d')
ax.scatter(a,b,c,c="blue")
```




    <mpl_toolkits.mplot3d.art3d.Path3DCollection at 0x1270b9b0>




![png](./img/jupyter/2018-09-05-Graficos_python/output_37_1.png)

<div class="descargar">
<a href="{{ site.url }}{{ site.baseurl }}/jupyter/graficos_python.ipynb" download>Descargar fichero *.ipynb</a>
</div>
