---
title: Introducción a Plotly
layout: post
category: [Python]
type: "normal"
tags: [Python,Plotly]
author: "Francisco Rodríguez"
---


# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción

Plotly es un sistema de código abierto que contiene librerías para generar gráficos. En el presente post me voy a centrar en la **librería para Python**, pero también se puede utilizar en Matlab, R y JavaScript. Toda la información sobre Plotly lo [puedes encontrar en este enlace](https://plot.ly/api/){:target='_blank'}.

En el caso de Python, lo primero que hay que hacer es instalar la libreria, para ello lo que hay que hacer es bien simple. Se abre una ventana de comandos y se teclea la siguiente instrucción:

> pip install plotly

Para actualizarlo habría que ejecutar la siguiente instrucción:

> pip install plotly --upgrade

Como ya se ha dicho anteriormente, la libreria es libre pero eso sí hay que darse de alta y obtener un api-key para poder obtener gráficos. Los gráficos se almacenan en la nuve y existen diferentes versiones de esta librería que dependen de la cuenta con la que se esté operando. Las diferentes veriones de compra o uso [se pueden ver haciendo clic en este enlace](https://plot.ly/products/cloud/){:target="_blank"}.

Para registrase hay que ir a este enlace y después de hacer correctamente el registro, se genera un api-key que será el que hay que usar para poder generar gráficos. La versión gratuita permite almacenar 25 gráficos, pero a efectos didácticos  con esa versión versión vale para ejecutar el código que se va a mostrat en este post.

Lo primero que es preciso hacer antes de comenzar a usar esta librería es generar las credenciales para poder utilizarla. Esto se consigue ejecutando las siguientes sentencias de código:


```python
import plotly
plotly.tools.set_credentials_file(username='XXXXXXX', api_key='XXXXXXXX')

```

En una aplicación real de este código habría que poner el usuario y el api_key que corresponda en cada caso.

Con la sentencia anterior se ha generado un fichero en ".plotly/.credentials" que contiene la información precisa para una identificación adecuada a la hora de generar los gráficos.

Ahora bien, si no quieres darte de alta el Plotly como se ha indicado anteriormente, también existe la posibilidad de trabajar en modo local, en cuyo caso se generará un fichero en formato html con instrucciones correspondientes para poder visualizar el gráfico. Este metodo se verá en el último apartado. 

Para obtener ayuda sobre esta herramienta, se puede utilizar la siguiente instrucción:


```python
import plotly.plotly as py
help(py.plot)
```

    Help on function plot in module plotly.plotly.plotly:
    
    plot(figure_or_data, validate=True, **plot_options)
        Create a unique url for this plot in Plotly and optionally open url.
        
        plot_options keyword arguments:
        filename (string) -- the name that will be associated with this figure
        fileopt ('new' | 'overwrite' | 'extend' | 'append') -- 'new' creates a
            'new': create a new, unique url for this plot
            'overwrite': overwrite the file associated with `filename` with this
            'extend': add additional numbers (data) to existing traces
            'append': add additional traces to existing data lists
        auto_open (default=True) -- Toggle browser options
            True: open this plot in a new browser tab
            False: do not open plot in the browser, but do return the unique url
        sharing ('public' | 'private' | 'secret') -- Toggle who can view this
                                                      graph
            - 'public': Anyone can view this graph. It will appear in your profile
                        and can appear in search engines. You do not need to be
                        logged in to Plotly to view this chart.
            - 'private': Only you can view this plot. It will not appear in the
                         Plotly feed, your profile, or search engines. You must be
                         logged in to Plotly to view this graph. You can privately
                         share this graph with other Plotly users in your online
                         Plotly account and they will need to be logged in to
                         view this plot.
            - 'secret': Anyone with this secret link can view this chart. It will
                        not appear in the Plotly feed, your profile, or search
                        engines. If it is embedded inside a webpage or an IPython
                        notebook, anybody who is viewing that page will be able to
                        view the graph. You do not need to be logged in to view
                        this plot.
        world_readable (default=True) -- Deprecated: use "sharing".
                                         Make this figure private/public
    
    


```python
print("La versión de plotly utilizada es: ",plotly.__version__)
```

    La versión de plotly utilizada es:  3.2.1
    

Un primer gráfico a modo de ejemplo, y para entrar en materia, sería el que se ve a continuación.


```python
import plotly.plotly as py
import plotly.graph_objs as go

trace0 = go.Scatter(
    x=[1, 2, 3, 4],
    y=[10, 15, 13, 17]
)
trace1 = go.Scatter(
    x=[1, 2, 3, 4],
    y=[16, 5, 11, 9]
)
data = [trace0, trace1]

py.iplot(data, filename = 'basic-line')
```




<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plot.ly/~Miguelro11/32.embed" height="525px" width="100%"></iframe>



La página web de plotly viene con un montón de ejmplos, todos ellos muy explicativos, por lo que se invita al lector que acuda a dicha página web y vea cómo generar gráficos a medida de las necesidades del usuario. Aquí simplemente me voy a limitar a copiar el cídogo de un ejemplo, a fin de que el lector observe lo fácil que es generar gráficos con esta utilidad.


```python
# Learn about API authentication here: https://plot.ly/pandas/getting-started
# Find your api_key here: https://plot.ly/settings/api

import string
import pandas as pd
import numpy as np
import plotly.plotly as py
import plotly.graph_objs as go

N = 100
y_vals = {}
for letter in list(string.ascii_uppercase):
     y_vals[letter] = np.random.randn(N)+(3*np.random.randn())
        
df = pd.DataFrame(y_vals)
df.head()

data = []

for col in df.columns:
    data.append(  go.Box( y=df[col], name=col, showlegend=False ) )

data.append( go.Scatter( x = df.columns, y = df.mean(), mode='lines', name='mean' ) )

# IPython notebook
#  py.iplot(data, filename='pandas-box-plot')
py.iplot(data)

#url = py.plot(data, filename='pandas-box-plot')
```




<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plot.ly/~Miguelro11/34.embed" height="525px" width="100%"></iframe>



# Generación de tablas

A continuación me voy a centrar en la **generación de tablas con esta librería**. Las instrucciones necesarias para generar este tipo de elementos, [las podemos encontrar en este enlace](https://plot.ly/python/table/){:target='_blank'}.

En lo que sigue se van a incluir algunos ejemplos que ayuden al lector a tomar una idea sobre las posibilidades que se tiene con esta librería.


```python
import plotly.plotly as py
import plotly.graph_objs as go

traza=go.Table(
    header=dict(values=['Nombre','Edad','Ciudad'],
               fill=dict(color='#22313f'),
                font=dict(color='white')
               ),
    cells=dict(
        values=[['Francisco','Fernando','Julia','María'],
               [20,30,40,34],
                 ['Valladolid','Palencia','Madrid','Jaen']
               ],
        fill=dict(color='#e4f1fe')
        )
)

data = [traza] 
py.iplot(data, filename = 'tabla_basica')
```




<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plot.ly/~Miguelro11/36.embed" height="525px" width="100%"></iframe>



# Tablas con DataFrame

Veamos cómo poder generar una tabla utilizando un DataFrame generado con Pandas


```python
import pandas as pd


column_names = ['mpg', 'cilindros', 'desplazamiento', 'potencia', 'peso', 
                'aceleracion', 'ano', 'origen', 'marca']
datos=pd.read_csv("http://mlr.cs.umass.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data",
                  delim_whitespace=True,header=None, names=column_names,na_values='?',
                 dtype={'marca':str})
#Limitamos los datos a mostrar

datos=datos[0:7]

```


```python
datos
```




<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>mpg</th>
      <th>cilindros</th>
      <th>desplazamiento</th>
      <th>potencia</th>
      <th>peso</th>
      <th>aceleracion</th>
      <th>ano</th>
      <th>origen</th>
      <th>marca</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>18.0</td>
      <td>8</td>
      <td>307.0</td>
      <td>130.0</td>
      <td>3504.0</td>
      <td>12.0</td>
      <td>70</td>
      <td>1</td>
      <td>chevrolet chevelle malibu</td>
    </tr>
    <tr>
      <th>1</th>
      <td>15.0</td>
      <td>8</td>
      <td>350.0</td>
      <td>165.0</td>
      <td>3693.0</td>
      <td>11.5</td>
      <td>70</td>
      <td>1</td>
      <td>buick skylark 320</td>
    </tr>
    <tr>
      <th>2</th>
      <td>18.0</td>
      <td>8</td>
      <td>318.0</td>
      <td>150.0</td>
      <td>3436.0</td>
      <td>11.0</td>
      <td>70</td>
      <td>1</td>
      <td>plymouth satellite</td>
    </tr>
    <tr>
      <th>3</th>
      <td>16.0</td>
      <td>8</td>
      <td>304.0</td>
      <td>150.0</td>
      <td>3433.0</td>
      <td>12.0</td>
      <td>70</td>
      <td>1</td>
      <td>amc rebel sst</td>
    </tr>
    <tr>
      <th>4</th>
      <td>17.0</td>
      <td>8</td>
      <td>302.0</td>
      <td>140.0</td>
      <td>3449.0</td>
      <td>10.5</td>
      <td>70</td>
      <td>1</td>
      <td>ford torino</td>
    </tr>
    <tr>
      <th>5</th>
      <td>15.0</td>
      <td>8</td>
      <td>429.0</td>
      <td>198.0</td>
      <td>4341.0</td>
      <td>10.0</td>
      <td>70</td>
      <td>1</td>
      <td>ford galaxie 500</td>
    </tr>
    <tr>
      <th>6</th>
      <td>14.0</td>
      <td>8</td>
      <td>454.0</td>
      <td>220.0</td>
      <td>4354.0</td>
      <td>9.0</td>
      <td>70</td>
      <td>1</td>
      <td>chevrolet impala</td>
    </tr>
  </tbody>
</table>
</div>




```python
import plotly.plotly as py
import plotly.graph_objs as go

traza=go.Table(
    header=dict(values=["mpg","cilindros","desplazamiento","potencia","peso","año"],
                fill=dict(color="#0000FF"),
                align=['left']*7,
                font=dict(color='white')
               ),
    cells=dict(values=[datos.mpg,datos.cilindros,datos.desplazamiento,datos.potencia,
                      datos.peso,datos.ano],
               fill=dict(color="#A9E2F3"),
               align=['left']*7,
               format=[".1f","s",".1f",".1f",".1f","s"]
            )
)

data=[traza]
py.iplot(data,filename='tabla_pandas')
```




<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plot.ly/~Miguelro11/38.embed" height="525px" width="100%"></iframe>



# Plotly Offline

Como ya se ha indicado anteriormente, existe la posibilidad de trabajar sin conectarse con Plotly y **por lo tanto en modo Offline**. Cuando se trabaja de esta manera se genera un fichero en formato html que se guarda en local y se puede visualizar con un navegador, como cualquier otro fichero con código html.

A continuación se muestra ejemplo sobre cómo poder conseguir este resultado.


```python
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
import plotly.graph_objs as go
plot([go.Scatter(x=[2,3,5,6,8,10], y=[5,2,6,4,7,7])])
```




    'file://H:\\MisCodigos\\web\\temp-plot.html'




