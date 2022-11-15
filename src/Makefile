FUENTE = practica2
FUENTE_ONLY_FLEX = practica2_flex

PRUEBA1 = test1.xml # Test para comprobar que no tenemos tag inicio/fin con distintos nombres.
PRUEBA2 = test2.xml # Test para comprobar que no falta el prólogo.
PRUEBA3 = test3.xml # Test para comprobar que no tenemos tag de cierre.
PRUEBA4 = test4.xml # Test para comprobar que no tenemos tags mal estructurados.
PRUEBA5 = test5.xml # Test para comprobar que no existe "<" en los datos.
PRUEBA6 = test6.xml # Test para comprobar que no existe "&" en los datos.
PRUEBA7 = test7.xml # Test para comprobar que no exiten "--" en los comentarios.
PRUEBA8 = test8.xml # Test para comprobar que no pueden existir más de un elemento raíz.
PRUEBA9 = test9.xml # Test para comprobar pueden existir muchos subelementos.
PRUEBA10 = test10.xml # Test para comprobar atributos

LIB = lfl

all: compile run1 run2 run3 run4 run5 run6 run7 run8 run9 run10

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -$(LIB)

run1:
	@echo "Test para comprobar que no tenemos tag inicio/fin con distintos nombres:"
	@./$(FUENTE) < $(PRUEBA1)

run2:
	@echo "Test para comprobar que no falta el prólogo."
	@./$(FUENTE) < $(PRUEBA2)

run3:
	@echo "Test para comprobar que no tenemos tag de cierre:"
	@./$(FUENTE) < $(PRUEBA3)

run4:
	@echo "Test para comprobar que no tenemos tags mal estructurados:"
	@./$(FUENTE) < $(PRUEBA4)

run5:
	@echo "Test para comprobar que no existe < en los datos:"
	@./$(FUENTE) < $(PRUEBA5)

run6:
	@echo "Test para comprobar que no existe & en los datos:"
	@./$(FUENTE) < $(PRUEBA6)

run7:
	@echo "Test para comprobar que no exiten -- en los comentarios:"
	@./$(FUENTE) < $(PRUEBA7)

run8:
	@echo "Test para comprobar que no pueden existir más de un elemento raíz:"
	@./$(FUENTE) < $(PRUEBA8)

run9:
	@echo "Test para comprobar que pueden existir muchos subelementos (único test correcto):"
	@./$(FUENTE) < $(PRUEBA9)

run10:
	@echo "Test para comprobar que existe una cabecera válida:"
	@./$(FUENTE) < $(PRUEBA10)

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h