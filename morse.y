%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *s);
void print_morse(char c);
int yylex();
void yy_scan_string(const char *str);
%}

%union {
    char char_val;
}

%token <char_val> LETTER SPACE

%%

input:
    text '\n' { printf("\n"); }
  ;

text:
    text LETTER { print_morse($2); }
  | text SPACE { printf("/ "); }
  | LETTER { print_morse($1); }
  | SPACE { printf("/ "); }
  ;

%%

void print_morse(char c) {
    switch (c) {
        case 'A': case 'a': printf(".- "); break;
        case 'B': case 'b': printf("-... "); break;
        case 'C': case 'c': printf("-.-. "); break;
        case 'D': case 'd': printf("-.. "); break;
        case 'E': case 'e': printf(". "); break;
        case 'F': case 'f': printf("..-. "); break;
        case 'G': case 'g': printf("--. "); break;
        case 'H': case 'h': printf(".... "); break;
        case 'I': case 'i': printf(".. "); break;
        case 'J': case 'j': printf(".--- "); break;
        case 'K': case 'k': printf("-.- "); break;
        case 'L': case 'l': printf(".-.. "); break;
        case 'M': case 'm': printf("-- "); break;
        case 'N': case 'n': printf("-. "); break;
        case 'O': case 'o': printf("--- "); break;
        case 'P': case 'p': printf(".--. "); break;
        case 'Q': case 'q': printf("--.- "); break;
        case 'R': case 'r': printf(".-. "); break;
        case 'S': case 's': printf("... "); break;
        case 'T': case 't': printf("- "); break;
        case 'U': case 'u': printf("..- "); break;
        case 'V': case 'v': printf("...- "); break;
        case 'W': case 'w': printf(".-- "); break;
        case 'X': case 'x': printf("-..- "); break;
        case 'Y': case 'y': printf("-.-- "); break;
        case 'Z': case 'z': printf("--.. "); break;
        default: printf("? "); // Invalid character
    }
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    char input[100];  
    char choice;

    do {
        printf("Enter text: ");
        fgets(input, sizeof(input), stdin);  

        yy_scan_string(input);  
        yyparse();  

        // Ask the user if they want to enter text again
        printf("\nDo you want to enter another text? (y/n): ");
        scanf(" %c", &choice);
        getchar();  // Consume the leftover newline

    } while (choice == 'y' || choice == 'Y');

    printf("Goodbye!\n");
    return 0;
}
