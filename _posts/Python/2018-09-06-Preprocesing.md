---
title: Pre-proceso datos
layout: post
category: [Python,Scikit-learn]
type: "normal"
tags: [Python,Datos,Preproceso,Estandarización]
author: "Francisco Rodríguez"
comments: true
---


# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción.

Existe una librería muy utilizada en trabajos de machine learning [denominada scikit-learn](http://scikit-learn.org/stable/){:target="_blank"} que contiene multitud de procedimientos para realizar estudios estadísticos de los datos. En este post comenzamos la andadura de conocer esta librería, utilizando el enfoque de transformar las datos para conseguir determinados objetivos que faciliten el objetivo perseguido.

En trabajos de  machine learning son muchas las ocasiones en las que se necesita trabajar con variables (features) que tengan una métrica similar de cara a poder realizar comparaciones fiables entre ellas.

Para poder realizar este trabajo de una forma fácil y cómoda scikit-learn proporciona una serie de procedimientos o funciones que se encargan de hacer un trabajo preparatorio de los datos antes de comenzar el correspondiente procesamiento.

Todas estas técnicas son las que de una forma resumida se presentan en está sección, con la finalidad de mostrar el lector un pequeño resumen sobre su uso, y después si se quieren ampliar conocimientos sobre determinado tema se puede acudir a la API de scikip-learn (en este caso concreto en el paquete ** sklearn.preprocessing** ) para tomar pleno conocimiento de todas las posibilidades que ofrece.

# Estandarización de los datos.

La estandarización de los datos consiste en emplear una técnica de tal manera que los datos resultantes tengan una media de cero y una desviación típica de 1. Lo más normal es que esta estandarización se realice sobre las columnas (axis=0), aunque scikit-learn presenta también la posibilidad de hacerlo sobre las filas ( axis=1).

Para conseguir este objetivo, lo que se hace es restar a todos los datos la media de los mismos y después escalarlos, para lo cual se divide el resultado anterior por la desviación típica de los datos originales.

Hay que destacar que el comportamiento anterior es el que se hace por defecto, pero scikit-learn también ofrece la posibilidad de sólo restar la media ( es decir, centrar los datos ), o sólo dividir por la desviación típica ( es decir, escalar los datos).

## Función scale.

Para realizar estos trabajos, el paquete sklearn.preprocesing ofrece la función ** scale ** que trabaja de la forma que se muestra en el siguiente ejemplo.


```python
from sklearn import preprocessing
import numpy as np
X_train = np.array([[ 1., -1.,  2.],
                    [ 2.,  0.,  0.],
                    [ 0.,  1., -1.]])

X_scaled = preprocessing.scale(X_train)
X_scaled
```




    array([[ 0.        , -1.22474487,  1.33630621],
           [ 1.22474487,  0.        , -0.26726124],
           [-1.22474487,  1.22474487, -1.06904497]])



Veamos a continuación que las columnas (features) obtenidas, tienen media cero y desviación típica 1.


```python
X_scaled.mean(axis=0)
```




    array([0., 0., 0.])




```python
X_scaled.std(axis=0)
```




    array([1., 1., 1.])



Si tan sólo queremos restar la media, se haría de la siguiente manera


```python
X_scaled = preprocessing.scale(X_train, with_std=False)
print(X_scaled, "\n")
print("Medias: ", X_scaled.mean(axis=0),"\n")
print("STD: ", X_scaled.std(axis=0))
```

    [[ 0.         -1.          1.66666667]
     [ 1.          0.         -0.33333333]
     [-1.          1.         -1.33333333]] 
    
    Medias:  [0.00000000e+00 0.00000000e+00 7.40148683e-17] 
    
    STD:  [0.81649658 0.81649658 1.24721913]
    

## Clase StandardScaler.

El paquete preprocessing igualmente tiene una clase de utilidad muy interesante para realizar este tipo de tareas. Esta clase se denomina ** StandardScaler ** que permite calcular la media y desviación típica de los datos, para posteriormente hacer transformaciones de los mismos. Veamos a continuación un pequeño ejemplo sobre su uso.  


```python
scaler = preprocessing.StandardScaler().fit(X_train)
print(scaler)
print("La media de las columnas es: ",scaler.mean_ )
print("La desviación típica de las columnas es: ", scaler.scale_,"\n" )

print("Ahora estandarizamos los datos por columnas")
scaler.transform(X_train) 
```

    StandardScaler(copy=True, with_mean=True, with_std=True)
    La media de las columnas es:  [1.         0.         0.33333333]
    La desviación típica de las columnas es:  [0.81649658 0.81649658 1.24721913] 
    
    Ahora estandarizamos los datos por columnas
    




    array([[ 0.        , -1.22474487,  1.33630621],
           [ 1.22474487,  0.        , -0.26726124],
           [-1.22474487,  1.22474487, -1.06904497]])



Si tuviéramos los datos distribuidos es datos para el entrenamiento (data_train) y para el chequeo del modelo (data_test), si tificamos los datos de entrenamiento como se ha hecho anteriormente, también habría que hacerlo para los datos de chequeo y ese trabajo se haría de la siguiente manera:  


```python
X_test = [[-1., 1., 0.]]
X_test_transform=scaler.transform(X_test)
X_test_transform
```




    array([[-2.44948974,  1.22474487, -0.26726124]])



Si una vez finalizado el proceso queremos deshacer las transformaciones que se han hecho de los datos, se haría de la siguiente manera:


```python
X_test_init=scaler.inverse_transform(X_test_transform)
X_test_init
```




    array([[-1.,  1.,  0.]])



# Escalando features dentro de un rango.

Una alternativa al proceso de estandarización que se ha visto en el apartado anterior consiste en escalar las variables dentro de un determinado rango de valores ( normalmente entre cero y uno ). Para realizar esta transformación scikit Learn ofrece dos clases sumamente practicas: **MinMaxScaler y MaxAbsScaler **.

A continuación se muestra un ejemplo con la finalidad de clarificar su utilización:


```python
X_train = np.array([[ 1., -1.,  2.],
                    [ 2.,  0.,  0.],
                    [ 0.,  1., -1.]])

min_max_scaler = preprocessing.MinMaxScaler()  #Generamos una instancia de la clase
X_train_minmax = min_max_scaler.fit_transform(X_train) #Se realiza la transformación
X_train_minmax
```




    array([[0.5       , 0.        , 1.        ],
           [1.        , 0.5       , 0.33333333],
           [0.        , 1.        , 0.        ]])



Si se tuvieran datos "train" para el entrenamiento y "test" para la evaluación del modelo, estos últimos también habría que trasformarlos, para ello se haría el siguiente proceso. 


```python
X_test = np.array([[ -3., -1.,  4.]])
X_test_minmax = min_max_scaler.transform(X_test)
X_test_minmax
```




    array([[-1.5       ,  0.        ,  1.66666667]])



Si por ejemplo quisiéramos hacer un escalado entre cero y tres, el mismo se haría con la siguiente instrucción.


```python
min_max_scaler_0_3 = preprocessing.MinMaxScaler(feature_range=(0,3))
X_train_minmax_0_3 = min_max_scaler_0_3.fit_transform(X_train) #Se realiza la transformación
X_train_minmax_0_3
```




    array([[1.5, 0. , 3. ],
           [3. , 1.5, 1. ],
           [0. , 3. , 0. ]])



Si queremos recuperar los valores originales de la la última transformación, lo haríamos de la siguiente manera.


```python
min_max_scaler_0_3.inverse_transform(X_train_minmax_0_3)
```




    array([[ 1., -1.,  2.],
           [ 2.,  0.,  0.],
           [ 0.,  1., -1.]])



# Transformaciones no lineales.

Este procedimiento consiste en otra forma diferente de transformar los datos para adaptarlos a las necesidades del procesamiento que en cada momento se necesite.

Pra hacer este tipo de transformaciones scikit learn dispone de dos clases: QuantileTransformer y quantile_transform. En ambos casos, la salida de la transformación va a seguir una distribución uniforme o normal.

En el caso de que la salida sea una distribución normal ( que es la opción por defecto ) hay que tener en cuenta que el valor de la variable va a coincidir con el percentil que indica su valor. Veamos esto con un ejemplo.


```python
from sklearn import preprocessing
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
iris = load_iris()  #Cargo el fichero con los datos
X, y = iris.data, iris.target #Cargos los datos y la respuesta ( o target)
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0) #Divido los datos en train y test
quantile_transformer = preprocessing.QuantileTransformer(random_state=0) #Genero una instancia de QuantileTransformer
X_train_trans = quantile_transformer.fit_transform(X_train) #Obtengo los datos ajustados
X_test_trans = quantile_transformer.transform(X_test)
np.percentile(X_train[:, 0], [0, 25, 50, 75, 100])  
```




    array([4.3, 5.1, 5.8, 6.5, 7.9])



** Nota** : El código anterior debe ejecutarse con al menos la versión 0.19 de scikit learn, con versión 0.18 genera error, pues no conoce las clases QuantileTransformer y quantile_transform.

Como puede verse en el código anterior, los percentiles 0, 25, 50, 75 y 100 para los valores de X_train sin transformar se encuentran en los valores 4.3, 5.1, 5.8, 6.5 y 7.9 respectivamente. 

Sin embargo si utilizamos los datos transformados, entonces los valores de la variable coincide con el percentil correspondiente. Veamos esto con el siguiente código.


```python
np.percentile(X_train_trans[:, 0], [0, 25, 50, 75, 100])
```




    array([9.99999998e-08, 2.38738739e-01, 5.09009009e-01, 7.43243243e-01,
           9.99999900e-01])



Como podemos ver el percentil cero coincide con el valor cero de la variable, el percentil 25 con el valor 0,25 de la variables...y así para el resto de los percentiles.

Vamos a confirmar además que estos valores de los percentiles aproximadamente son los mismos para los valores de test.


```python
print(np.percentile(X_test[:, 0], [0, 25, 50, 75, 100]),"\n")


np.percentile(X_test_trans[:, 0], [0, 25, 50, 75, 100])
```

    [4.4   5.125 5.75  6.175 7.3  ] 
    
    




    array([0.01351351, 0.25012513, 0.47972973, 0.6021021 , 0.94144144])



En el caso de que se quiera hacer una trasformación a datos de una normal, se haría con el siguiente código:


```python
quantile_transformer = preprocessing.QuantileTransformer(
    output_distribution='normal', random_state=0)  #Aqui se indica que se desea una salida a una normal
X_trans = quantile_transformer.fit_transform(X)
quantile_transformer.quantiles_ 
```




    array([[4.3       , 2.        , 1.        , 0.1       ],
           [4.31491491, 2.02982983, 1.01491491, 0.1       ],
           [4.32982983, 2.05965966, 1.02982983, 0.1       ],
           ...,
           [7.84034034, 4.34034034, 6.84034034, 2.5       ],
           [7.87017017, 4.37017017, 6.87017017, 2.5       ],
           [7.9       , 4.4       , 6.9       , 2.5       ]])



# Normalización.

El proceso de consiste en escalar los datos iniciales para conseguir que tengan una distribución uniforme. Este tipo de procedimientos es la base de [Vector Space Model](https://en.wikipedia.org/wiki/Vector_space_model), y es muy utilizado en clasificación de texto y en la obtención de clusters.

Se utiliza la función *normalize* para ello y se pude usar la norma l1 o la norma l2. Veamos un ejemplo.


```python
X = [[ 1., -1.,  2.],
     [ 2.,  0.,  0.],
     [ 0.,  1., -1.]]
X_normalized = preprocessing.normalize(X, norm='l2')

X_normalized   
```




    array([[ 0.40824829, -0.40824829,  0.81649658],
           [ 1.        ,  0.        ,  0.        ],
           [ 0.        ,  0.70710678, -0.70710678]])



Un proceso similar al anterior se puede conseguir utilizando la clase *Normalize* del paquete preprocessing.

# Binarización

Con este proceso se va a hacer una transformación de la variables original en otra que solo posee los valores cero o uno ( es decir una variable de Bernuilli). Como valor por defecto para discriminar y asignar un valor cero o uno se toma el valor de cero. De esta forma los valores negativos de la variable original se les transforma aun valor cero y el resto tomarán un valor de 1. Si se quiere modificar el valor de corte ( es decir el cero asignado por defecto), se utilizará el parámetro "threshold".
A continuación se pone un ejemplo sobre este tipo de transformación:


```python
X = [[ 1., -1.,  2.],
     [ 2.,  0.,  0.],
     [ 0.,  1., -1.]]

binarizer = preprocessing.Binarizer().fit(X)  # fit does nothing
print(binarizer)


binarizer.transform(X)
```

    Binarizer(copy=True, threshold=0.0)
    




    array([[1., 0., 1.],
           [1., 0., 0.],
           [0., 1., 0.]])



En el siguiente ejemplo cambiamos el valor de corte y en lugar de cero se le asigna 1.


```python
binarizer2 = preprocessing.Binarizer(threshold=1.0).fit(X)  # fit does nothing
print(binarizer2)


binarizer2.transform(X)
```

    Binarizer(copy=True, threshold=1.0)
    




    array([[0., 0., 1.],
           [1., 0., 0.],
           [0., 0., 0.]])



**Nota:** La función *binarize* facilita resultados similares, a los vistos anteriormente.

# Codificando variables alfanuméricas

En ocasiones las variables tomadas están codificadas con términos alfabéticos, por ejemplo si tomamos la variables sexo, la misma  puede venir en nuestro fichero de datos codificada con valores "V" para varones y "M" para mujeres. Estos valores deben ser convertidos a números para que sus valores puedan ser utilizados dentro de los procedimientos de machine learning empleados por scikit learning. En el siguiente apartado se muestra cómo poder conseguir esto utilizando numpy, o bien pandas.

Lo primero que hacemos es importar estas importantes librerías para trabajar con python


```python
import numpy as np
import pandas as pd
```

Después se procede a mostrar como obtener los resultados que se desean. En primer lugar se hará con scikit learn.


```python
from sklearn import preprocessing
a = np.array( ['a', 'b', 'c', 'a', 'b', 'c'])
le = preprocessing.LabelEncoder()
print(le.fit(a))
print(le.fit_transform(a),"\n")
print(le.classes_)
```

    LabelEncoder()
    [0 1 2 0 1 2] 
    
    ['a' 'b' 'c']
    

A continuación se hará con Pandas


```python
a = np.array(['a', 'b', 'c', 'a', 'b', 'c'])
a_enc = pd.factorize(a)
print("La codificación de esos valores sería la siguiente:")
print(a_enc[0])
print("Lo valores alfabéticos a los que se refieren se obtienen de la siguiene manera:")
print(a_enc[1])
```

    La codificación de esos valores sería la siguiente:
    [0 1 2 0 1 2]
    Lo valores alfabéticos a los que se refieren se obtienen de la siguiene manera:
    ['a' 'b' 'c']
    

Otra manera de codificar este tipo de variable es pasando a variables de tipo dummys, es decir que está representadas sólo por ceros o unos. Para hacer esto se utiliza la propiedad get_dummies de pandas. 


```python
a = np.array(['a', 'b', 'c', 'a', 'b', 'c'])
b = pd.get_dummies(a)
print(b) # vemos que el primer valor queda codificado como 1 0 0; el segundo como 0 1 0 etc
```

       a  b  c
    0  1  0  0
    1  0  1  0
    2  0  0  1
    3  1  0  0
    4  0  1  0
    5  0  0  1
    

Si queremos una codificación de tipo [0 1 2...] se hará de la siguiente manera:


```python
b.values.argmax(1)
```




    array([0, 1, 2, 0, 1, 2], dtype=int64)



# Codificando variables categóricas.

En el apartado anterior, ya hemos visto cómo asignar valores numéricos a variables que están codificadas con literales. En el ejemplo anterior, tratábamos valores de "V" y "M", que pasaban a tener valores 0 ó 1. Si una variable categórica tuviera mayor número de categorías entonces el número de dígitos sería también mayor.

Ahora que las variables categóricas ya están codificadas con datos numéricos, perfectamente estos valores podrían entrar a formar parte de las estrategias que utiliza scikit learn para construir los diferentes modelos, ahora bien hay que tener en cuenta que este tipo de codificación ( 1,2,3,.. por ejemplo) implica una escala de valores que en principio no tiene ningún sentido.

Entonces para evitar este tipo de problemas y asignar a todos los valores posibles de una variable categórica el mismo valor, se emplea en estadística las denominadas *variables dummy* integradas por valores de cero o uno. La estrategia es la siguiente: Se construyen tantas nuevas variables como como diferentes valores pudiera tener la variable categórica, y entonces para una determinada observación se asigna cero a todas estas nuevas variable salvo a una que se le asigna un uno y es la columna que representa la categoría que se tiene para esa determinada observación. Veamos esto con un ejemplo.

Supongamos que tenemos una variable denominada "sexo". Sería una variable categórica con valores por ejemplo 1 y 2. Como la variable sexo tiene dos categorías, se construirían dos nuevas variables, llamadas por ejemplo sexo_1 y sexo_2. Entonces la codificación en las nuevas variables se muestra en los siguientes ejemplos:


| Sexo | Sexo_1 | Sexo_2 |
|------|--------|--------|
|   1  |    1   |    0   |
|   2  |    0   |    1   |
|   2  |    0   |    1   |
|   1  |    1   |    0   |
|   1  |    1   |    0   |
|   2  |    0   |    1   |

Para realizar todo este tipo de procesamientos, el paquete preprocesing dispone de la clase *OneHotEncoder*, que de una forma fácil genera este tipo de variables dummy.

Veamos a continuación un ejemplo.


```python
from sklearn.preprocessing import OneHotEncoder
enc = OneHotEncoder()
print(np.array([[0, 0, 3], [1, 1, 0], [0, 2, 1], [1, 0, 2]]))
print("\n")
print(enc.fit([[0, 0, 3], [1, 1, 0], [0, 2, 1], [1, 0, 2]]),"\n")  


print("número de categorías para cada columna ( o feature o variable): ",enc.n_values_)  #número de categorías para cada columna ( o feature o variable)

print("índice o columna a partir del cual se coloca la codificación dummy obtenida: ",enc.feature_indices_) #índice o columna a partir del cual se coloca la codificación dummy obtenida

print("Salida para [0,1,1]--> ", enc.transform([[0, 1, 1]]).toarray())
```

    [[0 0 3]
     [1 1 0]
     [0 2 1]
     [1 0 2]]
    
    
    OneHotEncoder(categorical_features='all', dtype=<class 'numpy.float64'>,
           handle_unknown='error', n_values='auto', sparse=True) 
    
    número de categorías para cada columna ( o feature o variable):  [2 3 4]
    índice o columna a partir del cual se coloca la codificación dummy obtenida:  [0 2 5 9]
    Salida para [0,1,1]-->  [[1. 0. 0. 1. 0. 0. 1. 0. 0.]]
    

En la salida anterior, se puede ver que la columna 1 tiene dos categorías, la columna 2 tiene 3 y la columna 3,  4 categoría ( es el array de salida [2 3 4]). 

El array de salida [0 2 5 9], indica que al codificar un vector de estas características, las posiciones 0 y 1 ( recordar que en numpy los índices comienzan con cero) son para codificar el primera variable, las posiciones 2,3,4 son para la segunda variable..., etc. 

Ahora ya se puede interpretar el vector de salida [[1., 0., 0., 1., 0., 0., 1., 0., 0.]], pues las dos primeras columnas se corresponden con la codificación de la primera Variable ( 0 se codifica como 1 0), las posiciones 2, 3 y 4 son para la codificación del valor de la segunda variable ( 1 se codifica como 0 1 0 ) y el resto de posiciones son para codificar el valor de la tercera variable ( 1 se codifica como 0 1 0 0). 

## Codificando con pandas.

El paquete pandas tiene una opción también para transformar variables categóricas en variables de tipo dummy, la sentencia a utilizar sería similar a la siguiente:

*df_with_dummies = pd.get_dummies( df, columns = cols_to_transform )*

A continuación se muestra un sencillo ejemplo.


```python
import pandas as pd
df = pd.DataFrame({'A': ['a', 'b', 'a'], 'B': ['c', 'c', 'b'],
                 'C': [1, 2, 3]})
print(df,"\n")

print(pd.get_dummies(df),"\n")

print(pd.get_dummies(df,columns='A') )
```

       A  B  C
    0  a  c  1
    1  b  c  2
    2  a  b  3 
    
       C  A_a  A_b  B_b  B_c
    0  1    1    0    0    1
    1  2    0    1    0    1
    2  3    1    0    1    0 
    
       B  C  A_a  A_b
    0  c  1    1    0
    1  c  2    0    1
    2  b  3    1    0
    

# Imputando valores faltantes.

Por regla general, cuando se trabaja con un fichero de datos, siempre existen imperfecciones en los mismo de todo tipo. Un caso muy frecuente es la falta de valor en algunas observaciones, estos valores faltantes, quedan codificado en numpy como np.nan.

Esta falta de valor origina serios problemas en la construcción de modelo si previamente no se ha procedido a su imputación. Son muchos los métodos existentes en la actualidad para proceder a la imputación de los valores omitidos, y scikit learn ofrece la lases *Imputer* para corregir esta deficiencia de los datos originales.

En ejemplo que sigue se ha procedido a imputar la media para los valores faltantes. Veamos el ejemplo.


```python
import numpy as np
from sklearn.preprocessing import Imputer
imp = Imputer(missing_values='NaN', strategy='mean', axis=0)
imp.fit([[1, 2], [np.nan, 3], [7, 6]])

X = [[np.nan, 2], [6, np.nan], [7, 6]]
print(imp.transform(X))    
```

    [[4.         2.        ]
     [6.         3.66666667]
     [7.         6.        ]]
    

# Generando features tipo polinomio

En ocasiones, es necesario añadir algún tipo de complejidad al modelo, y para ello, lo que se suele hacer es calcular valores nuevos de las variables, mediante funciones polinómicas. Para facilitar esta labor, se dispone de la clase PolynomialFeatures, cuyo funcionamiento se puede observar en el siguiente ejemplo:


```python
import numpy as np
from sklearn.preprocessing import PolynomialFeatures
X = np.arange(6).reshape(3, 2)
print(X,"\n")                                                 



poly = PolynomialFeatures(2)
poly.fit_transform(X)  
```

    [[0 1]
     [2 3]
     [4 5]] 
    
    




    array([[ 1.,  0.,  1.,  0.,  0.,  1.],
           [ 1.,  2.,  3.,  4.,  6.,  9.],
           [ 1.,  4.,  5., 16., 20., 25.]])



En el anterior ejemplo, las features iniciales $(X_1,X_2)$, se transforman en $(1,X_1,X_2,X_1^2,X_1*X_2,X_2^2)$.

Si sólo se quiere trabajar con la iteración entre las features, se puede indicar con el parámetro "interaction_onlu=True". Veamos un ejemplo sobre este caso.


```python
X = np.arange(9).reshape(3, 3)
print(X,"\n")                                                

poly = PolynomialFeatures(degree=3, interaction_only=True)
poly.fit_transform(X)                             

```

    [[0 1 2]
     [3 4 5]
     [6 7 8]] 
    
    




    array([[  1.,   0.,   1.,   2.,   0.,   0.,   2.,   0.],
           [  1.,   3.,   4.,   5.,  12.,  15.,  20.,  60.],
           [  1.,   6.,   7.,   8.,  42.,  48.,  56., 336.]])



En este caso las variables $(X_1,X_2,X_3)$ se trasforman en $(1,X_1,X_2,X_3,X_1X_2,X_1X_3,X_2X_3,X_1X_2X_3)$

# Transformaciones a medida.

Por último y ya para terminar ese apartado, el paquete preprocessing, tiene la función *FunctioTransformer* que permite modificar los valores iniciales con las funciones que en cada momento puedan ser necesarias. A continuación se muestra un ejemplo sobre su uso. 


```python
import numpy as np
from sklearn.preprocessing import FunctionTransformer
transformer = FunctionTransformer(np.log1p) #Utiliza la función log1p para transformar todos los datos
X = np.array([[0, 1], [2, 3]])
transformer.transform(X)
```




    array([[0.        , 0.69314718],
           [1.09861229, 1.38629436]])



Comprobemos la transformación.


```python
print(np.log1p(X[0,0]),"\n")
print(np.log1p(X[0,1]),"\n")
print(np.log1p(X[1,0]),"\n")
print(np.log1p(X[1,1]),"\n")
```

    0.0 
    
    0.6931471805599453 
    
    1.0986122886681098 
    
    1.3862943611198906 
    
    

En el siguiente ejemplo, se muestra un ejemplo mucho más elaborado sobre la transformación de los datos con numpy y scikit learn.


```python
import matplotlib.pyplot as plt
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.decomposition import PCA
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import FunctionTransformer


def _generate_vector(shift=0.5, noise=15):
    return np.arange(1000) + (np.random.rand(1000) - shift) * noise


def generate_dataset():
    """
    This dataset is two lines with a slope ~ 1, where one has
    a y offset of ~100
    """
    return np.vstack((
        np.vstack((
            _generate_vector(),
            _generate_vector() + 100,
        )).T,
        np.vstack((
            _generate_vector(),
            _generate_vector(),
        )).T,
    )), np.hstack((np.zeros(1000), np.ones(1000)))


def all_but_first_column(X):
    return X[:, 1:]


def drop_first_component(X, y):
    """
    Create a pipeline with PCA and the column selector and use it to
    transform the dataset.
    """
    pipeline = make_pipeline(
        PCA(), FunctionTransformer(all_but_first_column),
    )
    X_train, X_test, y_train, y_test = train_test_split(X, y)
    pipeline.fit(X_train, y_train)
    return pipeline.transform(X_test), y_test


if __name__ == '__main__':
    X, y = generate_dataset()
    lw = 0
    plt.figure()
    plt.scatter(X[:, 0], X[:, 1], c=y, lw=lw)
    plt.figure()
    X_transformed, y_transformed = drop_first_component(*generate_dataset())
    plt.scatter(
        X_transformed[:, 0],
        np.zeros(len(X_transformed)),
        c=y_transformed,
        lw=lw,
        s=60
    )
    plt.show()
```


![png](./img/jupyter/2018-09-06-Preprocesing/output_66_0.png)



![png](./img/jupyter/2018-09-06-Preprocesing/output_66_1.png)

<div class="descargar">
<a href="{{ site.url }}{{ site.baseurl }}/jupyter/Pre_processing.ipynb" download>Descargar fichero *.ipynb</a>
</div>
