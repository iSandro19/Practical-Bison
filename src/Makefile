FUENTE = practica2
PRUEBA1 = test1.xml
PRUEBA2 = test2.xml
PRUEBA3 = test3.xml
LIB = lfl

all: compile run1 run2 run3

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -$(LIB)

run1:
	./$(FUENTE) < $(PRUEBA1)

run2:
	./$(FUENTE) $(PRUEBA2)

run3:
	./$(FUENTE) < $(PRUEBA3)

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h
