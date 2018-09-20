---
title: Introducción a Pandas
layout: post
category: [Python]
type: "normal"
tags: [Python,Pandas,Numpy]
author: "Francisco Rodríguez"
---

# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción

En post's anteriores ya hemos hecho una presentación el paquete de Python **ampliamente utilizado por la comunidad de machine learning** denominado Pandas. En esta ocasión vamos a entrar con un poco más de detalle en la utilización de esta herramienta.

Antes de nada decir que el paquete Pandas es un producto de código abierto y por lo tanto totalmente gratuito, que ofrece grandes prestaciones para el análisis de datos de una forma además muy fácil de manejar. Son muchos los campos de la actividad humana donde es necesario utilizar Pandas, pero es en concreto en el ámbito de machine learning, donde junto a numpy ofrece grandes prestaciones.

Es indudable que un paquete con las prestaciones que ofrece Pandas es imposible de abordar y de manejar dentro de la limitación que ofrece un post, por este motivo en lo que sigue se mostrarán unas pocas características del paquete, y se deja al lector interesado que [acuda a este enlace](https://pandas.pydata.org/){:target="_blank"} para que pueda adquirir en su total amplitud las posibilidades que ofrece Pandas.

La instalación de Pandas dentro de Python es sumamente fácil. Simplemente con introducir la siguiente instrucción en la pantalla de comandos de windos *pip install pandas* ya se tendría Pandas lista para poder ser utilizado y poder trabajar con él.

Este paquete posee basicamente tres estructuras de datos:

* Series. Utilzadas en estructuras de datos con dimensión 1.
* DataFrame. Utilizado en estructuras de datos con dimensión 2.
* Panel. Utilizado en estructuras de datos con dimensión 3.

En Pandas, los datos contenido dentro de una **Serie son inmutables** ( no se pueden cambiar ), pero los datos almacenados en **Dataframes o de tipo Panel son mutables**, es decir se pueden cambiar en el proceso de trabajo con los datos.



# Datos de tipo Series

Como ya hemos comentado anteriormente, este tipo de datos son **estructuras unidimensionales de tipo inmutable** que pueden contener datos de cualquier tipo ( enteros, caracteres, float, objetos de tipo Python, etc. ).

Un constructor utilizado para obtener este tipo de estructuras, puede ser el que se muestra a continuación:

>  pandas.Series(data=None, index=None, dtype=None, name=None, copy=False, fastpath=False)

Los parámetross que vemos en el constructor significan los siguiente:

* **data**. Puede ser un np.array, una lista o constantes.
* **index**. Debe ser un conjunto de valores no repetidos.
* **dtype**. Es el tipo de datos con el que se rabaja.
* **copy**. Para copiar o no los datos. El valor por defecto es False. 

Este tipo de datos se puede crear desde: un np.array, un diccionario o valores escalares.

Veamos a continuación cómo crear este tipo de datos:


```python
#Primero importamos la libreria y decimos que nos referimos a ella con pd
import pandas as pd
s=pd.Series()
print(s)
#Vemos nos devuelve un objeto vacio con el tipo de datos por defecto float64
```

    Series([], dtype: float64)
    

Crearemos a un objeto Series, partiendo de un numpy.array 


```python
import pandas as pd
#Importamos la librería numpy que tambien es muy usada en machine learning
import numpy as np

data=np.array(['Pedro','Juan','Marisa','Ferdinand'])
#Ahora creamos datos tipo Series
datos= pd.Series(data)
print(datos)

#Observemos la primera columna que se obtiene, es el índice quee por defecto se crea
```

    0        Pedro
    1         Juan
    2       Marisa
    3    Ferdinand
    dtype: object
    

Ahora creamos un objeto similar al anterior, pero con un índice diferente.


```python
data=np.array(['Pedro','Juan','Marisa','Ferdinand'])
#Ahora creamos datos tipo Series pero con un deteminado índice
datos= pd.Series(data,index=[20,21,22,23])
print(datos)
```

    20        Pedro
    21         Juan
    22       Marisa
    23    Ferdinand
    dtype: object
    


```python

```
