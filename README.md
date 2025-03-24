# Analyzer-Parser

# Morse Code Converter  

A simple program that converts text to Morse code using Flex and Bison.  

## How to Use  
1. Run the program:  
   ```bash
   ./morse_converter
2. Enter text to convert it to Morse code.

3. Choose to enter more text or exit.

##How to Compile
bison -d morse.y  
flex morse.l  
gcc lex.yy.c morse.tab.c -o morse_converter  


Requirements
Flex
Bison
GCC
