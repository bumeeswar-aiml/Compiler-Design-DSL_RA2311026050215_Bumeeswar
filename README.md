# Compiler-Design-DSL_RA2311026050215_Bumeeswar
# Mini Compiler for Domain Specific Language (DSL)

## Project Description

This project implements a **Mini Compiler** for a simple Domain Specific Language (DSL) using **Flex, Bison, and C programming language**.

The compiler accepts source code as input and performs the major phases of compilation:

- Lexical Analysis
- Syntax Analysis
- Abstract Syntax Tree (AST) Generation
- Intermediate Code Generation

---

## Features

- Supports variable assignment
- Supports arithmetic expressions (`+`, `-`, `*`, `/`)
- Supports print statements
- Token generation using Flex
- Parsing using Bison
- AST creation using C structures
- Intermediate code generation

---

## Tools Used

- Flex (Lexical Analyzer)
- Bison (Parser Generator)
- GCC Compiler
- C Programming Language
- Ubuntu (WSL)
- GitHub

---

## Folder Structure

```text
Compiler-Design-DSL_RA2311026050215_Bumeeswar/
│── src/
│   ├── lexer.l
│   ├── parser.y
│   ├── ast.c
│   ├── ast.h
│── test/
│   └── input.txt
│── docs/
│   └── Report.pdf
│── output/
│── README.md

Steps to Run
Step 1: Open src folder
Bash

cd src
Step 2: Generate Lexer
Bash

flex lexer.l
Step 3: Generate Parser
Bash

bison -d parser.y
Step 4: Compile Source Files
Bash

gcc lex.yy.c parser.tab.c ast.c -o compiler
Step 5: Run Compiler
Bash

./compiler < ../test/input.txt
Sample Input

x = 5 + 3;
y = x * 2;
print(y);
Sample Output

Mini Compiler Running...

Assignment Statement
Number: 5
Number: 3
t1 = operation +

Assignment Statement
Variable: x
Number: 2
t2 = operation *

Print Statement
Variable: y
Modules Explanation
1. Lexical Analysis
Implemented using Flex.

Recognizes:

Keywords

Identifiers

Numbers

Operators

Symbols

2. Syntax Analysis
Implemented using Bison.

Checks grammar rules and validates program syntax.

3. AST Generation
Creates syntax tree representation of expressions.

4. Intermediate Code Generation
Generates temporary instructions for expressions.

Team Details
Name: Bumeeswar
Register Number: RA2311026050215

Conclusion
This project successfully demonstrates the implementation of a mini compiler for a DSL using Flex, Bison, and C language.

