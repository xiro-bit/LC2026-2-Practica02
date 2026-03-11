# Lógica Computacional 2026-2

## Práctica 1

Para trabajar sobre esta base, tienen que hacer un fork de este repositorio y trabajar sobre él.

Únicamente modifiquen el archivo Practica01.hs que se encuentra en el directorio src. Si quieren modificar las pruebas o agregar más, pueden preguntarme con confianza y les explico como modificarlas.

Deben tener instalado el compilador de Haskell para poder probar su práctica. Para ello deben colocarse en el directorio src y ejecutar el comando `ghci Practica01.hs`.

Si quieren probar su práctica haciendo uso de las pruebas unitarias que les estoy pasando, tienen que ejecutar los siguientes comandos desde el directorio donde se encuentra este ReadMe:
```
cabal build
cabal test
```

El primero es para compilar y el segundo es para ejecutar las pruebas unitarias.

Si no les llegan a funcionar, es posible que el problema es que tengan una versión diferente de cabal. Si es el caso, modifiquen el archivo `.cabal` con la versión que tienen o escríbanme para que les diga cuáles líneas modificar.

## Integrantes

En esta sección deben eliminar esta línea de texto, borrar la leyenda "Integrante n" y escribir su nombre empezando por apellidos y su número de cuenta.

+ García Hernandez Greta Nicole
     - No. de Cuenta: 322136313
+ Pérez García Blanca Xirone
    - No. de Cuenta: 314213989


## Comentarios

Tuvimos varios errores en las pruebas unitarias en las funciones de estadosPosibles y modelos porque en la formula Cg tenian los mismos resultados pero en distinto orden anexo imágenes en la carpeta RESULTADOS_TEST_UNITARIOS, además de la funcion sonEquivalentes y consecuenciaLogica que se definen a partir de las anteriores, estos son los 4 errores que se muestran en las pruebas unitarias cuando probamos cabal test. 

Tambien usamos las funciones de filter, elem y all para ahorrar trabajo, pero supongo que era crearlas desde cero, una disculpa. 
