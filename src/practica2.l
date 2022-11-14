%{
#include <stdlib.h>
#include "practica2.tab.h"
%}

%option yylineno

cabecera "<?"[a-zA-Z0-9".""\-""=" ]+"?>"
comentarios "<!--"[a-zA-Z0-9"\.""\-""=""/"":""_"",""!"áéíóú ]+"-->"
datos "<"[a-zA-Z0-9]+">"[a-zA-Z0-9"\.""\-""=""/"":""_"",""!"áéíóú ]+"<""/"[a-zA-Z0-9]+">"
inicio "<"[a-zA-Z0-9]+">"\n
fin "</"[a-zA-Z0-9]+">"

%%

{cabecera} {return CABECERA;}
{comentarios} {return COMENTARIOS;}
{datos} {return DATOS;}
{inicio} {yylval.val = strdup(yytext); return INICIO;}
{fin} {return FIN;}

%%