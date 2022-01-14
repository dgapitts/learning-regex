seven types of shell expansions

Here is the order of seven types of shell expansions.
1. Brace expansion which is expansion of expressions within curly brackets. 
2. Tilde expansion which is the expansion of the tilde character to a user's home directory. 
3. Shell parameter and variable expansion is how Bash expands variables. 
4. Arithmetic expansion is how arithmetic expands. 
5. Command substitution uses the output of a command as text. 
6. Word splitting is how the results of expansion are split into separate entities or words. 
7. Filename expansion is how globs are expanded into lists and lastly, quote removal is when quote characters are removed from words. (Quotes are special characters that can influence when and how text is processed).

For example 
 
 It's important to understand the order in which these things happen. Just like how the order in which we solve algebraic expressions will change the result, the order in which expansion happen may change your output as well. The order in which expansion is processed is brace expansion first, then tilde expansion, parameter expansion, variable expansion, and arithmetic expansion and command substitution from left to right. Word splitting and lastly filename expansion. It's interesting that the expansion people think about most is done last. In this example, the brace expansion at the very end is processed first.

