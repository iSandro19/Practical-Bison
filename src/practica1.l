%{
/*
Implementación FLEX:
- Número de caracteres que lo componen (sin blancos ni tabuladores).
- Número de palabras (secuencias sin tabuladores o espacios).
- Número de palabras con todos los caracteres en mayúscula.
- Número de palabras con todos los caracteres en minúscula.
- Número de palabras con todos los caracteres numéricos.
- Número de frases (secuencias de palabras que finalizan con un ".").
*/

int charCount = 0, wordCount = 0, upperCount = 0;
int lowerCount = 0, numberCount = 0, sentenceCount = 0;
%}

ws [" "\t\n\r]
lower [a-z]+
upper [A-Z]+
word [a-z|A-Z|0-9]+
number [0-9]+
sentence [.]

%%
{ws} {}
{number} {numberCount++; wordCount++; charCount+=yyleng;}
{lower} {lowerCount++; wordCount++; charCount+=yyleng;}
{upper} {upperCount++; wordCount++; charCount+=yyleng;}
{sentence} {sentenceCount++; charCount+=yyleng;}
{word} {wordCount++; charCount+=yyleng;}
. {charCount++;}
%%

int main() {
	yylex();
	printf("Número de caracteres: %d\n", charCount);
	printf("Número de palabras: %d\n", wordCount);
	printf("Número de palabras en mayúscula: %d\n", upperCount);
	printf("Número de palabras en minúscula: %d\n", lowerCount);
	printf("Número de números: %d\n", numberCount);
	printf("Número de frases: %d\n", sentenceCount);
}