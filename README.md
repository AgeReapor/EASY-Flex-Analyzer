# EASY Flex Analyzer (*CS 155 Problem Set 2*)
Author: Adrian Joshua Reapor
### Description:
This is a Lex file (.lex) for analyzing an EASY programming language source code. The EASY programming language is a simple language designed for teaching programming fundamentals.

---
### Usage (*Windows WSL*)
1. ```$ flex EASY_analyzer.lex```
2. ```$ gcc lex.yy.c -lfl -o <EXECUTABLE_NAME>```
3. ```$ ./<EXECUTABLE_NAME> <PATH_TO_FILE>`

After running, there should be a list of Token and Lexeme pairs in <*Token*,*Lexeme*> formating in the terminal log.


Example:
```
$ flex EASY_analyzer.lex
$ gcc lex.yy.c -lfl -o EASY_analyzer
$ ./EASY_analyzer test_files/reserved_test.easy
```
---

For list of tokens, see [Regex Table Documentation](Regex_Table_Documentation.pdf)