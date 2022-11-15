FUENTE = practica2
FUENTE_ONLY_FLEX = practica2_flex

PRUEBA1 = test1.xml # Test para comprobar fallo de tag inicio/fin con distintos nombres.
PRUEBA2 = test2.xml # Test para comprobar que no hace falta prólogo y/o comentarios.
PRUEBA3 = test3.xml # Test para comprobar fallo de que no exista tag de cierre.
PRUEBA4 = test4.xml # Test para comprobar que los tags están bien estructurados.
PRUEBA5 = test5.xml # Test para comprobar que no existe "<" en los datos.
PRUEBA6 = test6.xml # Test para comprobar que no existe "&" en los datos.
PRUEBA7 = test7.xml # Test para comprobar que no exiten "--" en los comentarios.

LIB = lfl

all: compile run1 run2 run3 run4 run5 run6 run7

all_only_flex: compile_only_flex run_only_flex1 run_only_flex2 run_only_flex3 run_only_flex4 run_only_flex5 run_only_flex6 run_only_flex7

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -$(LIB)

run1:
	./$(FUENTE) < $(PRUEBA1)

run2:
	./$(FUENTE) < $(PRUEBA2)

run3:
	./$(FUENTE) < $(PRUEBA3)

run4:
	./$(FUENTE) < $(PRUEBA4)

run5:
	./$(FUENTE) < $(PRUEBA5)

run6:
	./$(FUENTE) < $(PRUEBA6)

run7:
	./$(FUENTE) < $(PRUEBA7)

compile_only_flex:
	flex $(FUENTE_ONLY_FLEX).l
	gcc -o $(FUENTE_ONLY_FLEX) lex.yy.c -$(LIB)

run_only_flex1:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA1)

run_only_flex2:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA2)

run_only_flex3:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA3)

run_only_flex4:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA4)

run_only_flex5:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA5)

run_only_flex6:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA6)

run_only_flex7:
	./$(FUENTE_ONLY_FLEX) < $(PRUEBA7)
