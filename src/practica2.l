%{
#include <stdlib.h>
#include "practica2.tab.h"
%}

%option yylineno

cabecera "<?"[a-zA-Z0-9.\-=" ]+"?>"
comentarios "<!--"[a-zA-Z0-9"\.=/:_,!áéíóú ]+"-->"
fin "</"[a-zA-Z0-9:"=._\- ]+">"
inicio "<"[a-zA-Z0-9:"=._\- ]+">"
datos [^><\n\t\r ]+
invalido [&<]+

%%

{invalido} {return INVALIDO;}
{cabecera} {return CABECERA;}
{comentarios} {return COMENTARIOS;}
{fin} {yylval.val = strdup(yytext+2); return FIN;}
{inicio} {yylval.val = strdup(yytext+1); return INICIO;}
{datos} {return DATOS;}
\n {0;}
" " {0;}

%%