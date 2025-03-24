%{
#include <stdio.h>
#include "morse.tab.h"
%}

%%

[a-zA-Z]    { yylval.char_val = yytext[0]; return LETTER; }  
" "         { return SPACE; }
\n          { return '\n'; }
.           { printf("Invalid character: %s\n", yytext); return yytext[0]; }

%%

int yywrap() { return 1; }
