---
title: Web scraping con Python
layout: post
category: [Python]
type: "normal"
tags: [python,web-scraping]
author: "Francisco Rodríguez"
comments: true
---
# Contenido
{:.no_toc}

* TOC
{:toc}

# Introducción

En un [post anterior](https://bigdatafran.github.io/big_data//WebScrapingR){:target="blnk"} ya se ha hecho la introducción del significado de **web scraping** y se han dado ciertas pautas a seguir para hacer ese trabajo con R. En el presente, voy a seguir con ese tema, pero abordándolo desde el punto de vista de Python. Para ello se parte de la idea de que el lector a ha leído y sabe los conceptos principales de *web scraping* al menos los contenidos en el post indicado anteriormente.

Para poder hacer web scraping con python se necesitan importar ciertas librerías enfocadas y especializadas en esta materia. 

Por ese motivo a continuación se importan las librerías necesarias que en mi  caso concreto no ha sido necesario instalar nada, pues ya estaban instaladas.


```python
import urllib3
from bs4 import BeautifulSoup
```


```python
url='https://www.bde.es/bde/es/'
http = urllib3.PoolManager()
banco = http.request('GET', url)

# Otra alternativa puede ser la siguiente
#import requests 
#import html5lib
#r = requests.get(url)
#print(r.content)
```

    D:\programas\Anaconda\lib\site-packages\urllib3\connectionpool.py:858: InsecureRequestWarning: Unverified HTTPS request is being made. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings
      InsecureRequestWarning)
    


```python
print("El estado de la página es: \n")
print(banco.status )
print("\n El contenido de la página es: \n")
print(banco.data)
```

    El estado de la página es: 
    
    200
    
     El contenido de la página es: 
    
    b'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">\r\n<head>\r\n\t<meta http-equiv="X-UA-Compatible" content="IE=edge" />\r\n\t<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />\r\n\t\r\n\t\t\t\t<meta id="metaViewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.5" />\r\n\t\t\t  \r\n\t<link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/estilos.css" /><!--[if IE 8]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE_ie8.css" /><![endif]--><!--[if IE 7]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE_ie7.css" /><![endif]--><!--[if IE 7]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/estilos-7.css" /><![endif]--><!--[if IE 6]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/estilos-6.css" /><![endif]--><link media="PRINT" type="text/css" rel="stylesheet" href="/f/webbde/css/imprimir.css" /><link media="SCREEN" type="text/css" rel="stylesheet" href="/f/webbde/css/jquery-ui.css" /><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE-commons.css" /><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE-queries.css" /><script src="/f/webbde/js/cookie.js" type="text/javascript"> </script><script src="/f/webbde/js/cookievalidate.js" type="text/javascript"> </script><script src="/f/webbde/INF/assets/js/jquery.min.js" type="text/javascript"> </script><script src="/f/webbde/js/jquery-ui.js" type="text/javascript"> </script><script src="/f/webbde/js/comun.js" type="text/javascript"> </script><script src="/f/webbde/js/objetoXML.js" type="text/javascript"> </script><script src="/f/webbde/js/calendario.js" type="text/javascript"> </script><script src="/f/webbde/js/swfobject.js" type="text/javascript"> </script><script src="/f/webbde/INF/assets/js/aviso_cookies.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/literal.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/toggleversion.js" type="text/javascript"> </script><script src="/f/webbde/js/responsiveBdE-commons.js" type="text/javascript"> </script><script src="/f/webbde/js/Avisleg.js" type="text/javascript"> </script><script src="/f/webbde/js/libs/jquery.touchSwipe.min.js" type="text/javascript"> </script><script src="/f/webbde/js/libs/media.match.min.js" type="text/javascript"> </script><script src="/f/webbde/js/libs/enquire.min.js" type="text/javascript"> </script><script src="/f/webbde/js/responsiveBdE.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/ultoselect.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/table.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/combo.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/menu.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/swipe.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/mapas.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/migas.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/utils.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/organigrama.js" type="text/javascript"> </script><script src="/f/webbde/js/utils/pagination.js" type="text/javascript"> </script><script src="/f/webbde/INF/assets/js/trk_bde.js" type="text/javascript"> </script><link rel="shortcut icon" type="image/x-icon" href="/f/webbde/sistema/Assets/favicon/favicon.ico" /><link rel="apple-touch-icon-precomposed" href="/f/webbde/sistema/Assets/img/apple-touch-icon-152x152.png" /><meta 

    (... Sigue más código recortado)
    

# Estudio del contenido de la página

Una vez configurado y definida la página web que queremos estudiar, se pueden emplear la posibilidades y herramientas que nos ofrece el paquete BeautifulSoup y que podemos encontrar [en esta dirección](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#searching-by-css-class){:target="_blank"}. 

El primer ejemplo que vamos a exponer es entresacar todo el contenido de la página web, para ello primero definimos la variable "soup", que va a ser una instancia de la clase BeautifulSoup y sobre la cual se pueden aplicar todos los métodos que se pueden ver en el enlace mostrado anteriormente. 


```python
soup = BeautifulSoup(banco.data,"html.parser")
print(soup.prettify())
```

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="es" xml:lang="es" xmlns="http://www.w3.org/1999/xhtml">
     <head>
      <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
      <meta content="text/html;charset=utf-8" http-equiv="Content-Type"/>
      <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.5" id="metaViewport" name="viewport"/>
      <link href="/f/webbde/css/estilos.css" media="ALL" rel="stylesheet" type="text/css"/>
      <!--[if IE 8]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE_ie8.css" /><![endif]-->
      <!--[if IE 7]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/responsiveBdE_ie7.css" /><![endif]-->
      <!--[if IE 7]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/estilos-7.css" /><![endif]-->
      <!--[if IE 6]><link media="ALL" type="text/css" rel="stylesheet" href="/f/webbde/css/estilos-6.css" /><![endif]-->
      <link href="/f/webbde/css/imprimir.css" media="PRINT" rel="stylesheet" type="text/css"/>
      <link href="/f/webbde/css/jquery-ui.css" media="SCREEN" rel="stylesheet" type="text/css"/>
      <link href="/f/webbde/css/responsiveBdE-commons.css" media="ALL" rel="stylesheet" type="text/css"/>
      <link href="/f/webbde/css/responsiveBdE-queries.css" media="ALL" rel="stylesheet" type="text/css"/>
      <script src="/f/webbde/js/cookie.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/cookievalidate.js" type="text/javascript">
      </script>
      <script src="/f/webbde/INF/assets/js/jquery.min.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/jquery-ui.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/comun.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/objetoXML.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/calendario.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/swfobject.js" type="text/javascript">
      </script>
      <script src="/f/webbde/INF/assets/js/aviso_cookies.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/utils/literal.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/utils/toggleversion.js" type="text/javascript">
      </script>
      <script src="/f/webbde/js/responsiveBdE-commons.js" type="text/javascript">
      </script>
      

      (... Sigue más código recortado)
    

# Obtención de información genérica

Veamos a continuación cómo poder sacar cierta información de la página


```python
print("\n Sacamos el título de la página\n")
print(soup.title)
print("\n Sacamos título sin las etiquetas \n")
print(soup.title.string)
print("\n Si queremos sacar el primer enlace: \n")
print(soup.a)
print("\n Todos los enlaces sería así: \n")
print(soup.findAll('a'))
```

    
     Sacamos el título de la página
    
    <title>Banco de España</title>
    
     Sacamos título sin las etiquetas 
    
    Banco de España
    
     Si queremos sacar el primer enlace: 
    
    <a href="/bde/en/" hreflang="en">English</a>
    
     Todos los enlaces sería así: 
    
    [<a href="/bde/en/" hreflang="en">English</a>, <a href="/bde/ca/" hreflang="ca">
    <abbr lang="ca" title="Català">CA</abbr>
    </a>, <a href="/bde/eu/" hreflang="eu">
    <abbr lang="eu" title="Euskara">EU</abbr>
    </a>, <a href="/bde/ga/" hreflang="gl">
    <abbr lang="gl" title="Galego">GA</abbr>
    </a>, <a href="/bde/va/" hreflang="ca-valencia">
    <abbr lang="ca-valencia" title="Valencià">VA</abbr>
    </a>, <a class="youtube" href="http://www.youtube.com/user/bdeeuro" target="_blank" title="Youtube">
    <span class="offset">Youtube</span>
    </a>, <a class="hrss" href="/bde/es/utiles/Canal_RSS/" target="_self" title="RSS">
    <span class="offset">RSS</span>
    </a>, <a class="flickr" href="https://www.flickr.com/photos/bde_fotos/albums" target="_blank" title="Flickr">
    <span class="offset">Flickr</span>
    </a>, <a class="correo" href="/bde/es/Home/Newsletters/Suscripciones/" target="_self" title="Suscripción">
    <span class="offset">Suscripción</span>
    </a>, <a class="linkedin" href="https://www.linkedin.com/company/banco-de-espana" target="_blank" title="LinkedIn">
    <span class="offset">LinkedIn</span>
    </a>, <a class="twitter" href="https://twitter.com/BancoDeEspana" target="_blank" title="Twitter">
    <span class="offset">Twitter</span>
    </a>, <a href="/bde/es/secciones/sobreelbanco/">Sobre el Banco</a>, <a href="/bde/es/secciones/eurosistema/">Eurosistema </a>, <a href="/bde/es/secciones/mus/">MUS</a>, <a href="/bde/es/secciones/servicios/">Servicios</a>, <a href="/bde/es/secciones/convocatorias/">Empleo y becas</a>, <a href="/bde/es/secciones/normativas/">Normativa</a>, <a href="/bde/es/secciones/informes/">Publicaciones</a>, <a href="/bde/es/secciones/prensa/">Sala de prensa</a>, <a href="http://www.youtube.com/watch?v=_K30Kh45lPw&amp;list=PLtVu6os2ZMWiM8Rdjcr1OiONuyxFS_dZA&amp;feature=player_detailpage" target="_blank">Bienvenido al Banco de España<img alt="Abre en nueva ventana" class="icono ext" src="/f/Sistema/Icons/exturlicon.gif"/></a>, <a href="/bde/es/secciones/sobreelbanco/funcion/Funciones.html">El Banco de España es el banco central nacional, miembro del Eurosistema</a>, <a href="/bde/es/secciones/mus/">El Banco de España, en el marco del MUS, es el supervisor del sistema bancario español</a>, <a href="http://sedeelectronica.bde.es/sede/es/" target="_blank">Realice sus trámites con el Banco de España a través de la Oficina Virtual<img alt="Abre en nueva ventana" class="icono ext" src="/f/Sistema/Icons/exturlicon.gif"/></a>, <a href="https://youtu.be/qqFxmjBxwF4" target="_blank">Restauración de las fachadas de la sede central del Banco de España<img alt="Abre en nueva ventana" class="icono ext" src="/f/Sistema/Icons/exturlicon.gif"/></a>, <a href="/bde/es/areas/analisis-economi/analisis-economi/proyecciones-mac/Proyecciones_macroeconomicas.html">Últimas proyecciones macroeconómicas</a>, <a href="/bde/es/secciones/prensa/Agenda/Presentacion_de_a0438ad942ec561.html">Descubre los nuevos billetes de 100€ y 200€</a>, <a href="/bde/es/areas/analisis-economi/">Análisis e investigación</a>, <a href="/bde/es/areas/billemone/">Billetes y monedas </a>, <a href="/bde/es/areas/cenbal/">Central de Balances </a>, <a href="/bde/es/areas/mercadeuda/">Deuda pública</a>, <a href="/bde/es/areas/estabilidad/">Estabilidad financiera</a>, <a href="/bde/es/areas/estadis/">Estadísticas</a>, <a href="/bde/es/areas/polimone/">Política monetaria </a>, <a href="/bde/es/areas/sispago/">Sistemas de pago </a>, <a href="/bde/es/areas/supervision/">Supervisión </a>, <a href="/bde/es/secciones/sobreelbanco/Transparencia/">Portal de Transparencia</a>, <a href="https://sedeelectronica.bde.es" target="_blank" title="Abre en nueva ventana">Oficina Virtual</a>, <a href="https://clientebancario.bde.es/pcb/es/" target="_blank" title="Abre en nueva ventana">Portal del Cliente Bancario</a>, <a href="https://www.bde.es/investigador/en/" target="_blank" title="Abre en nueva ventana">Economic Research Portal</a>, <a href="http://www.cemfi.es" target="_blank" title="Abre en nueva ventana"><acronym title="Centro de Estudios Monetarios y Financieros" xml:lang="es">CEMFI</acronym></a>, <a href="http://portaleducativo.bde.es" target="_blank" title="Abre en nueva ventana">Portal Educativo</a>, <a href="http://www.finanzasparatodos.es" target="_blank" title="Abre en nueva ventana">Finanzas para todos</a>, <a 

    (... Sigue más código recortado)
    

Uno de los elementos más comunes en las páginas web es la etiqueta "<table>", para elegirlas se deberá utilizar la instrucción "soup.find_all('table')". Para ver un ejemplo concreto sobre su uso, vamos a tomar la página web del la bolsa de Madrid, ya que el ejemplo con el que se ha trabajado anteriormente, no tiene ninguna etiqueta de este tipo.


```python
import requests 
import html5lib
url2="http://www.bolsamadrid.es/esp/aspx/Mercados/Precios.aspx?indice=ESI100000000"
r = requests.get(url2)

soup2 = BeautifulSoup(r.content, 'html.parser') 
todas_tablas=soup2.find_all('table')
print(todas_tablas)
```

    [<table align="center" cellpadding="0" cellspacing="0"><tr class="noimpr">
    <td colspan="6" id="CabeceraArr">
    <div id="Idiomas"><ul><li class="mclick"><a href="/?id=ing" target="_self"> English </a></li></ul></div>
    <div id="MenuSup"><ul><li class="mclick"><a href="http://www.bolsasymercados.es/esp/Accionistas-Inversores" target="_blank"> Accionistas e Inversores BME </a></li><li class="mclick"><a href="/esp/BMadrid/Contacto.aspx" target="_self"> Contacto </a></li><li class="mclick"><a href="/esp/Inversores/Agenda/HorarioMercado.aspx" target="_self"> Horario Mercado </a></li><li class="mclick"><a href="/esp/aspx/Inversores/Agenda/Calendario.aspx" target="_self"> Calendario bursátil </a></li><li class="mclick"><a href="/esp/RSS.aspx" target="_self"> RSS   <img align="absmiddle" alt="RSS" border="0" src="/images/IconoRSS.png"/> </a></li></ul></div>
    </td>
    </tr><tr valign="top">
    <td class="BaseIzq noimpr" rowspan="3"><div></div></td>
    <td class="BaseSep noimpr" rowspan="3"></td>
    <td class="BaseMenu" id="CabeceraLogo"><a href="/?id=esp"><img alt="Bolsa de Madrid" border="0" src="/images/Base/LogoBMadrid.gif"/></a></td>
    <td class="noimpr" id="Cabecera">
    <div id="LogoBME"><a href="http://www.bolsasymercados.es/" target="_blank"><img alt="Bolsas y Mercados Españoles" border="0" height="45" src="/images/Base/LogoBMEBlanco.png" width="118"/></a></div>
    <div class="finFila"></div>
    <div id="TopMensajes">
    <table align="left" cellpadding="0" cellspacing="0" height="27" width="650"><tr>
    <td style="margin: 0 0 0 40px; vertical-align: middle;"><div><a></a></div></td>
    </tr></table>
    </div>
    <div id="BuscadorCab">
    <div>Buscador de<br/>empresas</div>
    <form action="/esp/aspx/Empresas/BusqEmpresas.aspx" id="formBusq" method="get">
    <input autocomplete="off" name="busq" type="text" value="nombre / ISIN / ticker"/>
    <div id="divBusq" style="display: none;"></div>
    <span class="BtnGris mclick"><a href="javascript:document.forms.formBusq.submitbusq();"><span class="BtnBuscarDcha" title="Buscar"></span></a></span>
    </form>
    </div>
    <div id="LineaBuscadorCab"></div>
    </td>
    <td class="BaseSep noimpr" rowspan="3"></td>
    <td class="BaseDcha noimpr" rowspan="3"><div></div></td>
    </tr><tr>
    <td colspan="2" id="SeparacionCap"><div class="noimpr"></div>
    <div class="seg"><a href="/?id=esp" target="_self">Inicio</a> / <a href="#" target="_self">MERCADOS Y COTIZACIONES</a> / <a href="/esp/aspx/Mercados/Precios.aspx?indice=ESI100000000" target="_self">Acciones</a> / <span class="segUlt">Precios de la sesión &gt;</span></div>
    </td>
    </tr><tr valign="top">
    <td class="BaseMenu noimpr">
    <script src="/js/MenuIzq.js" type="text/javascript"></script>
    <div class="MenuIzq noimpr" id="MenuIzq">
    <div class="MenuGrupo Azul">
    <div class="Menu1 MenuDiv Azul Off" menu="m1"><div class="MenuLink MenuConOp Off"><a href="#" target="_self">SOBRE NOSOTROS</a></div></div>
    <div class="Menu2 MenuSubOp" menu="m1">
    <div class="Menu2 MenuDiv Off" menu="m2"><div class="MenuLink Off"><a href="/esp/BMadrid/BMadrid.aspx" target="_self">Bolsa de Madrid</a></div></div>
    <div class="Menu2 MenuDiv Off" menu="m3"><div class="MenuLink Off"><a href="/docs/BMadrid/docsSubidos/Historia_Bolsa_ Española.pdf" target="_blank">Historia del Palacio</a></div></div>
    <div class="Menu2 MenuDiv Off" menu="m4"><div class="MenuLink MenuConOp Off"><a href="#" target="_self">El Palacio de la Bolsa</a></div></div>
    <div class="Menu3 MenuSubOp" menu="m4">
    <div class="Menu3 MenuDiv Off" menu="m5"><div class="MenuLink Off"><a href="http://www.125palaciobolsa.es" target="_blank">Historia del Palacio</a></div></div>
   
   (... Sigue más código recortado)

    </table>]
    

Con el código anterior se obtendrán todos los elementos que tienen la etiqueta <table>, que como puede verse son bastantes. Si queremos entresacar uno determinado, tendríamos que utilizar la herramienta DevTools que ya [se ha presentado en el post anterior]( https://bigdatafran.github.io/big_data//WebScrapingR ){:target="_blank"}, para ver cómo se identifica a esa tabla en el código HTML que define la página. En este caso concreto, la identificación se hace mediante el parámetro *id="ctl00_Contenido_tblAcciones"* como se puede apreciar en la siguiente figura

![tabla](./img/jupyter/2018-09-19-WebScrapingPython/fig1.PNG)

Para seleccionar esa tabla concreta se hará con el siguiente código:


```python
print(soup2.title)
tabla_concreta=soup2.select('#ctl00_Contenido_tblAcciones')


print(tabla_concreta)
```

    <title>
    	Bolsa de Madrid - Precios de la sesión
    </title>
    [<table cellpadding="3" cellspacing="0" class="TblPort" id="ctl00_Contenido_tblAcciones" width="100%">
    <tr align="center">
    <th scope="col">Nombre</th><th scope="col">Últ.</th><th scope="col">% Dif.</th><th scope="col">Máx.</th><th scope="col">Mín.</th><th scope="col">Volumen</th><th scope="col">Efectivo (miles €)</th><th scope="col">Fecha</th><th class="Ult" scope="col">Hora</th>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0125220311">ACCIONA</a></td><td>75,0400</td><td class="DifClSb">0,62</td><td>75,0800</td><td>74,4400</td><td>40.986</td><td>3.062,00</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:53</td>
    </tr><tr align="right">
    <td align="left" class="DifFlBj"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0132105018">ACERINOX</a></td><td>9,8080</td><td class="DifClBj">-0,61</td><td>9,9260</td><td>9,7860</td><td>444.679</td><td>4.378,54</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0167050915">ACS</a></td><td>33,1200</td><td class="DifClSb">0,03</td><td>33,7900</td><td>32,9000</td><td>119.468</td><td>3.992,14</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlBj"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0105046009">AENA</a></td><td>140,5500</td><td class="DifClBj">-0,43</td><td>141,6000</td><td>139,5000</td><td>75.049</td><td>10.576,59</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlBj"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0109067019">AMADEUS</a></td><td>71,0800</td><td class="DifClBj">-0,14</td><td>71,6600</td><td>70,2000</td><td>902.134</td><td>64.276,20</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=LU1598757687">ARCELORMIT.</a></td><td>22,1550</td><td class="DifClSb">0,70</td><td>22,6000</td><td>21,3900</td><td>303.026</td><td>6.704,81</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:53</td>
    </tr><tr align="right">
    <td align="left" class="DifFlIg"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0113860A34">BA.SABADELL</a></td><td>1,1650</td><td class="DifClIg">0,00</td><td>1,1765</td><td>1,1540</td><td>6.238.629</td><td>7.288,99</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:52</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0113900J37">BA.SANTANDER</a></td><td>4,2315</td><td class="DifClSb">0,87</td><td>4,2795</td><td>4,2000</td><td>13.158.955</td><td>55.901,32</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0113307062">BANKIA</a></td><td>2,7870</td><td class="DifClSb">0,29</td><td>2,8180</td><td>2,7750</td><td>1.848.204</td><td>5.169,89</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:52</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0113679I37">BANKINTER</a></td><td>7,3280</td><td class="DifClSb">1,16</td><td>7,4120</td><td>7,2360</td><td>628.289</td><td>4.609,98</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    <td align="left" class="DifFlSb"><a href="/esp/aspx/Empresas/FichaValor.aspx?ISIN=ES0113211835">BBVA</a></td><td>4,9760</td><td class="DifClSb">1,86</td><td>4,9890</td><td>4,8845</td><td>8.630.326</td><td>42.707,54</td><td align="center">01/11/2018</td><td align="center" class="Ult">13:54</td>
    </tr><tr align="right">
    
    (... Sigue más código recortado)

    </table>]
    

Podremos generar un dataframe del paquete Pandas de una forma bien fácil partiendo de una tabla del documento HTML con el que estemos trabajando. La manera de hacerlo es la siguiente: 


```python
import pandas as pd
dfs1 = pd.read_html(url2, attrs={'id': 'ctl00_Contenido_tblAcciones'},header=0)
dfs1
```




    [          Nombre     Últ.  % Dif.     Máx.     Mín.     Volumen  \
     0        ACCIONA   752000      83   752000   744400      41.248   
     1       ACERINOX    97920     -77    99260    97860     458.710   
     2            ACS   331400       9   337900   329000     124.273   
     3           AENA  1406000     -39  1416000  1395000      75.329   
     4        AMADEUS   711600      -3   716600   702000     910.399   
     5    ARCELORMIT.   221600      73   226000   213900     313.947   
     6    BA.SABADELL    11715      56    11765    11540   6.399.396   
     7   BA.SANTANDER    42440     117    42795    42000  13.574.582   
     8         BANKIA    28000      76    28180    27750   1.887.313   
     9      BANKINTER    73500     146    74120    72360     654.411   
     10          BBVA    49925     220    49940    48845   8.948.503   
     11     CAIXABANK    35340      66    35500    34850   7.146.727   
     12       CELLNEX   218300     -82   220700   216900     122.075   
     13  CIE AUTOMOT.   231000    -128   238000   230000     171.623   
     14           DIA     7112     669     7154     6604   7.338.589   
     15        ENAGAS   234600       9   236500   233200     238.589   
     16        ENDESA   185500      38   186000   184200     306.401   
     17     FERROVIAL   176000     -56   177150   175050     949.924   
     18  GRIFOLS CL.A   254100      87   255100   250500     127.301   
     19           IAG    69260     155    70680    67840     722.462   
     20     IBERDROLA    63260     112    63440    62320   2.877.510   
     21       INDITEX   254600     213   254600   249400   6.559.894   
     22       INDRA A    87200     -17    88500    86700     103.333   
     23  INM.COLONIAL    88900      17    89400    88450     217.253   
     24        MAPFRE    26460       8    26560    26220     926.418   
     25      MEDIASET    61040     153    61540    59620     318.450   
     26  MELIA HOTELS    91050      28    91650    90400     131.530   
     27        MERLIN   110500     -27   111350   110000     204.480   
     28       NATURGY   217100      -5   218500   216500     316.543   
     29        R.E.C.   183850      46   185200   182400     192.257   
     30        REPSOL   155450    -177   158250   154150   2.512.687   
     31  SIEMENS GAME   100850     299   101950    97720   1.026.743   
     32  TEC.REUNIDAS   232800    -198   238900   232300      95.193   
     33    TELEFONICA    73610     170    74100    72380  14.885.931   
     34      VISCOFAN   543500     294   544000   528000      65.528   
     
         Efectivo (miles €)       Fecha   Hora  
     0              3.08169  01/11/2018  14:00  
     1              4.51599  01/11/2018  14:10  
     2              4.15131  01/11/2018  14:10  
     3             10.61595  01/11/2018  14:07  
     4             64.86317  01/11/2018  14:10  
     5              6.94652  01/11/2018  14:07  
     6              7.47688  01/11/2018  14:10  
     7             57.66200  01/11/2018  14:10  
     8              5.27918  01/11/2018  14:10  
     9              4.80163  01/11/2018  14:10  
     10            44.29321  01/11/2018  14:10  
     11            25.14060  01/11/2018  14:10  
     12             2.67518  01/11/2018  14:10  
     13             4.02868  01/11/2018  14:10  
     14             5.08304  01/11/2018  14:08  
     15             5.60416  01/11/2018  14:10  
     16             5.67432  01/11/2018  14:10  
     17            16.69820  01/11/2018  14:09  
     18             3.22112  01/11/2018  14:10  
     19             5.04609  01/11/2018  14:10  
     20            18.14760  01/11/2018  14:10  
     21           164.75458  01/11/2018  14:10  
     22         90540.00000  01/11/2018  14:07  
     23             1.93152  01/11/2018  14:06  
     24             2.44841  01/11/2018  14:08  
     25             1.94634  01/11/2018  14:06  
     26             1.19826  01/11/2018  14:06  
     27             2.26200  01/11/2018  14:06  
     28             6.88756  01/11/2018  14:07  
     29             3.53884  01/11/2018  14:10  
     30            38.97472  01/11/2018  14:10  
     31            10.31022  01/11/2018  14:10  
     32             2.24301  01/11/2018  14:06  
     33           108.84724  01/11/2018  14:10  
     34             3.53328  01/11/2018  14:04  ]



# Análisis de Texto (NLTK)

La librería NLTK ( Natural Language Toolkit ) está especializada en el estudio de textos. Este tipo de librerías son muy útiles para poder estudiar contenidos de textos, por ejemplo ver frecuencias de palabras, estudio de los sentimientos, etc. Este post no está centrado en este tema y por lo tanto no se va a profundizar sobre esta materia, sin embargo sí se va a utilizar, para poner un ejemplo de cómo haciendo web scraping podríamos analizar un determinado texto de la web. Para hacer este ejemplo me voy a basar en unos de los textos que mi hijo tiene escritos en la red, en concreto el que figura en la dirección que se incluye en el siguiente ejemplo.  


```python
url3="https://www.libremercado.com/2018-09-19/asi-es-como-podemos-quiere-acabar-con-sus-ahorros-1276624987/"
r2 = requests.get(url3)

soup3 = BeautifulSoup(r2.content, 'html.parser') 
doc=soup3.select(".principal p")
# doc en una lista
#Definimos variable donde se acumula el textp
texto=""
for t in doc:
    texto=texto+" "+t.get_text()
#Con lo anterior hemos conseguido quitar los tag de html y tener solo el texto   
print(texto)

```

     La fijación de Podemos con los mercados financieros no conoce límites. Y no es de extrañar. Son los que ponen números a sus cuentos de hadas en forma de programas políticos (lean). Les arruinan la fiesta. La impresión masiva de dinero y el control político sobre la oferta monetaria han sido sonados fracasos allá donde se han implantado. Venezuela no es el único ejemplo reciente, también está ocurriendo en Argentina, Turquía, y un largo etcétera. Pero no importa. Cualquier cosa, incluso la miseria, con tal de mantener el poder. El sistema financiero es el corazón de la economía. Gracias a la interacción entre prestatarios y prestamistas, los proyectos de inversión rentables consiguen financiación, y con ellos se impulsa el empleo y la prosperidad. El principio económico básico y universalmente aceptado es sencillo: el ahorro se canaliza, a través del sistema financiero, hacia proyectos con capacidad de crecimiento y repago futuro. O, lo que es lo mismo, para que haya inversión tiene que haber ahorro previo. Los últimos movimientos de Podemos, como no puede ser de otra manera, van justo en dirección opuesta. Poner más impuestos a la banca, que reducirán los ahorros depositados en ella, y penalizar o eliminar los productos de inversión más atractivos. Concretamente, hay dos figuras en la diana de los dirigentes del partido morado: las sicav y las socimi.De ambas dicen que son reductos para que los ricos no paguen impuestos y que son responsables de desequilibrios económicos, como las subidas del alquiler. Sobre ambas mienten, veamos por qué. Una sicav es una sociedad de inversión colectiva de capital variable. Es decir, un vehículo financiero que permite canalizar los ahorros de muchos pequeños inversores para llevar a cabo operaciones en los mercados financieros. Gracias a las sicav usted puede comprar acciones de empresas no cotizadas, operar con complejos instrumentos financieros y un largo etcétera que no podría hacer de otra forma. Son empresas -tienen personalidad jurídica propia- y cotizan al 1% por Impuesto de Sociedades. Cuando usted decida retirar su dinero de la sicav, Hacienda le retendrá generosamente entre el 21 y el 27% por impuesto sobre beneficios y dividendos. Exactamente igual que en la mayoría de activos financieros. En definitiva, estamos ante un vehículo capaz de hacer posible el crecimiento económico vía incremento de la productividad. Precisamente, lo que tanto alardean los mismos que quieren eliminarlo. Las sicav es uno de los mecanismos alternativos de inversión no bancaria que tanto aparecen en los manuales de crecimiento económico. Y la propuesta de los intervencionistas de Podemos es cargárselo. Alegan que no pagan impuestos y que los pequeños inversores –conocidos coloquialmente como mariachis– son meras marionetas frente al gestor o responsable, que suele ser el que más capital aporta. Sin embargo, los impuestos los paga como cualquier empresa del país. Cuando una sicav invierte en una empresa que paga el impuesto de Sociedades, indirectamente está pagando dicho impuesto. Y así con todos los productos financieros que tiene a su disposición. La sicav recibe dividendos o ganancias financieras por las que ya se ha tributado.Y, aún así, se le grava un 1% y otro 27% cuando el inversor saca el dinero. Tampoco es cierto que las sicav sean un subterfugio para que los ricos evadan impuestos. En primer lugar, porque no son "para los ricos". En el primer trimestre de 2018, la CNMV reportó 2.783 sicav en España, que gestionan 30.700 millones de euros. Según Inverco, las instituciones de inversión colectiva –sicav y fondos de inversión– han pasado de representar el 6,6% del volumen de activos ahorrados por las familias españolas a casi el 15%. Y las sicav han sido el vehículo preferido, con un crecimiento del 14,5%. En Europa, las sicav son instrumentos de lo más habituales. Países como Luxemburgo, Malta y Andorra son líderes en gestión de activos vía sicav por tener regulaciones más flexibles. Incluso los sindicatos en un país hiperregulado como Francia apuestan por ellas para canalizar el ahorro del trabajo. La ignorancia vuela, pero los capitales también. Las sicav han desaparecido del País Vasco y Navarra tras las reformas de sus sistemas tributarios forales. Como resultado, ya hay fondos de inversión diseñados a medida para fortunas individuales y entidades especializadas en crear sociedades de este estilo en el extranjero. Por su parte, las Sociedades Cotizadas de Inversión en el Mercado Inmobiliario (socimi) son compañías orientadas al mercado del alquiler de vivienda, una inmobiliaria destinada principalmente al alquiler. Por ley, como mínimo el 80% de su activo tiene que estar depositado en inmuebles con esta finalidad. Otro rasgo fundamental de estos productos es su elevada transparencia.Tienen que estar cotizando en mercados regulados. Actualmente, hay 59 socimis cotizando en el MAB -Mercado Alternativo Bursátil- y 4 cotizando en el mercado continuo. Gracias a este ejercicio de transparencia, podemos desmontar uno de los mitos con los que Podemos pretende engañarle. En 2017, el valor de mercado de los activos en manos de las socimi que cotizaban en el MAB fue de 12.221 millones de euros. De ellos, menos del 20% eran inversiones en vivienda u oficinas. Y, de ellas, un 50% estaban localizadas en Madrid. O, lo que es lo mismo, la inversión en vivienda en Madrid por parte de las socimi es de 1.200 millones de euros. Teniendo en cuenta el precio medio del metro cuadrado en Madrid y la superficie media de las viviendas en la capital, estamos hablando de unas 3.500 viviendas en propiedad por parte de las socimi. Esto, sobre las 622.000 viviendas en alquiler que hay en la capital, apenas representa el 0,56% del parque inmobiliario. Es fácil deducir, con los datos en la mano, la capacidad que tienen estos vehículos financieros para manipular los precios…. ¡Nula! Lo que sí va a ocurrir si las gravan o las prohíben es que la oferta de viviendas en alquiler se reducirá aún más. Y, con ella, seguirán subiendo los precios. Tampoco es cierto que las socimis no tributen. Por ley, tienen que repartir dividendo sobre el 80% de los beneficios obtenidos por rentas de alquiler, el 50% de las ganancias por ventas de activos y el 100% de lo obtenidos de otras Socimi o Reit. Dichos dividendos son gravados al 25% en el impuesto de Sociedades si el receptor es otra empresa. En el caso de personas físicas aplica el gravamen del 19-23%, como los fondos de inversión, depósitos, etc. Adicionalmente, si un inversor no tiene el 5% de la socimi o el dividendo no tributa a un mínimo del 10%, a la propia entidad se la carga el 19% por impuesto de Sociedades. Todo lo anterior, sin tener en cuenta los impuestos indirectos, ya que los inmuebles y empresas en los que invierten tributan por impuestos municipales, autonómicos y locales que pagan religiosamente las socimi. Así pues, aplicar un impuesto de Sociedades a mayores de lo anterior es una doble tributación de manual. El intento de saqueo a ambos productos de inversión es evidente. Ya han logrado que la rentabilidad de los depósitos financieros, renta fija y demás productos sin riesgo sea nula o incluso negativa. Ahora, pretenden echar del país los pocos productos financieros que aún son atractivos para el inversor, incluso para el inversor familiar. Mientras la inversión en sicav de las familias españolas crece a doble dígito desde hace varios años, las entidades que permanecen establecidas en España languidecen lentamente desde 2015. Ya van casi 4.000 millones de euros menos en activos gestionados. Seguir poniendo en jaque la seguridad jurídica y la credibilidad de las instituciones que las gestionan va en contra de los ciudadanos. Si usted está de acuerdo con los dirigentes de Podemos en que las sicav y las socimi son un chollo para el inversor, le invito a que vaya a su entidad bancaria habitual e invierta en ellas. Verá que están sujetas a fluctuaciones de mercado, impuestos y todo tipo de trabas, como cualquier otro producto que tenga que ver con generar rentabilidad para sus ahorros. En Francia, el borrador de Ley de Presupuestos para 2018 prevé reducir el tipo sobre dividendos al 12,8%. Estados Unidos y Reino Unido también están disminuyendo los tipos de tributación a este tipo de sociedades y al ahorro en general. En España, por el contrario, el debate está en si gravarlos hasta echarlos del país o, directamente, prohibirlos. Aquí tenemos el "cambio" para Podemos: consiste en que sus ahorros pasen de estar generando rentabilidad a estar en manos de las arcas públicas para uso y disfrute de sus gobernantes. Daniel Rodríguez es consultor estratégico de multinacionales, autor del blog economistadecabecera.es y miembro del Comité de Dirección del Club de los Viernes.
    

Ahora procederemos a hacer un estudio muy somero del texto, gracias a las funcionalidades que ofrece el paquete NLTK (Natural Language Toolkit)


```python
nltk.download
```




    <bound method Downloader.download of <nltk.downloader.Downloader object at 0x0000026312503B38>>




```python
import nltk
nltk.download('punkt')
from nltk.tokenize import sent_tokenize, word_tokenize
#Entresacamos todas las palabras del texto
palabras=word_tokenize(texto)

print(palabras[:50])
```

    [nltk_data] Downloading package punkt to
    [nltk_data]     C:\Users\Francisco\AppData\Roaming\nltk_data...
    [nltk_data]   Package punkt is already up-to-date!
    ['La', 'fijación', 'de', 'Podemos', 'con', 'los', 'mercados', 'financieros', 'no', 'conoce', 'límites', '.', 'Y', 'no', 'es', 'de', 'extrañar', '.', 'Son', 'los', 'que', 'ponen', 'números', 'a', 'sus', 'cuentos', 'de', 'hadas', 'en', 'forma', 'de', 'programas', 'políticos', '(', 'lean', ')', '.', 'Les', 'arruinan', 'la', 'fiesta', '.', 'La', 'impresión', 'masiva', 'de', 'dinero', 'y', 'el', 'control']
    


```python
#Pasamos todas las palabras a minúsculas
palabras_minusculas=[w.lower() for w in palabras]
from nltk.probability import FreqDist
frecuencia=FreqDist(palabras_minusculas)

for word, frequency in frecuencia.most_common(50):
    print(u'{}--{}'.format(word, frequency))
```

    de--96
    ,--79
    .--76
    en--55
    que--48
    el--48
    los--39
    y--39
    la--31
    las--31
    a--21
    es--20
    %--20
    del--19
    por--17
    para--15
    sicav--15
    no--14
    con--13
    un--13
    son--12
    inversión--12
    o--10
    lo--10
    como--10
    financieros--8
    impuestos--8
    sociedades--8
    socimi--8
    podemos--7
    se--7
    al--7
    impuesto--7
    sobre--6
    han--6
    más--6
    productos--6
    alquiler--6
    una--6
    su--6
    activos--6
    sus--5
    país--5
    ya--5
    inversor--5
    mercado--5
    si--5
    está--4
    incluso--4
    ahorro--4
    

Los **stopwords** son palabras de uso muy frecuente en determinado lenguaje, y que normalmente no aportan información relevante que ayude a enfocar el contenido del escrito. Por ese motivo normalmente lo que se hace es suprimirlas del contenido del escrito que se esté estudiando a fin de dar más claridad al enfoque del texto estudiado. A continuación se muestra cómo trabajar con este tipo de palabras en python 


```python
nltk.download('stopwords')
#suprimimos los stopwords
from nltk.corpus import stopwords
stopWords = stopwords.words('spanish')
#Añadimos palabras stopwords, porque aparecian en recuento
newStopWords = [',','.','%']
stopWords.extend(newStopWords)
print(stopWords)

```

    [nltk_data] Downloading package stopwords to
    [nltk_data]     C:\Users\Francisco\AppData\Roaming\nltk_data...
    [nltk_data]   Package stopwords is already up-to-date!
    ['de', 'la', 'que', 'el', 'en', 'y', 'a', 'los', 'del', 'se', 'las', 'por', 'un', 'para', 'con', 'no', 'una', 'su', 'al', 'lo', 'como', 'más', 'pero', 'sus', 'le', 'ya', 'o', 'este', 'sí', 'porque', 'esta', 'entre', 'cuando', 'muy', 'sin', 'sobre', 'también', 'me', 'hasta', 'hay', 'donde', 'quien', 'desde', 'todo', 'nos', 'durante', 'todos', 'uno', 'les', 'ni', 'contra', 'otros', 'ese', 'eso', 'ante', 'ellos', 'e', 'esto', 'mí', 'antes', 'algunos', 'qué', 'unos', 'yo', 'otro', 'otras', 'otra', 'él', 'tanto', 'esa', 'estos', 'mucho', 'quienes', 'nada', 'muchos', 'cual', 'poco', 'ella', 'estar', 'estas', 'algunas', 'algo', 'nosotros', 'mi', 'mis', 'tú', 'te', 'ti', 'tu', 'tus', 'ellas', 'nosotras', 'vosostros', 'vosostras', 'os', 'mío', 'mía', 'míos', 'mías', 'tuyo', 'tuya', 'tuyos', 'tuyas', 'suyo', 'suya', 'suyos', 'suyas', 'nuestro', 'nuestra', 'nuestros', 'nuestras', 'vuestro', 'vuestra', 'vuestros', 'vuestras', 'esos', 'esas', 'estoy', 'estás', 'está', 'estamos', 'estáis', 'están', 'esté', 'estés', 'estemos', 'estéis', 'estén', 'estaré', 'estarás', 'estará', 'estaremos', 'estaréis', 'estarán', 'estaría', 'estarías', 'estaríamos', 'estaríais', 'estarían', 'estaba', 'estabas', 'estábamos', 'estabais', 'estaban', 'estuve', 'estuviste', 'estuvo', 'estuvimos', 'estuvisteis', 'estuvieron', 'estuviera', 'estuvieras', 'estuviéramos', 'estuvierais', 'estuvieran', 'estuviese', 'estuvieses', 'estuviésemos', 'estuvieseis', 'estuviesen', 'estando', 'estado', 'estada', 'estados', 'estadas', 'estad', 'he', 'has', 'ha', 'hemos', 'habéis', 'han', 'haya', 'hayas', 'hayamos', 'hayáis', 'hayan', 'habré', 'habrás', 'habrá', 'habremos', 'habréis', 'habrán', 'habría', 'habrías', 'habríamos', 'habríais', 'habrían', 'había', 'habías', 'habíamos', 'habíais', 'habían', 'hube', 'hubiste', 'hubo', 'hubimos', 'hubisteis', 'hubieron', 'hubiera', 'hubieras', 'hubiéramos', 'hubierais', 'hubieran', 'hubiese', 'hubieses', 'hubiésemos', 'hubieseis', 'hubiesen', 'habiendo', 'habido', 'habida', 'habidos', 'habidas', 'soy', 'eres', 'es', 'somos', 'sois', 'son', 'sea', 'seas', 'seamos', 'seáis', 'sean', 'seré', 'serás', 'será', 'seremos', 'seréis', 'serán', 'sería', 'serías', 'seríamos', 'seríais', 'serían', 'era', 'eras', 'éramos', 'erais', 'eran', 'fui', 'fuiste', 'fue', 'fuimos', 'fuisteis', 'fueron', 'fuera', 'fueras', 'fuéramos', 'fuerais', 'fueran', 'fuese', 'fueses', 'fuésemos', 'fueseis', 'fuesen', 'sintiendo', 'sentido', 'sentida', 'sentidos', 'sentidas', 'siente', 'sentid', 'tengo', 'tienes', 'tiene', 'tenemos', 'tenéis', 'tienen', 'tenga', 'tengas', 'tengamos', 'tengáis', 'tengan', 'tendré', 'tendrás', 'tendrá', 'tendremos', 'tendréis', 'tendrán', 'tendría', 'tendrías', 'tendríamos', 'tendríais', 'tendrían', 'tenía', 'tenías', 'teníamos', 'teníais', 'tenían', 'tuve', 'tuviste', 'tuvo', 'tuvimos', 'tuvisteis', 'tuvieron', 'tuviera', 'tuvieras', 'tuviéramos', 'tuvierais', 'tuvieran', 'tuviese', 'tuvieses', 'tuviésemos', 'tuvieseis', 'tuviesen', 'teniendo', 'tenido', 'tenida', 'tenidos', 'tenidas', 'tened', ',', '.', '%']
    


```python
wordsFiltered = []
 
for w in palabras_minusculas:
    if w not in stopWords:
        wordsFiltered.append(w)
frecuencia=FreqDist(wordsFiltered)
print("\n Palabras más usuales del texto \n")
for word, frequency in frecuencia.most_common(50):
    print(u'{}--{}'.format(word, frequency))        

```

    
     Palabras más usuales del texto 
    
    sicav--15
    inversión--12
    financieros--8
    impuestos--8
    sociedades--8
    socimi--8
    podemos--7
    impuesto--7
    productos--6
    alquiler--6
    activos--6
    país--5
    inversor--5
    mercado--5
    si--5
    incluso--4
    ahorro--4
    crecimiento--4
    ahorros--4
    capital--4
    dividendos--4
    millones--4
    euros--4
    viviendas--4
    mercados--3
    dinero--3
    cualquier--3
    financiero--3
    gracias--3
    económico--3
    :--3
    ricos--3
    vehículo--3
    usted--3
    empresas--3
    empresa--3
    así--3
    aún--3
    españa--3
    fondos--3
    parte--3
    vivienda--3
    ley--3
    cotizando--3
    madrid--3
    rentabilidad--3
    tipo--3
    forma--2
    (--2
    )--2
    


```python
import matplotlib.pyplot as plt
plt.figure(figsize=(15,10))
frecuencia.plot(10,cumulative=True)
```


![png](./img/jupyter/2018-09-19-WebScrapingPython/output_26_0.png)


# Clase collections

Para terminar con este post, a continuación y de una forma sucinta, se muestra cómo poder conseguir también este recuento de palabras de un texto, pero utilizando la clase "collections".


```python
from collections import Counter
a=texto.split()
counts = Counter(a)
print(counts)
```

    Counter({'de': 95, 'que': 48, 'en': 47, 'el': 45, 'los': 38, 'y': 33, 'las': 29, 'la': 27, 'a': 21, 'del': 19, 'es': 18, 'no': 14, 'para': 14, 'sicav': 14, 'por': 14, 'con': 13, 'un': 13, 'inversión': 10, 'son': 10, 'lo': 9, 'como': 9, 'En': 8, 'se': 7, 'impuestos': 7, 'o': 7, 'al': 7, 'han': 6, 'productos': 6, 'su': 6, 'activos': 6, 'financieros': 5, 'sus': 5, 'sobre': 5, 'más': 5, 'una': 5, 'impuesto': 5, 'La': 4, 'Podemos': 4, 'Y': 4, 'está': 4, 'ahorro': 4, 'crecimiento': 4, 'tiene': 4, 'hay': 4, 'millones': 4, 'estar': 4, 'socimi': 4, 'viviendas': 4, 'si': 4, 'mercados': 3, 'incluso': 3, 'El': 3, 'Gracias': 3, 'otra': 3, 'ahorros': 3, 'vehículo': 3, 'usted': 3, 'empresas': 3, 'le': 3, 'dividendos': 3, 'ya': 3, 'aún': 3, 'inversor': 3, 'euros.': 3, 'fondos': 3, 'país': 3, 'este': 3, 'Por': 3, 'Sociedades': 3, 'mercado': 3, 'alquiler': 3, 'cotizando': 3, 'rentabilidad': 3, 'tipo': 3, 'Son': 2, 'dinero': 2, 'oferta': 2, 'sido': 2, 'también': 2, 'largo': 2, 'sistema': 2, 'financiero': 2, 'entre': 2, 'proyectos': 2, 'económico': 2, 'capacidad': 2, 'O,': 2, 'mismo,': 2, 'puede': 2, 'ser': 2, 'van': 2, 'ella,': 2, 'dirigentes': 2, 'ambas': 2, 'ricos': 2, 'alquiler.': 2, 'colectiva': 2, 'capital': 2, 'Es': 2, 'canalizar': 2, 'pequeños': 2, 'inversores': 2, 'financieros.': 2, 'instrumentos': 2, 'hacer': 2, 'jurídica': 2, '1%': 2, 'Sociedades.': 2, 'Cuando': 2, '27%': 2, 'beneficios': 2, 'estamos': 2, 'vía': 2, 'tanto': 2, 'Las': 2, 'uno': 2, 'bancaria': 2, 'pagan': 2, 'paga': 2, 'cualquier': 2, 'empresa': 2, 'ganancias': 2, 'otro': 2, 'Tampoco': 2, 'cierto': 2, 'primer': 2, 'España,': 2, 'gestionan': 2, 'instituciones': 2, 'familias': 2, 'españolas': 2, 'casi': 2, 'tener': 2, 'entidades': 2, 'sociedades': 2, 'ley,': 2, 'mínimo': 2, '80%': 2, 'inmuebles': 2, 'estos': 2, 'socimis': 2, 'MAB': 2, 'manos': 2, 'menos': 2, 'vivienda': 2, 'Y,': 2, '50%': 2, 'Madrid': 2, 'parte': 2, 'cuenta': 2, 'capital,': 2, 'socimi.': 2, 'tienen': 2, 'va': 2, 'dividendo': 2, 'obtenidos': 2, 'entidad': 2, 'sin': 2, 'doble': 2, 'tributación': 2, 'Ya': 2, 'inversor,': 2, 'desde': 2, 'están': 2, 'fijación': 1, 'conoce': 1, 'límites.': 1, 'extrañar.': 1, 'ponen': 1, 'números': 1, 'cuentos': 1, 'hadas': 1, 'forma': 1, 'programas': 1, 'políticos': 1, '(lean).': 1, 'Les': 1, 'arruinan': 1, 'fiesta.': 1, 'impresión': 1, 'masiva': 1, 'control': 1, 'político': 1, 'monetaria': 1, 'sonados': 1, 'fracasos': 1, 'allá': 1, 'donde': 1, 'implantado.': 1, 'Venezuela': 1, 'único': 1, 'ejemplo': 1, 'reciente,': 1, 'ocurriendo': 1, 'Argentina,': 1, 'Turquía,': 1, 'etcétera.': 1, 'Pero': 1, 'importa.': 1, 'Cualquier': 1, 'cosa,': 1, 'miseria,': 1, 'tal': 1, 'mantener': 1, 'poder.': 1, 'corazón': 1, 'economía.': 1, 'interacción': 1, 'prestatarios': 1, 'prestamistas,': 1, 'rentables': 1, 'consiguen': 1, 'financiación,': 1, 'ellos': 1, 'impulsa': 1, 'empleo': 1, 'prosperidad.': 1, 'principio': 1, 'básico': 1, 'universalmente': 1, 'aceptado': 1, 'sencillo:': 1, 'canaliza,': 1, 'través': 1, 'financiero,': 1, 'hacia': 1, 'repago': 1, 'futuro.': 1, 'haya': 1, 'haber': 1, 'previo.': 1, 'Los': 1, 'últimos': 1, 'movimientos': 1, 'Podemos,': 1, 'manera,': 1, 'justo': 1, 'dirección': 1, 'opuesta.': 1, 'Poner': 1, 'banca,': 1, 'reducirán': 1, 'depositados': 1, 'penalizar': 1, 'eliminar': 1, 'atractivos.': 1, 'Concretamente,': 1, 'dos': 1, 'figuras': 1, 'diana': 1, 'partido': 1, 'morado:': 1, 'socimi.De': 1, 'dicen': 1, 'reductos': 1, 'paguen': 1, 'responsables': 1, 'desequilibrios': 1, 'económicos,': 1, 'subidas': 1, 'Sobre': 1, 'mienten,': 1, 'veamos': 1, 'qué.': 1, 'Una': 1, 'sociedad': 1, 'variable.': 1, 'decir,': 1, 'permite': 1, 'muchos': 1, 'llevar': 1, 'cabo': 1, 'operaciones': 1, 'comprar': 1, 'acciones': 1, 'cotizadas,': 1, 'operar': 1, 'complejos': 1, 'etcétera': 1, 'podría': 1, 'forma.': 1, '-tienen': 1, 'personalidad': 1, 'propia-': 1, 'cotizan': 1, 'Impuesto': 1, 'decida': 1, 'retirar': 1, 'sicav,': 1, 'Hacienda': 1, 'retendrá': 1, 'generosamente': 1, '21': 1, 'dividendos.': 1, 'Exactamente': 1, 'igual': 1, 'mayoría': 1, 'definitiva,': 1, 'ante': 1, 'capaz': 1, 'posible': 1, 'incremento': 1, 'productividad.': 1, 'Precisamente,': 1, 'alardean': 1, 'mismos': 1, 'quieren': 1, 'eliminarlo.': 1, 'mecanismos': 1, 'alternativos': 1, 'aparecen': 1, 'manuales': 1, 'económico.': 1, 'propuesta': 1, 'intervencionistas': 1, 'cargárselo.': 1, 'Alegan': 1, '–conocidos': 1, 'coloquialmente': 1, 'mariachis–': 1, 'meras': 1, 'marionetas': 1, 'frente': 1, 'gestor': 1, 'responsable,': 1, 'suele': 1, 'aporta.': 1, 'Sin': 1, 'embargo,': 1, 'país.': 1, 'invierte': 1, 'Sociedades,': 1, 'indirectamente': 1, 'pagando': 1, 'dicho': 1, 'impuesto.': 1, 'así': 1, 'todos': 1, 'disposición.': 1, 'recibe': 1, 'financieras': 1, 'ha': 1, 'tributado.Y,': 1, 'así,': 1, 'grava': 1, 'cuando': 1, 'saca': 1, 'dinero.': 1, 'sean': 1, 'subterfugio': 1, 'evadan': 1, 'impuestos.': 1, 'lugar,': 1, 'porque': 1, '"para': 1, 'ricos".': 1, 'trimestre': 1, '2018,': 1, 'CNMV': 1, 'reportó': 1, '2.783': 1, '30.700': 1, 'Según': 1, 'Inverco,': 1, '–sicav': 1, 'inversión–': 1, 'pasado': 1, 'representar': 1, '6,6%': 1, 'volumen': 1, 'ahorrados': 1, '15%.': 1, 'preferido,': 1, '14,5%.': 1, 'Europa,': 1, 'habituales.': 1, 'Países': 1, 'Luxemburgo,': 1, 'Malta': 1, 'Andorra': 1, 'líderes': 1, 'gestión': 1, 'regulaciones': 1, 'flexibles.': 1, 'Incluso': 1, 'sindicatos': 1, 'hiperregulado': 1, 'Francia': 1, 'apuestan': 1, 'ellas': 1, 'trabajo.': 1, 'ignorancia': 1, 'vuela,': 1, 'pero': 1, 'capitales': 1, 'también.': 1, 'desaparecido': 1, 'País': 1, 'Vasco': 1, 'Navarra': 1, 'tras': 1, 'reformas': 1, 'sistemas': 1, 'tributarios': 1, 'forales.': 1, 'Como': 1, 'resultado,': 1, 'diseñados': 1, 'medida': 1, 'fortunas': 1, 'individuales': 1, 'especializadas': 1, 'crear': 1, 'estilo': 1, 'extranjero.': 1, 'parte,': 1, 'Cotizadas': 1, 'Inversión': 1, 'Mercado': 1, 'Inmobiliario': 1, '(socimi)': 1, 'compañías': 1, 'orientadas': 1, 'vivienda,': 1, 'inmobiliaria': 1, 'destinada': 1, 'principalmente': 1, 'activo': 1, 'depositado': 1, 'esta': 1, 'finalidad.': 1, 'Otro': 1, 'rasgo': 1, 'fundamental': 1, 'elevada': 1, 'transparencia.Tienen': 1, 'regulados.': 1, 'Actualmente,': 1, '59': 1, '-Mercado': 1, 'Alternativo': 1, 'Bursátil-': 1, '4': 1, 'continuo.': 1, 'ejercicio': 1, 'transparencia,': 1, 'podemos': 1, 'desmontar': 1, 'mitos': 1, 'pretende': 1, 'engañarle.': 1, '2017,': 1, 'valor': 1, 'cotizaban': 1, 'fue': 1, '12.221': 1, 'De': 1, 'ellos,': 1, '20%': 1, 'eran': 1, 'inversiones': 1, 'u': 1, 'oficinas.': 1, 'ellas,': 1, 'estaban': 1, 'localizadas': 1, 'Madrid.': 1, '1.200': 1, 'Teniendo': 1, 'precio': 1, 'medio': 1, 'metro': 1, 'cuadrado': 1, 'superficie': 1, 'media': 1, 'hablando': 1, 'unas': 1, '3.500': 1, 'propiedad': 1, 'Esto,': 1, '622.000': 1, 'apenas': 1, 'representa': 1, '0,56%': 1, 'parque': 1, 'inmobiliario.': 1, 'fácil': 1, 'deducir,': 1, 'datos': 1, 'mano,': 1, 'vehículos': 1, 'manipular': 1, 'precios….': 1, '¡Nula!': 1, 'Lo': 1, 'sí': 1, 'ocurrir': 1, 'gravan': 1, 'prohíben': 1, 'reducirá': 1, 'más.': 1, 'seguirán': 1, 'subiendo': 1, 'precios.': 1, 'tributen.': 1, 'repartir': 1, 'rentas': 1, 'alquiler,': 1, 'ventas': 1, '100%': 1, 'otras': 1, 'Socimi': 1, 'Reit.': 1, 'Dichos': 1, 'gravados': 1, '25%': 1, 'receptor': 1, 'empresa.': 1, 'caso': 1, 'personas': 1, 'físicas': 1, 'aplica': 1, 'gravamen': 1, '19-23%,': 1, 'inversión,': 1, 'depósitos,': 1, 'etc.': 1, 'Adicionalmente,': 1, '5%': 1, 'tributa': 1, '10%,': 1, 'propia': 1, 'carga': 1, '19%': 1, 'Todo': 1, 'anterior,': 1, 'indirectos,': 1, 'invierten': 1, 'tributan': 1, 'municipales,': 1, 'autonómicos': 1, 'locales': 1, 'religiosamente': 1, 'Así': 1, 'pues,': 1, 'aplicar': 1, 'mayores': 1, 'anterior': 1, 'manual.': 1, 'intento': 1, 'saqueo': 1, 'ambos': 1, 'evidente.': 1, 'logrado': 1, 'depósitos': 1, 'financieros,': 1, 'renta': 1, 'fija': 1, 'demás': 1, 'riesgo': 1, 'sea': 1, 'nula': 1, 'negativa.': 1, 'Ahora,': 1, 'pretenden': 1, 'echar': 1, 'pocos': 1, 'atractivos': 1, 'familiar.': 1, 'Mientras': 1, 'crece': 1, 'dígito': 1, 'hace': 1, 'varios': 1, 'años,': 1, 'permanecen': 1, 'establecidas': 1, 'España': 1, 'languidecen': 1, 'lentamente': 1, '2015.': 1, '4.000': 1, 'euros': 1, 'gestionados.': 1, 'Seguir': 1, 'poniendo': 1, 'jaque': 1, 'seguridad': 1, 'credibilidad': 1, 'contra': 1, 'ciudadanos.': 1, 'Si': 1, 'acuerdo': 1, 'chollo': 1, 'invito': 1, 'vaya': 1, 'habitual': 1, 'e': 1, 'invierta': 1, 'ellas.': 1, 'Verá': 1, 'sujetas': 1, 'fluctuaciones': 1, 'mercado,': 1, 'todo': 1, 'trabas,': 1, 'producto': 1, 'tenga': 1, 'ver': 1, 'generar': 1, 'ahorros.': 1, 'Francia,': 1, 'borrador': 1, 'Ley': 1, 'Presupuestos': 1, '2018': 1, 'prevé': 1, 'reducir': 1, '12,8%.': 1, 'Estados': 1, 'Unidos': 1, 'Reino': 1, 'Unido': 1, 'disminuyendo': 1, 'tipos': 1, 'general.': 1, 'contrario,': 1, 'debate': 1, 'gravarlos': 1, 'hasta': 1, 'echarlos': 1, 'o,': 1, 'directamente,': 1, 'prohibirlos.': 1, 'Aquí': 1, 'tenemos': 1, '"cambio"': 1, 'Podemos:': 1, 'consiste': 1, 'pasen': 1, 'generando': 1, 'arcas': 1, 'públicas': 1, 'uso': 1, 'disfrute': 1, 'gobernantes.': 1, 'Daniel': 1, 'Rodríguez': 1, 'consultor': 1, 'estratégico': 1, 'multinacionales,': 1, 'autor': 1, 'blog': 1, 'economistadecabecera.es': 1, 'miembro': 1, 'Comité': 1, 'Dirección': 1, 'Club': 1, 'Viernes.': 1})

<div class="descargar">
    <a href="{{ site.url }}{{ site.baseurl }}/jupyter/Web_Scraping_Python.ipynb" download>Descargar fichero *.ipynb</a>
</div>
    
