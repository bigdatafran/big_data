---
title: Primeros pasos con Python
layout: post
category: [python,numpy,pandas,matplotlib]
type: "normal"
tags: [python,numpy,pandas,matplotlib]
author: "Francisco Rodríguez"
---

# Contenido
{:.no_toc}

* TOC
{:toc}

<a name="Introducción."></a>

# Introducción

En el presente post nos vamos a centrar en hacer una pequeña introducción al lenguaje python y a hacer una referencia e introducción a una serie de paquetes muy utilizados en el campo el big data. Me estoy refiriendo a **Numpy, Pandas o MatplotLib** . Veamos por lo tanto inicialmente una pequeña referencia a Python.
<a name="Python."></a>
# Python.
<a name="Tipos-de-datos."></a>
## Tipos de datos.

Los tipo de datos que podemos tener en python son:

* Numéricos:

    1.- Enteros
    
    2.- Reales
    
    3.- Complejos
    
* Cadena de caracteres.

* Valores booleano ( True ó False )
<a name="Datos-numéricos"></a>
### Datos numéricos.


```python
# Creamos un entero
i= 4
# Veamos de qué tipo es 
print(type(i))
```

    <class 'int'>
    

Sin embargo si en lugar de trabajar con enteros lo hacemos con números de tipo real, se puede hacer de la siguiente manera:


```python
h=4. #Observar el punto después del número entero 4
print(type(h))
```

    <class 'float'>
    


```python
# Ahora vamos a obtener un número real de forma sencilla y fácil.
b=i/2
print(b)
print(type(b))
```

    2.0
    <class 'float'>
    


```python
#Se puede trabajar con enteros con una cifra de dígitos muy alta
c=2**200
print(c)
print(type(c))
```

    1606938044258990275541962092341162602522202993782792835301376
    <class 'int'>
    


```python
print(len(str(c)))
# Veamos la longitud de un número muy alto
print(len(str(2**100000)))
```

    61
    30103
    

Como ya hemos visto anteriormente, los números reales en Python realmente son de tipo float. Con este tipo de formato, se pueden entre otras, realizar las operaciones que  se muestran en los ejemplos que se muestran en los ejemplos que siguen.


```python
#definimos un número de tipo float
a=3.
print("a= ",a)
print("Tipo a= ",type(a))
#Se pueden pasar números reales a enteros de la siguiente manera
a=3456.78
print("Pasado a entero: ",int(a))
#También se puede redondear el número anterior:
print("Número a redondeado: ",round(a))
```

    a=  3.0
    Tipo a=  <class 'float'>
    Pasado a entero:  3456
    Número a redondeado:  3457
    

Los valores de tipo **Complejo** se tratan de la siguiente manera:


```python
a=3.5+6.3j
print(type(a))
b=2.3+4.6J
c=a+b
print("La suma de los complejos es:",c)
```

    <class 'complex'>
    La suma de los complejos es: (5.8+10.899999999999999j)
    

Python cuenta con una libreria especializada en fórmulas matemáticas, denominada math. El trabajo con la misma se haría de la siguiente manera.


```python
import math
print("Valor de número pi:",math.pi)
print("Valor del coseno:",math.cos(20))
```

    Valor de número pi: 3.141592653589793
    Valor del coseno: 0.40808206181339196
    
<a name="Cadena-de-caracteres."></a>
### Cadena de caracteres.

Las **Cadenas de caracteres** son una secuencia de letras que están encerrados bien entre comillas dobles ( " " ), o bien entre comillas simples ( ' ' ).


```python
a='Buenos días'
# Como hay carácter ' en la frase necesariamente se encierra en comillas dobles
b="Nos vamos a McDonald's"
print("El tipo de dato de a es:",type(a))
# Los String se pueden concatenar de la siguiente manera
print("La concatenación de a y b es: ",a+b)
print("El número de caracteres de a es:",len(a))

```

    El tipo de dato de a es: <class 'str'>
    La concatenación de a y b es:  Buenos díasNos vamos a McDonald's
    El número de caracteres de a es: 11
    

En las cadenas de caracteres se pueden extraer las letras que las componen de la siguiente manera: 


```python
a="Hoy es miércoles"
print(a[0],a[2])
```

    H y
    


```python
#Si el índice es negativo se seleccionan comenzando por la derecha

print(a[-1],a[-3])
```

    s l
    


```python
#Para convertir un character a entero
a='1234' #Sería un valor de tipo carácter
print('El tipo de a es: ',type(a))
a=int(a)
print('Ahora sin embargo a es de tipo:',type(a))
```

    El tipo de a es:  <class 'str'>
    Ahora sin embargo a es de tipo: <class 'int'>
    


```python
#La operación enversa sería pasar de númerico a cadena de caracteres.
a=234
print('a es del tipo: ',type(a))
a=str(a)
print('Ahora a es del tipo: ',type(a))
```

    a es del tipo:  <class 'int'>
    Ahora a es del tipo:  <class 'str'>
    
<a name="Valores-de-tipo-Boolean."></a>
### Valores de tipo Boolean.

Las variables de **tipo Boolean** sólo pueden tomar dos valores: True, False ( a efectos numéricos, True equivale a 1, o número mayor que 1, y False a cero). Se suelen utilizar cuando se hacen comparaciones entre variables, y son muy útiles en los "bucles" de elementos utilizados en Python.  


```python
print(bool(1))
print(bool(2))
print(bool(0.0))
```

    True
    True
    False
    
<a name="Tipos-de-colecciones."></a>
## Tipos de colecciones.

Son muchas las colecciones soportadas por Python, no obstante y debido a la limitación de este trabajo, a continuación se van a exponer las tres más utilizadas dentro del campo de Big Data.
<a name="Tuplas"></a>
### Tuplas

Las tuplas admiten un conjunto de valores y normalmente van encerradas entre paréntesis.


```python
a=(1,2,"tres","cuatro")
print("Tipo de dato a:",type(a))
#Para entresacar datos de la tupla...
print("Segundo elemento:",a[1])
print("Último elemento:",a[-1])
```

    Tipo de dato a: <class 'tuple'>
    Segundo elemento: 2
    Último elemento: cuatro
    
<a name="Listas"></a>
### Listas.

Las listas en Python son un tipo de datos muy similar a las tuplas, pero para distinguirlas, los datos se encierran entre corchetes:


```python
b=['uno','dos','tres']
print(b)
#Se pueden añadir elementos
b.append('cuatro')
print(b)
```

    ['uno', 'dos', 'tres']
    ['uno', 'dos', 'tres', 'cuatro']
    


```python
#Pueden contener datos de diferente clase
b.append(5)
print(b)
```

    ['uno', 'dos', 'tres', 'cuatro', 5]
    


```python
#Los elementos se extraen de la siguiente manera
print("El primer elemento es ",b[0])
print("El penúltimo elemento es ",b[-2])
```

    El primer elemento es  uno
    El penúltimo elemento es  cuatro
    
<a name="Diccionarios."></a>
### Diccionarios.

Los diccionarios también se les conoce por la denominación de **matrices asociativas** y son colecciones de elementos en las cuales cada uno de los elementos que la componen están constituidos por una clave y un valor asociado a esa clave.


```python
telefonos={'Luis':347562,
          'pedro':738264,
           'Juan':528492
          }
#A los valores se accede de la siguiente manera
print(telefonos['pedro'])
```

    738264
    


```python
print(telefonos)
```

    {'Luis': 347562, 'pedro': 738264, 'Juan': 528492}
    


```python
#Para borrar un elemento
del(telefonos['Juan'])
#Comprobemos si se ha borrado
'Juan' in telefonos
```




    False


<a name="Instrucciones-condicionales."></a>
### Instrucciones condicionales.

Estas instrucciones se utilizan para realizar una instrucción u otra dependiendo se den determinadas condiciones. Para mostrar su funcionamiento en Python, a continuación se muestra un ejemplo, en el que se indica además **cómo se construyen las funciones en Python**.


```python
#Se define una función denominada 
def ValorAbsoluto(n):
    n = int(n)
    if n < 0:
        print ("El valor absoluto de ",n,"is",-n)        
    else:
        print ("El valor absoluto de",n,"is",n)
    
    
ValorAbsoluto(-7)
```

    El valor absoluto de  -7 is 7
    
<a name="loops-en-Python"></a>
### loops en Python.

A continuación se muestra cómo poder hacer ciclos de tratamiento de datos en Python.


```python
count = 0
while (count < 4):
    #Observar los 4 espacios de tabulación. Es muy importante en Python
    print('el contador es:', count) 
    count = count + 1

print("Final del contador")
```

    el contador es: 0
    el contador es: 1
    el contador es: 2
    el contador es: 3
    Final del contador
    


```python
for letter in 'Python':     
    print('La letra actual es:', letter)
```

    La letra actual es: P
    La letra actual es: y
    La letra actual es: t
    La letra actual es: h
    La letra actual es: o
    La letra actual es: n
    


```python
parameters = [1,10,100]
for index in range(len(parameters)):
    if parameters[index]==100:
        print('Parámetro actual :', parameters[index])
```

    Parámetro actual : 100
    
<a name="Numpy."></a>
## Numpy.

Numpy es uno de los paquetes más utilizados en el campo de Machine Learning. Entre sus elementos más importantes, está el trabajo con arrays. A continuación se muestran algunos ejemplos explicativos sobre esta materia.

Primero veamos el **concepto de dimensión** en un numpy array


```python
import numpy as np
a=np.array(1)
print("La dimensión de a es:",np.ndim(a))
b=np.array([1,2,3])
print("La dimensión de b es:",np.ndim(b))
c=np.array([[1,2,3],[4,5,6]])
print("La dimensión de c es:",np.ndim(c))
d=np.array([[[1,2,3],[4,5,6]],[[6,3,4],[6,2,5]]])
print("La dimensión de d es:",np.ndim(d))
```

    La dimensión de a es: 0
    La dimensión de b es: 1
    La dimensión de c es: 2
    La dimensión de d es: 3
    


```python
import numpy as np
x = np.array([[42.4,3],[4,6],[7,5]])
print("Los valores del array x son: ", x)
print("El tipo de  x es: ", x.dtype)
#Ojo no confundir dimensión con shape del array
print("La dimensión de x es:", np.ndim(x))
print("El shape de x es ",np.shape(x))
```

    Los valores del array x son:  [[ 42.4   3. ]
     [  4.    6. ]
     [  7.    5. ]]
    El tipo de  x es:  float64
    La dimensión de x es: 2
    El shape de x es  (3, 2)
    


```python
F = np.array([1, 1, 2, 3, 5, 8, 13, 21])
V = np.array([3.4, 6.9, 99.8, 12.8])
print("Los valores de F son: ", F)
print("Los valores de V son: ", V)
print("Tipo de F: ", F.dtype)
print("Tipo de V: ", V.dtype)
print("Dimension de F: ", np.ndim(F))
print("Dimension de V: ", np.ndim(V))
print("Shape de F", np.shape(F))
```

    Los valores de F son:  [ 1  1  2  3  5  8 13 21]
    Los valores de V son:  [  3.4   6.9  99.8  12.8]
    Tipo de F:  int32
    Tipo de V:  float64
    Dimension de F:  1
    Dimension de V:  1
    Shape de F (8,)
    


```python
A = np.array([ [3.4, 8.7, 9.9  ], 
               [1.1, -7.8, -0.7],
               [4.1, 12.3, 4.8 ]])
print(A)
print("Dimension d A: ", np.ndim(A))
print(np.shape(A))
```

    [[  3.4   8.7   9.9]
     [  1.1  -7.8  -0.7]
     [  4.1  12.3   4.8]]
    Dimension d A:  2
    (3, 3)
    


```python
B = np.array([ [[111, 112], [121, 122]],
               [[211, 212], [221, 222]],
               [[311, 312], [321, 322]] ])

print(B)
print("Dimension de B: ", np.ndim(B))
print(np.shape(B))
```

    [[[111 112]
      [121 122]]
    
     [[211 212]
      [221 222]]
    
     [[311 312]
      [321 322]]]
    Dimension de B:  3
    (3, 2, 2)
    
<a name="Indexando-valores."></a>
### Indexando valores.

Esta utilidad va a servir para poder entresacar valores de numpy arrays.


```python
F = np.array([1, 1, 2, 3, 5, 8, 13, 21])
# Se imprime el primer valor del array
print(F[0])
# Se imprime el último valor de F
print(F[-1])
```

    1
    21
    


```python
B = np.array([ [[111, 112], [121, 122]],
               [[211, 212], [221, 222]],
               [[311, 312], [321, 322]] ])
print(B)
print(B[0,1,0])
```

    [[[111 112]
      [121 122]]
    
     [[211 212]
      [221 222]]
    
     [[311 312]
      [321 322]]]
    121
    
<a name="Slicing"></a>
### Slicing

Sirve para indicar qué valores queremos extraer de los arrays


```python
A = np.array([ [3.4, 8.7, 9.9], 
               [1.1, -7.8, -0.7],
               [4.1, 12.3, 4.8]])
print(A)
print(A[:2,:2])
```

    [[  3.4   8.7   9.9]
     [  1.1  -7.8  -0.7]
     [  4.1  12.3   4.8]]
    [[ 3.4  8.7]
     [ 1.1 -7.8]]
    


```python
S = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
print(S[2:5])
print(S[:4])
print(S[6:])
print(S[:])
```

    [2 3 4]
    [0 1 2 3]
    [6 7 8 9]
    [0 1 2 3 4 5 6 7 8 9]
    


```python
A = np.array([
[11,12,13,14,15],
[21,22,23,24,25],
[31,32,33,34,35],
[41,42,43,44,45],
[51,52,53,54,55]])

print(A)
```

    [[11 12 13 14 15]
     [21 22 23 24 25]
     [31 32 33 34 35]
     [41 42 43 44 45]
     [51 52 53 54 55]]
    


```python
print(A[:3,2:],"\n")
print(A[3:,:],"\n")
print(A[:,4:])
```

    [[13 14 15]
     [23 24 25]
     [33 34 35]] 
    
    [[41 42 43 44 45]
     [51 52 53 54 55]] 
    
    [[15]
     [25]
     [35]
     [45]
     [55]]
    
<a name="Operaciones-con-arrays."></a>
### Operaciones con arrays.



```python
# De la siguiente manera se obtiene la multiplicación elemento a 
#elemento del array (Ojo no es la conocida multiplicación de matrices)
x = np.array( ((2,3), (3, 5)) )
y = np.array( ((1,2), (5, -1)) )
x * y
```




    array([[ 2,  6],
           [15, -5]])




```python
# multiplicación de matrices
x = np.matrix( ((2,3), (3, 5)) )
y = np.matrix( ((1,2), (5, -1)) )
print(x * y,"\n")

# Dot producto
x = np.array( ((2,3), (3, 5)) )
y = np.array( ((1,2), (5, -1)) )
print(np.dot(x,y))

```

    [[17  1]
     [28  1]] 
    
    [[17  1]
     [28  1]]
    
<a name="Números-aleatorios."></a>
### Números aleatorios.

La generación de números aleatorios es una herramienta muy útil en el campo de Machine Learning. Para obtener números aleatorios, existen ya utilidades desarrolladas dentro del paquete Numpy, y a continuación se pasa a exponer algunos ejemplos que muestran la generación de los mismos ( si se quiere profundizar más en este tema, [se puede consultar el siguiente enlace](https://docs.scipy.org/doc/numpy/reference/routines.random.html){:target="_blank"}).


```python
#Obteniendo cuatro números aleatorios (de una uniforme entre 0 y 1)
import numpy as np
for i in range(4):
    print(np.random.random())
```

    0.415944375306758
    0.3949777889373144
    0.25431729478513077
    0.6133013561633982
    


```python
# Eligiendo aleatoriamente un elemento 
from random import choice
possible_destinations = ["Berlin", "Madrid", 
                         "Amsterdam", "London", "Paris", 
                         "Zurich", "Heidelberg", "Strasbourg", 
                         "Augsburg", "Milan", "Rome"]
print(choice(possible_destinations))
```

    Heidelberg
    


```python
rng = np.random.RandomState(0)
X = rng.randn(200, 2)

X.shape
```




    (200, 2)




```python
#Si queremos sacar siempre los mismos números, definimos primero una semilla
np.random.seed(20)
np.random.random(4)
#Observamos que al repetir la ejecución de esa sentencia siempre
#obtenemos los mismos números. Est es muy útil para la ejecución 
#repetida de ejemplos en las mismas condiciones.
```




    array([ 0.5881308 ,  0.89771373,  0.89153073,  0.81583748])


<a name="Pandas."></a>
## Pandas.

Pandas es otro paquete muy utilizado dentro de Python sobre todo para el manejo y transformación de los datos. Su uso y utilización, se puede ver en la [página web del propio Pandas](http://pandas.pydata.org/){:target="_blank"}.

Dado el enfoque que se ha dado en este post, tan sólo se va a hacer una pequeña referencia a las posibilidades que nos ofrece Pandas para ayudar en el trabajo de la interpretación de los datos.

Para empezar, conviene decir que Pandas cuenta con dos estructuras básicas de datos:

* **DataFrame**. Que es una estructura de datos tabular compuesta por filas y columnas.
* **Series**. En este caso se trata de un objeto unidimensional que se puede equiparar a una columna de una tabla. 

Estudiemos con un poco más de detalle estas dos estructuras.
<a name="DataFrame."></a>
### DataFrame.

Como ya se ha dicho anteriormente se trata de una estructura bidimensional de datos estructurados en filas y columnas. Para ver mejor su construcción a continuación mostramos un ejemplo: 


```python
import pandas as pd
#Observar que lo que se construye a continuación es un diccionario de datos
datos={'nombres':['Juan','Pedro','Estela','Maria'],
        'edades':[34,45,23,32]
}
data_frame=pd.DataFrame(datos)
print(data_frame)
```

       edades nombres
    0      34    Juan
    1      45   Pedro
    2      23  Estela
    3      32   Maria
    

Como se puede observar, las columnas del DataFrame no tienen el mismo orden que el que se ha utilizado en su definición, esto es debido a que Pandas lo que hace es ordenar las columnas por orden alfabético. Si se quiere usar una ordenación diferente se puede hacer lo siguiente:


```python
data_frame_2 = pd.DataFrame(datos, columns = ['nombres', 'edades'])
print(data_frame_2)
```

      nombres  edades
    0    Juan      34
    1   Pedro      45
    2  Estela      23
    3   Maria      32
    

También se pueden utilizar unos índices distintos a 0,1,2,3,.... que son los que se utilizan por defecto. Para conseguir esto se utiliza la siguiente expresión:


```python
data_frame_2 = pd.DataFrame(datos, columns = ['nombres', 'edades'], index=['a','b','c','d'])
print(data_frame_2)
```

      nombres  edades
    a    Juan      34
    b   Pedro      45
    c  Estela      23
    d   Maria      32
    
<a name="Series."></a>
### Series.

Se utiliza este tipo de datos para crear estructuras unidimensionales. Para su creación se utiliza el siguiente comando,


```python
series = pd.Series(['Ramón', 'Juan', 'Maria', 'Abelardo', 'Melisa'],
                   index = [1, 2, 3, 4, 5])
print(series)
```

    1       Ramón
    2        Juan
    3       Maria
    4    Abelardo
    5      Melisa
    dtype: object
    

En ocasiones y aunque sólo sea para ver la estructura de los datos, conviene ver los primeros o los últimos. Para esto se tienen dos funciones: *head y tail*, que en nuestro ejemplo darían el mismo resultado debido a los escasos datos con los que se está trabajando.


```python
print(data_frame_2.head(),"\n" )
print(data_frame_2.tail())
```

      nombres  edades
    a    Juan      34
    b   Pedro      45
    c  Estela      23
    d   Maria      32 
    
      nombres  edades
    a    Juan      34
    b   Pedro      45
    c  Estela      23
    d   Maria      32
    

Existe también la posibilidad de ver el tipo de datos que contiene el objeto pandas que se ha creado, la forma de hacerlo es la siguiente:


```python
data_frame_2.describe
```




    <bound method NDFrame.describe of   nombres  edades
    a    Juan      34
    b   Pedro      45
    c  Estela      23
    d   Maria      32>




```python
import matplotlib.pyplot as plt
data_frame_2.plot(x='nombres',y='edades',kind='bar',style='o')
plt.show()
```


![png](./img/jupyter/output_76_0.png)


Se puede intercambiar tipos de datos entre numpy y pandas. A continuación se muestra cómo pasar un dataframe a numpy array.


```python
np.array(data_frame_2)
```




    array([['Juan', 34],
           ['Pedro', 45],
           ['Estela', 23],
           ['Maria', 32]], dtype=object)


<a name="Creando-gráficos."></a>
## Creando gráficos.

Python posee una potente librearía para generar gráficos denominada Matplotlib. En los siguientes ejemplos se va a hacer una pequeña introducción a la misma, para ampliar conocimientos se puede consultar [el siguiente enlace (en inglés)](https://matplotlib.org/users/pyplot_tutorial.html){:target="_blank"}. 

Quien quiera ver una pequeña referencia[en español hacer clic aquí](https://programacion.net/articulo/introduccion_a_la_libreria_matplotlib_de_python_1599]{:target="_blank"}


```python
import matplotlib.pyplot as plt
# Valores de x:
dias = list(range(0, 22, 3))
print(dias)
# valores para y:
celsius_valores = [25.6, 24.1, 26.7, 28.3, 27.5, 30.5, 32.8, 33.1]
plt.plot(dias, celsius_valores,"-or")
plt.xlabel('Dias')
plt.ylabel('Grados Celsius')
plt.show()
```

    [0, 3, 6, 9, 12, 15, 18, 21]
    


![png](./img/jupyter/output_80_1.png)


Existen dos zonas donde Matplotlib crea los gráficos:

* **figure**. Es la parte exterior, o más bien el continente donde se incluirá el gráfico. Es una instancia de *matplotlib.figure.Figure*.

* **axes**. Es donde realmente se inserta el gráfico, sería el contenido del mismo. Es una instancia de matplotlib.axes.Axes.

Por lo tanto, el primer concepto (figure) se puede asociar a **una ventana** y el concepto de "axes" se le puede **asociar a lo que es realmente el gráfico en sí**.

Con matplotlib existen dos modos de generar el gráfico: **El modo interactivo y el modo no interactivo**. Por defecto, cuando se arranca una sesión en matplotlib se entra en modo no interactivo, y para que aparezca el gráfico, se debe incluir de forma expresa la instrucción **plt.show()**.

En muchas ocasiones, lo que se desea es trabajar en modo interactivo para que el gráfico se presente de forma inmediata. La forma de conmutar entre un modo u otro es mediante las siguientes instrucciones:

*  plt.ion() . Modo interactivo on.
*  plt.ioff() . Modo interactivo off.

Para saber si se está en modo interactivo se utiliza el comando *plt.isinteractive()*.




```python
#El mismo gráfico que antes, pero de una forma más definida
plt.isinteractive()
```




    False




```python
plt.ion()
fig, ax = plt.subplots()
ax.plot(dias, celsius_valores,"-or")
ax.set_title("Evolución temperature")
ax.set_xlabel("Dias")
ax.set_ylabel("temperaturas")
```




    Text(0,0.5,'temperaturas')




![png](./img/jupyter/output_83_1.png)

<div class="descargar">
<a href="{{ site.url }}{{ site.baseurl }}/jupyter/Intro_Python.ipynb" download>Descargar fichero *.ipynb</a>
</div>