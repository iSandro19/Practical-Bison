%{
#include <stdlib.h>
#include "practica2.tab.h"
%}

%option yylineno

cabecera "<?"[a-zA-Z0-9".""\-""=" ]+"?>"
comentarios "<!--"[a-zA-Z0-9"\.""\-""=""/"":""_"",""!"áéíóú ]+"-->"
fin "</"[a-zA-Z0-9:"= ]+">"
inicio "<"[a-zA-Z0-9:"= ]+">"
datos [^><\n\t\r ]+

%%

[&] {printf("INVALIDO\n");}
"<" {printf("INVALIDO\n");}
{cabecera} {printf("CABECERA\n");}
{comentarios} {printf("COMENTARIOS\n");}
{fin} {printf("FIN\n");}
{inicio} {printf("INICIO\n");}
{datos} {printf("DATOS\n");}
\n {printf("0");}
" " {printf("0");}

%%