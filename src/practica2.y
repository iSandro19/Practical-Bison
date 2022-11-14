%{
#include <stdio.h>
#include <string.h>

void yyerror(char *s);
char buffer[1024];
%}
%locations
%union{
	char * val;
}
%token CABECERA
%token COMENTARIOS
%token DATOS
%token <val> INICIO
%token <val> FIN

%%

xml : CABECERA comentarios estructura {
		printf("\nSintaxis XML correcta.\n");
	}
    ;
comentarios : /*vacio*/
	| COMENTARIOS
	;
estructura : /*vacio*/
	| INICIO estructura FIN {
		if(strcmp($1, $3) != 0) {
			char * str1 = $1;
			char * str2 = $3;
			str1[strlen(str1) - 1] = 0;
			str2[strlen(str2) - 1] = 0;
			snprintf(buffer, sizeof(buffer), "Encontrado \"%s\" y se esperaba \"%s\".", str1, str2);
			yyerror(buffer); YYERROR;
		}
	}
	| INICIO datos FIN estructura {
		if(strcmp($1, $3) != 0) {
			char * str1 = $1;
			char * str2 = $3;
			str1[strlen(str1) - 1] = 0;
			str2[strlen(str2) - 1] = 0;
			snprintf(buffer, sizeof(buffer), "Encontrado \"%s\" y se esperaba \"%s\".", str1, str2);
			yyerror(buffer); YYERROR;
		}
	}
	;
datos : DATOS
	| datos DATOS
	;

%%

int main(int argc, char *argv[]) {
extern FILE *yyin;
	switch (argc) {
		case 1:	yyin=stdin;
			yyparse();
			break;
		case 2: yyin = fopen(argv[1], "r");
			if (yyin == NULL) {
				printf("ERROR: No se ha podido abrir el fichero.\n");
			}
			else {
				yyparse();
				fclose(yyin);
			}
			break;
		default: printf("ERROR: Demasiados argumentos.\nSintaxis: %s [fichero_entrada]\n\n", argv[0]);
	}

	return 0;
}

extern int yylineno;
void yyerror(char *s) {fprintf (stderr, "Sintaxis XML incorrecta en línea %d. %s\n", yylineno, s);}