---
title: Introducción h2o Python
layout: post
category: [Python,H2o]
type: "normal"
tags: [h2o,python]
author: "Francisco Rodríguez"
---

# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción #

En este apartado tomamos un primer contacto con h2o para python. Previamente se ha instalado con las instrucciones que figuran en el siguiente enlace: [http://h2o-release.s3.amazonaws.com/h2o/rel-wright/2/index.html](http://h2o-release.s3.amazonaws.com/h2o/rel-wright/2/index.html).

NOTA: Si el usuario tiene instalado ANACONDA, con el mismo también se instala colorama. En mi caso concreto, la versión de colorama que se tenía no era concordante con la instalación que se estaba haciendo con las instrucciones anteriores. Lo que se hizo fue actualizar colorama desde ANACONDA y después el proceso de instalación y ejecución no generó ningún problema.



```python
import h2o
h2o.init()

```

    Checking whether there is an H2O instance running at http://localhost:54321..... not found.
    Attempting to start a local H2O server...
    ; Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode)
      Starting server from D:\python_Anaconda\lib\site-packages\h2o\backend\bin\h2o.jar
      Ice root: C:\Users\d47a001\AppData\Local\Temp\tmpck_zpaqz
      JVM stdout: C:\Users\d47a001\AppData\Local\Temp\tmpck_zpaqz\h2o_d47a001_started_from_python.out
      JVM stderr: C:\Users\d47a001\AppData\Local\Temp\tmpck_zpaqz\h2o_d47a001_started_from_python.err
      Server is running at http://127.0.0.1:54321
    Connecting to H2O server at http://127.0.0.1:54321... successful.
    


<div style="overflow:auto"><table style="width:70%"><tr><td>H2O cluster uptime:</td>
<td>07 secs</td></tr>
<tr><td>H2O cluster timezone:</td>
<td>Europe/Paris</td></tr>
<tr><td>H2O data parsing timezone:</td>
<td>UTC</td></tr>
<tr><td>H2O cluster version:</td>
<td>3.20.0.2</td></tr>
<tr><td>H2O cluster version age:</td>
<td>2 months and 27 days </td></tr>
<tr><td>H2O cluster name:</td>
<td>H2O_from_python_d47a001_3dbn5p</td></tr>
<tr><td>H2O cluster total nodes:</td>
<td>1</td></tr>
<tr><td>H2O cluster free memory:</td>
<td>1.755 Gb</td></tr>
<tr><td>H2O cluster total cores:</td>
<td>0</td></tr>
<tr><td>H2O cluster allowed cores:</td>
<td>0</td></tr>
<tr><td>H2O cluster status:</td>
<td>accepting new members, healthy</td></tr>
<tr><td>H2O connection url:</td>
<td>http://127.0.0.1:54321</td></tr>
<tr><td>H2O connection proxy:</td>
<td>None</td></tr>
<tr><td>H2O internal security:</td>
<td>False</td></tr>
<tr><td>H2O API Extensions:</td>
<td>Algos, AutoML, Core V3, Core V4</td></tr>
<tr><td>Python version:</td>
<td>3.6.0 final</td></tr></table></div>

<br>
Si ahora, en un navegador en el campo de direcciones, se escribe http://127.0.0.1:54321 entonces se tiene acceso a una pantalla con funciones muy interesantes para poder trabajar con H2O.

La interface que se muestra en esta dirección se denomina *Flow*. En esta interface se puede ver, entre otras muchas otras cosas, las siguientes:

* Datos que se han descargado vía un cliente ( en nuestro caso será el "data" que se mostrará más adelante).
* Descargar datos directamente.
* Ver modelos creados desde un cliente.
* Crear nuevos modelos.
* Ver predicciones que se han creado desde un cliente.
* Ejecutar predicciones directamente desde la interface



Con las instrucciones anteriores lo que se ha hecho es abrir una conexión con h2o y las características de la conexión son las que figuran en el bloque anterior.

A continuación lo que se hace es leer un fichero ( en este caso el tan utilizado en machine learning: Iris ) y se muestra el inicio del mismo y la clase de datos que se han obtenido.


```python
datasets = "https://raw.githubusercontent.com/DarrenCook/h2o/bk/datasets/"
data = h2o.import_file(datasets + "iris_wheader.csv")
print(type(data))
data.head
```

    Parse progress: |█████████████████████████████████████████████████████████| 100%
    <class 'h2o.frame.H2OFrame'>
    


<table>
<thead>
<tr><th style="text-align: right;">  sepal_len</th><th style="text-align: right;">  sepal_wid</th><th style="text-align: right;">  petal_len</th><th style="text-align: right;">  petal_wid</th><th>class      </th></tr>
</thead>
<tbody>
<tr><td style="text-align: right;">        5.1</td><td style="text-align: right;">        3.5</td><td style="text-align: right;">        1.4</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.9</td><td style="text-align: right;">        3  </td><td style="text-align: right;">        1.4</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.7</td><td style="text-align: right;">        3.2</td><td style="text-align: right;">        1.3</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.6</td><td style="text-align: right;">        3.1</td><td style="text-align: right;">        1.5</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        5  </td><td style="text-align: right;">        3.6</td><td style="text-align: right;">        1.4</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        5.4</td><td style="text-align: right;">        3.9</td><td style="text-align: right;">        1.7</td><td style="text-align: right;">        0.4</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.6</td><td style="text-align: right;">        3.4</td><td style="text-align: right;">        1.4</td><td style="text-align: right;">        0.3</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        5  </td><td style="text-align: right;">        3.4</td><td style="text-align: right;">        1.5</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.4</td><td style="text-align: right;">        2.9</td><td style="text-align: right;">        1.4</td><td style="text-align: right;">        0.2</td><td>Iris-setosa</td></tr>
<tr><td style="text-align: right;">        4.9</td><td style="text-align: right;">        3.1</td><td style="text-align: right;">        1.5</td><td style="text-align: right;">        0.1</td><td>Iris-setosa</td></tr>
</tbody>
</table>





    <bound method H2OFrame.head of >


<a name="Construccion-del-modelo."></a>
# Construcción del modelo.

A continuación lo que se hace es dividir entre las variables predictoras ( *features* ) y la que se va a predecir ( *target* ).


```python
y = "class" #Variable target
x = data.names
print(x)
x.remove(y) #Me quedo solo con el nombre de  las features
print(x)
```

    ['sepal_len', 'sepal_wid', 'petal_len', 'petal_wid', 'class']
    ['sepal_len', 'sepal_wid', 'petal_len', 'petal_wid']
    

Separo en conjuntos de tipo train test los datos con los que se va a trabajar


```python
train, test = data.split_frame([0.8]) 
```

Obtengo los resultados:


```python
m = h2o.estimators.deeplearning.H2ODeepLearningEstimator()
m.train(x, y, train)
p = m.predict(test)
```

    deeplearning Model Build progress: |██████████████████████████████████████| 100%
    deeplearning prediction progress: |███████████████████████████████████████| 100%
    
<a name="Detalles-del-modelo."></a>
# Detalles del modelo.

Una vez construido el modelo, se pueden ver detalles interesantes, sin más que imprimir el mismo. Esto se puede ver claro ejecutando el siguiente comendo:


```python
print(m)
```

    Model Details
    =============
    H2ODeepLearningEstimator :  Deep Learning
    Model Key:  DeepLearning_model_python_1536730197870_1
    
    
    ModelMetricsMultinomial: deeplearning
    ** Reported on train data. **
    
    MSE: 0.013232843359628944
    RMSE: 0.11503409650894357
    LogLoss: 0.0450005383127653
    Mean Per-Class Error: 0.015151515151515152
    Confusion Matrix: Row labels: Actual class; Column labels: Predicted class
    
    


<div style="overflow:auto"><table style="width:70%"><tr><td><b>Iris-setosa</b></td>
<td><b>Iris-versicolor</b></td>
<td><b>Iris-virginica</b></td>
<td><b>Error</b></td>
<td><b>Rate</b></td></tr>
<tr><td>36.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0 / 36</td></tr>
<tr><td>0.0</td>
<td>42.0</td>
<td>2.0</td>
<td>0.0454545</td>
<td>2 / 44</td></tr>
<tr><td>0.0</td>
<td>0.0</td>
<td>30.0</td>
<td>0.0</td>
<td>0 / 30</td></tr>
<tr><td>36.0</td>
<td>42.0</td>
<td>32.0</td>
<td>0.0181818</td>
<td>2 / 110</td></tr></table></div>


    Top-3 Hit Ratios: 
    


<div style="overflow:auto"><table style="width:50%"><tr><td><b>k</b></td>
<td><b>hit_ratio</b></td></tr>
<tr><td>1</td>
<td>0.9818182</td></tr>
<tr><td>2</td>
<td>1.0</td></tr>
<tr><td>3</td>
<td>1.0</td></tr></table></div>


    Scoring History: 
    


<div style="overflow:auto"><table style="width:100%"><tr><td><b></b></td>
<td><b>timestamp</b></td>
<td><b>duration</b></td>
<td><b>training_speed</b></td>
<td><b>epochs</b></td>
<td><b>iterations</b></td>
<td><b>samples</b></td>
<td><b>training_rmse</b></td>
<td><b>training_logloss</b></td>
<td><b>training_r2</b></td>
<td><b>training_classification_error</b></td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.000 sec</td>
<td>None</td>
<td>0.0</td>
<td>0</td>
<td>0.0</td>
<td>nan</td>
<td>nan</td>
<td>nan</td>
<td>nan</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.343 sec</td>
<td>635 obs/sec</td>
<td>1.0</td>
<td>1</td>
<td>110.0</td>
<td>0.3219722</td>
<td>0.3286570</td>
<td>0.8263622</td>
<td>0.1454545</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:51</td>
<td> 0.593 sec</td>
<td>2600 obs/sec</td>
<td>10.0</td>
<td>10</td>
<td>1100.0</td>
<td>0.1150341</td>
<td>0.0450005</td>
<td>0.9778354</td>
<td>0.0181818</td></tr></table></div>


    Variable Importances: 
    


<div style="overflow:auto"><table style="width:80%"><tr><td><b>variable</b></td>
<td><b>relative_importance</b></td>
<td><b>scaled_importance</b></td>
<td><b>percentage</b></td></tr>
<tr><td>petal_wid</td>
<td>1.0</td>
<td>1.0</td>
<td>0.2641978</td></tr>
<tr><td>petal_len</td>
<td>0.9526816</td>
<td>0.9526816</td>
<td>0.2516964</td></tr>
<tr><td>sepal_wid</td>
<td>0.9173351</td>
<td>0.9173351</td>
<td>0.2423579</td></tr>
<tr><td>sepal_len</td>
<td>0.9150264</td>
<td>0.9150264</td>
<td>0.2417479</td></tr></table></div>


    
    

En lugar de obtener toda la información del modelo, se podría obtener algún dato concreto del mismo tal y como se muestra a continuación.


```python
print(m.mse)
```

    Model Details
    =============
    H2ODeepLearningEstimator :  Deep Learning
    Model Key:  DeepLearning_model_python_1536730197870_1
    
    
    ModelMetricsMultinomial: deeplearning
    ** Reported on train data. **
    
    MSE: 0.013232843359628944
    RMSE: 0.11503409650894357
    LogLoss: 0.0450005383127653
    Mean Per-Class Error: 0.015151515151515152
    Confusion Matrix: Row labels: Actual class; Column labels: Predicted class
    
    


<div style="overflow:auto"><table style="width:80%"><tr><td><b>Iris-setosa</b></td>
<td><b>Iris-versicolor</b></td>
<td><b>Iris-virginica</b></td>
<td><b>Error</b></td>
<td><b>Rate</b></td></tr>
<tr><td>36.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0 / 36</td></tr>
<tr><td>0.0</td>
<td>42.0</td>
<td>2.0</td>
<td>0.0454545</td>
<td>2 / 44</td></tr>
<tr><td>0.0</td>
<td>0.0</td>
<td>30.0</td>
<td>0.0</td>
<td>0 / 30</td></tr>
<tr><td>36.0</td>
<td>42.0</td>
<td>32.0</td>
<td>0.0181818</td>
<td>2 / 110</td></tr></table></div>


    Top-3 Hit Ratios: 
    


<div style="overflow:auto"><table style="width:100%"><tr><td><b>k</b></td>
<td><b>hit_ratio</b></td></tr>
<tr><td>1</td>
<td>0.9818182</td></tr>
<tr><td>2</td>
<td>1.0</td></tr>
<tr><td>3</td>
<td>1.0</td></tr></table></div>


    Scoring History: 
    


<div style="overflow:auto"><table style="width:90%"><tr><td><b></b></td>
<td><b>timestamp</b></td>
<td><b>duration</b></td>
<td><b>training_speed</b></td>
<td><b>epochs</b></td>
<td><b>iterations</b></td>
<td><b>samples</b></td>
<td><b>training_rmse</b></td>
<td><b>training_logloss</b></td>
<td><b>training_r2</b></td>
<td><b>training_classification_error</b></td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.000 sec</td>
<td>None</td>
<td>0.0</td>
<td>0</td>
<td>0.0</td>
<td>nan</td>
<td>nan</td>
<td>nan</td>
<td>nan</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.343 sec</td>
<td>635 obs/sec</td>
<td>1.0</td>
<td>1</td>
<td>110.0</td>
<td>0.3219722</td>
<td>0.3286570</td>
<td>0.8263622</td>
<td>0.1454545</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:51</td>
<td> 0.593 sec</td>
<td>2600 obs/sec</td>
<td>10.0</td>
<td>10</td>
<td>1100.0</td>
<td>0.1150341</td>
<td>0.0450005</td>
<td>0.9778354</td>
<td>0.0181818</td></tr></table></div>


    Variable Importances: 
    


<div style="overflow:auto"><table style="width:90%"><tr><td><b>variable</b></td>
<td><b>relative_importance</b></td>
<td><b>scaled_importance</b></td>
<td><b>percentage</b></td></tr>
<tr><td>petal_wid</td>
<td>1.0</td>
<td>1.0</td>
<td>0.2641978</td></tr>
<tr><td>petal_len</td>
<td>0.9526816</td>
<td>0.9526816</td>
<td>0.2516964</td></tr>
<tr><td>sepal_wid</td>
<td>0.9173351</td>
<td>0.9173351</td>
<td>0.2423579</td></tr>
<tr><td>sepal_len</td>
<td>0.9150264</td>
<td>0.9150264</td>
<td>0.2417479</td></tr></table></div>


    <bound method ModelBase.mse of >
    

Para las predicciones calcula para cada elemento del conjunto test, la probabilidad de que pertenezca a cada una de las clases "clasificadoras", y entonces asigna esa observación a la clase que tiene mayor probabilidad.

En el siguiente ejemplo se puede ver esto.


```python
print(p)
```


<table>
<thead>
<tr><th>predict    </th><th style="text-align: right;">  Iris-setosa</th><th style="text-align: right;">  Iris-versicolor</th><th style="text-align: right;">  Iris-virginica</th></tr>
</thead>
<tbody>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999664</td><td style="text-align: right;">      0.000335718</td><td style="text-align: right;">     6.21933e-18</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999645</td><td style="text-align: right;">      0.000355221</td><td style="text-align: right;">     8.8088e-17 </td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999218</td><td style="text-align: right;">      0.000781611</td><td style="text-align: right;">     1.40786e-17</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.99982 </td><td style="text-align: right;">      0.0001797  </td><td style="text-align: right;">     4.97882e-17</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999815</td><td style="text-align: right;">      0.000185221</td><td style="text-align: right;">     1.7065e-17 </td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.996649</td><td style="text-align: right;">      0.00335132 </td><td style="text-align: right;">     9.72906e-17</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.998671</td><td style="text-align: right;">      0.00132894 </td><td style="text-align: right;">     1.75318e-15</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999405</td><td style="text-align: right;">      0.000595341</td><td style="text-align: right;">     1.24659e-17</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999234</td><td style="text-align: right;">      0.000765667</td><td style="text-align: right;">     1.22268e-17</td></tr>
<tr><td>Iris-setosa</td><td style="text-align: right;">     0.999769</td><td style="text-align: right;">      0.000231469</td><td style="text-align: right;">     1.66583e-17</td></tr>
</tbody>
</table>


    
    


```python
import numpy as np


print(type(p['predict']))
print(type(test['class']))

print((p['predict']).describe)
print((test['class']).describe)

#Junto la predicción y los valores reales en una tabla
resultados=(p['predict']).cbind(test['class'])
print(resultados)
```

    <class 'h2o.frame.H2OFrame'>
    <class 'h2o.frame.H2OFrame'>
    


<table>
<thead>
<tr><th>predict    </th></tr>
</thead>
<tbody>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
</tbody>
</table>


    <bound method H2OFrame.describe of >
    


<table>
<thead>
<tr><th>class      </th></tr>
</thead>
<tbody>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td></tr>
</tbody>
</table>


    <bound method H2OFrame.describe of >
    


<table>
<thead>
<tr><th>predict    </th><th>class      </th></tr>
</thead>
<tbody>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
<tr><td>Iris-setosa</td><td>Iris-setosa</td></tr>
</tbody>
</table>


    
    

La matriz de confusión se puede obtener de la siguiente manera:


```python
m.confusion_matrix
```

    Model Details
    =============
    H2ODeepLearningEstimator :  Deep Learning
    Model Key:  DeepLearning_model_python_1536730197870_1
    
    
    ModelMetricsMultinomial: deeplearning
    ** Reported on train data. **
    
    MSE: 0.013232843359628944
    RMSE: 0.11503409650894357
    LogLoss: 0.0450005383127653
    Mean Per-Class Error: 0.015151515151515152
    Confusion Matrix: Row labels: Actual class; Column labels: Predicted class
    
    


<div style="overflow:auto"><table style="width:80%"><tr><td><b>Iris-setosa</b></td>
<td><b>Iris-versicolor</b></td>
<td><b>Iris-virginica</b></td>
<td><b>Error</b></td>
<td><b>Rate</b></td></tr>
<tr><td>36.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0 / 36</td></tr>
<tr><td>0.0</td>
<td>42.0</td>
<td>2.0</td>
<td>0.0454545</td>
<td>2 / 44</td></tr>
<tr><td>0.0</td>
<td>0.0</td>
<td>30.0</td>
<td>0.0</td>
<td>0 / 30</td></tr>
<tr><td>36.0</td>
<td>42.0</td>
<td>32.0</td>
<td>0.0181818</td>
<td>2 / 110</td></tr></table></div>


    Top-3 Hit Ratios: 
    


<div style="overflow:auto"><table style="width:50%"><tr><td><b>k</b></td>
<td><b>hit_ratio</b></td></tr>
<tr><td>1</td>
<td>0.9818182</td></tr>
<tr><td>2</td>
<td>1.0</td></tr>
<tr><td>3</td>
<td>1.0</td></tr></table></div>


    Scoring History: 
    


<div style="overflow:auto"><table style="width:100%"><tr><td><b></b></td>
<td><b>timestamp</b></td>
<td><b>duration</b></td>
<td><b>training_speed</b></td>
<td><b>epochs</b></td>
<td><b>iterations</b></td>
<td><b>samples</b></td>
<td><b>training_rmse</b></td>
<td><b>training_logloss</b></td>
<td><b>training_r2</b></td>
<td><b>training_classification_error</b></td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.000 sec</td>
<td>None</td>
<td>0.0</td>
<td>0</td>
<td>0.0</td>
<td>nan</td>
<td>nan</td>
<td>nan</td>
<td>nan</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:50</td>
<td> 0.343 sec</td>
<td>635 obs/sec</td>
<td>1.0</td>
<td>1</td>
<td>110.0</td>
<td>0.3219722</td>
<td>0.3286570</td>
<td>0.8263622</td>
<td>0.1454545</td></tr>
<tr><td></td>
<td>2018-09-12 07:38:51</td>
<td> 0.593 sec</td>
<td>2600 obs/sec</td>
<td>10.0</td>
<td>10</td>
<td>1100.0</td>
<td>0.1150341</td>
<td>0.0450005</td>
<td>0.9778354</td>
<td>0.0181818</td></tr></table></div>


    Variable Importances: 
    


<div style="overflow:auto"><table style="width:90%"><tr><td><b>variable</b></td>
<td><b>relative_importance</b></td>
<td><b>scaled_importance</b></td>
<td><b>percentage</b></td></tr>
<tr><td>petal_wid</td>
<td>1.0</td>
<td>1.0</td>
<td>0.2641978</td></tr>
<tr><td>petal_len</td>
<td>0.9526816</td>
<td>0.9526816</td>
<td>0.2516964</td></tr>
<tr><td>sepal_wid</td>
<td>0.9173351</td>
<td>0.9173351</td>
<td>0.2423579</td></tr>
<tr><td>sepal_len</td>
<td>0.9150264</td>
<td>0.9150264</td>
<td>0.2417479</td></tr></table></div>





    <bound method H2OMultinomialModel.confusion_matrix of >




```python
 
p["predict"].cbind(test["class"]).as_data_frame()

```




<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>predict</th>
      <th>class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Iris-setosa</td>
      <td>Iris-setosa</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Iris-versicolor</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Iris-versicolor</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Iris-virginica</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Iris-versicolor</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Iris-versicolor</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Iris-versicolor</td>
      <td>Iris-versicolor</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>21</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>24</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>25</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>26</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>27</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Iris-versicolor</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>34</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>35</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>36</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>37</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>38</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
    <tr>
      <th>39</th>
      <td>Iris-virginica</td>
      <td>Iris-virginica</td>
    </tr>
  </tbody>
</table>
</div>



Cuando se tiene pandas instalado, como es este el caso, entre otras cosas se podría mirar el porcentaje de clasificaciones correctas. Se haría de la siguiente manera.


```python
(p["predict"] == test["class"]).mean()
```




    [0.95]


<a name="Perfomance-versus-prediction."></a>
# Perfomance versus prediction.

En los apartados anteriores se ha construido un modelo y posteriormente se ha hecho una predicción con la siguiente instrucción:

*p = m.predict(test)*

Además del método anterior, se puede usar la propiedad *perfomance* para estudiar la fiabilidad que nos ofrece el modelo construido:


```python
m.model_performance(test)
```

    
    ModelMetricsMultinomial: deeplearning
    ** Reported on test data. **
    
    MSE: 0.02661973313625441
    RMSE: 0.16315554889814324
    LogLoss: 0.07791377355567655
    Mean Per-Class Error: 0.07222222222222223
    Confusion Matrix: Row labels: Actual class; Column labels: Predicted class
    
    


<div style="overflow:auto"><table style="width:80%"><tr><td><b>Iris-setosa</b></td>
<td><b>Iris-versicolor</b></td>
<td><b>Iris-virginica</b></td>
<td><b>Error</b></td>
<td><b>Rate</b></td></tr>
<tr><td>14.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0.0</td>
<td>0 / 14</td></tr>
<tr><td>0.0</td>
<td>5.0</td>
<td>1.0</td>
<td>0.1666667</td>
<td>1 / 6</td></tr>
<tr><td>0.0</td>
<td>1.0</td>
<td>19.0</td>
<td>0.05</td>
<td>1 / 20</td></tr>
<tr><td>14.0</td>
<td>6.0</td>
<td>20.0</td>
<td>0.05</td>
<td>2 / 40</td></tr></table></div>


    Top-3 Hit Ratios: 
    


<div style="overflow:auto"><table style="width:50%"><tr><td><b>k</b></td>
<td><b>hit_ratio</b></td></tr>
<tr><td>1</td>
<td>0.95</td></tr>
<tr><td>2</td>
<td>1.0</td></tr>
<tr><td>3</td>
<td>1.0</td></tr></table></div>

