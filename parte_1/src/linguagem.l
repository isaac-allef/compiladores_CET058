/*

- Para gerar o fonte digite
$ lex ex01.l

- Para compilar o fonte me C gerado digite
$ gcc ex01.yy.c

- Para executar
$ ./a.out

*/   


/* SEÇÃO DE DEFINIÇÕES */

%{
    /*
        Definições que estarão disponíveis 
            - variáveis
            - constantes
        O que for aqui será copiado para o arquivo *.yy.c
    
        Variáveis declaradas aqui estarão acessível nas funções yylex() e 
        main().
    */
    int contador = 0;

    enum yytokentype{
        INT = 201,
        FLOAT = 202,
        DOUBLE = 203,
        CHAR = 204,
        STRING = 205,
        IF = 206,
        ELSE = 207,
        WHILE = 208,
        ATRIBUICAO = 209,
        MENOR = 210,
        MAIOR = 211,
        MENOR_IGUAL = 212,
        MAIOR_IGUAL = 213,
        IGUAL = 214,
        DIFERENTE = 215,
        MAIS = 216,
        MENOS = 217,
        VEZES = 218,
        DIVIDIDO = 219,
        RETURN = 220,
        PRINT = 221,
        VALOR_STRING = 222, 
        VALOR_CHAR = 223,
        identificador = 224,
        VALOR_FLOAT = 225,
        VALOR_DOUBLE = 226,
        VALOR_INT = 227,
        VIRGULA = 228,
        ABRE_PARENTESES = 229,
        FECHA_PARENTESES = 230,
        ABRE_CHAVE = 231,
        FECHA_CHAVE = 232,
        ABRE_COLCHETE = 233,
        FECHA_COLCHETE = 23,
        E = 235,
        OU = 236,
        NAO = 237
    };
%}

/* Definições de Nomes */
VETOR "VETOR"
INT "INTEIRO"
FLOAT "BARRIL"
DOUBLE "BARRIL DOBRADO"
CHAR "MIGUEZIN"
STRING "MIGUE"
IF "SE"
ELSE "SE DER MERDA"
WHILE "ENQUANTO"
ATRIBUICAO "RECEBE"
MENOR "MENOR"
MAIOR "MAIOR"
MENOR_IGUAL "MENOR IGUAL"
MAIOR_IGUAL "MAIOR IGUAL"
IGUAL "IGUAL"
DIFERENTE "DIFERENTE"
MAIS "MAIS"
MENOS "MENOS"
VEZES "VEZES"
DIVIDIDO "DIVIDIDO"
RETURN "TOME DE VOLTA"
PRINT "BOTE NA TELA"
VALOR_STRING \"(\\.|[^"\\])*\"
VALOR_CHAR \'(\\.|[^"\\])\'
identificador [a-z_][a-z_0-9]*
VALOR_FLOAT [0-9]+.[0-9]+b
VALOR_DOUBLE [0-9]+.[0-9]+d
VALOR_INT [0-9]+
ABRE_PARENTESES "("
FECHA_PARENTESES ")"
ABRE_CHAVE "{"
FECHA_CHAVE "}"
VIRGULA ","
ABRE_COLCHETE "["
FECHA_COLCHETE "]"
E "E"
OU "OU"
NAO "NAO"

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */

{VETOR}         {printf("<VETOR, %s>", yytext); contador++;}
{STRING}     {printf("<STRING, %s>", yytext); contador++;}
{CHAR}     {printf("<CHAR, %s>", yytext); contador++;}
{VALOR_STRING}     {printf("<VALOR_STRING, %s>", yytext); contador++;}
{VALOR_CHAR}     {printf("<VALOR_CHAR, %s>", yytext); contador++;}
{IF} {printf("<IF, %s>", yytext); contador++;}
{ELSE} {printf("<ELSE, %s>", yytext); contador++;}
{WHILE} {printf("<WHILE, %s>", yytext); contador++;}
{ATRIBUICAO} {printf("<ATRIBUICAO, %s>", yytext); contador++;}
{MENOR} {printf("<MENOR, %s>", yytext); contador++;}
{MAIOR} {printf("<MAIOR, %s>", yytext); contador++;}
{MENOR_IGUAL} {printf("<MENOR_IGUAL, %s>", yytext); contador++;}
{MAIOR_IGUAL} {printf("<MAIOR_IGUAL, %s>", yytext); contador++;}
{IGUAL} {printf("<IGUAL, %s>", yytext); contador++;}
{DIFERENTE} {printf("<DIFERENTE, %s>", yytext); contador++;}
{MAIS} {printf("<MAIS, %s>", yytext); contador++;}
{MENOS} {printf("<MENOS, %s>", yytext); contador++;}
{VEZES} {printf("<VEZES, %s>", yytext); contador++;}
{DIVIDIDO} {printf("<DIVIDIDO, %s>", yytext); contador++;}
{RETURN} {printf("<RETURN, %s>", yytext); contador++;}
{PRINT} {printf("<PRINT, %s>", yytext); contador++;}
{identificador}     {printf("<identificador, %s>", yytext); contador++;}
{VALOR_FLOAT}     {printf("<VALOR_FLOAT, %s>", yytext); contador++;}
{VALOR_DOUBLE}     {printf("<VALOR_DOUBLE, %s>", yytext); contador++;}
{VALOR_INT}     {printf("<VALOR_INT, %s>", yytext); contador++;}
{FLOAT}     {printf("<FLOAT, %s>", yytext); contador++;}
{DOUBLE}     {printf("<DOUBLE, %s>", yytext); contador++;}
{INT}     {printf("<INT, %s>", yytext); contador++;}
{ABRE_PARENTESES} {printf("<ABRE_PARENTESES, %s>", yytext); contador++;}
{FECHA_PARENTESES} {printf("<FECHA_PARENTESES, %s>", yytext); contador++;}
{ABRE_CHAVE} {printf("<ABRE_CHAVE, %s>", yytext); contador++;}
{FECHA_CHAVE} {printf("<FECHA_CHAVE, %s>", yytext); contador++;}
{VIRGULA}  {printf("<VIRGULA, %s>", yytext); contador++;}
{ABRE_COLCHETE}  {printf("<ABRE_COLCHETE, %s>", yytext); contador++;}
{FECHA_COLCHETE}  {printf("<FECHA_COLCHETE, %s>", yytext); contador++;}
{E}  {printf("<E, %s>", yytext); contador++;}
{OU}  {printf("<OU, %s>", yytext); contador++;}
{NAO}  {printf("<NAO, %s>", yytext); contador++;}
<<EOF>>                return 0;
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}