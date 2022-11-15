# Practical-Bison | Óscar Alejandro Manteiga Seoane

## Desarrollo, funcionamiento y peculiaridades

### Desarrollo en 3 etapas

La primera de ellas será la composición del archivo flex de la práctica. En esta parte se edita el fichero practica2.l para lograr que se identifiquen todos los elementos del XML. Para saber si iba detectando todo, se realizaba un printf() con el tipo de elemento que era (cabecera, comentario, inicio, fin, datos...). Esto ayudo a completar el archivo con todas las posibilidades que puede contener un XML. Al finalizarlo se cambiaron los printf() por un return con esa misma palabra, que la usaremos en la gramática.

La segunda parte de la prácticas será la composición del archivo bison/yacc de la práctica correspondiente a la gramática. En esta parte se edita el fichero practica2.y. En una libreta se fue desarrollando el árbol de la gramática para poder escribir todas las opciones en fichero. Una vez desarrollado las opciones válidas se pasó a escribir los fallos que se pueden realizar en la gramática de un XML para formatear el mensaje de error.

La última fase (aunque se fue desarrollando a la vez que las dos anteriores) fue el desarrollo de los test, que en este caso son 10. 9 de ellos buscan un fallo en concreto en el XML que se le pase (mencionado al hacer make all o make runX) y 1 que comprueba un archivo largo que no tiene ningún fallo (para saber si los que están bien los marca como tal).

### Funcionamiento

Con el programa en FLEX detectamos todos los caracteres de una cadena de texto o fichero, que se pasan a BISON para que comprobemos con nuestras reglas si coincide con cómo tienen que ser un XML. En caso de que no sea así mostraremos un mensaje de error.
Para ejecutarla basta con ejecutar `make all` (compilará y ejecutará los 10 tests con el mensaje explictivo de cada uno) o `make compile` y `make runX` (siendo X el número de test).

### Contenido

- practica2.l: programa en flex.
- practica2.y: programa en bison.
- practica2.txt: memoria (este archivo).
- Makefile: archivo para compilar el programa y ejecutarlo
- testX.xml: archivos XML para testear el programa.

---

Óscar Alejandro Manteiga Seoane | PL 2022/2023
