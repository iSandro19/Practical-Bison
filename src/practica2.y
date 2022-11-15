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
%token INVALIDO

%%

xml : comentarios raiz {
        snprintf(buffer, sizeof(buffer), "Todo archivo de XML debe tener una cabecera (XML prolog).");
		yyerror(buffer); YYERROR;
	}
	| cabecera comentarios raiz {
		printf("Sintaxis XML correcta.\n\n");
	}
    ;

cabecera : CABECERA
	| cabecera CABECERA
	;

comentarios : /*vacio*/
	| COMENTARIOS
	| INVALIDO  {
		snprintf(buffer, sizeof(buffer), "Caracteres no válidos en XML (\"--\") en los comentarios");
		yyerror(buffer); YYERROR;
	}
	;

raiz : INICIO estructura FIN {
		char * str1 = $1;
		char * str2 = $3;
		str1[strlen(str1) - 1] = 0;
		str2[strlen(str2) - 1] = 0;

		if(strcmp($1, $3) != 0) {
			snprintf(buffer, sizeof(buffer), "Encontrado \"%s\" y se esperaba \"%s\".", str2, str1);
			yyerror(buffer); YYERROR;
		}
	}
	| INICIO estructura FIN estructura {
		snprintf(buffer, sizeof(buffer), "Un documento XML solo puede tener 1 elemento raíz");
		yyerror(buffer); YYERROR;
	}
	;

estructura : /*vacio*/
	| INICIO estructura FIN estructura {
		char * str1 = $1;
		char * str2 = $3;
		str1[strlen(str1) - 1] = 0;
		str2[strlen(str2) - 1] = 0;

		if(strcmp($1, $3) != 0) {
			snprintf(buffer, sizeof(buffer), "Encontrado \"%s\" y se esperaba \"%s\".", str2, str1);
			yyerror(buffer); YYERROR;
		}
	}
	| INICIO datos FIN estructura {
		char * str1 = $1;
		char * str2 = $3;
		str1[strlen(str1) - 1] = 0;
		str2[strlen(str2) - 1] = 0;
		
		if(strcmp($1, $3) != 0) {
			snprintf(buffer, sizeof(buffer), "Encontrado \"%s\" y se esperaba \"%s\".", str2, str1);
			yyerror(buffer); YYERROR;
		}
	}
	| INICIO datos INICIO {
		char * str1 = $1;
		str1[strlen(str1) - 1] = 0;

		snprintf(buffer, sizeof(buffer), "Tag de cierre no encontrado para tag de inicio \"%s\".", str1);
		yyerror(buffer); YYERROR;
	}
	;
	
datos : DATOS
	| datos DATOS
	| datos INVALIDO {
		snprintf(buffer, sizeof(buffer), "Caracteres no válidos en XML (\"<\" o \"&\") en los datos");
		yyerror(buffer); YYERROR;
	}
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
void yyerror(char *s) {fprintf (stderr, "Sintaxis XML incorrecta en línea %d. %s\n\n", yylineno, s);}