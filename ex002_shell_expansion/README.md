Seven types of shell expansions

Here is the order of seven types of shell expansions.
1. Brace expansion which is expansion of expressions within curly brackets. 
2. Tilde expansion which is the expansion of the tilde character to a user's home directory. 
3. Shell parameter and variable expansion is how Bash expands variables. 
4. Arithmetic expansion is how arithmetic expands. 
5. Command substitution uses the output of a command as text. 
6. Word splitting is how the results of expansion are split into separate entities or words. 
7. Filename expansion is how globs are expanded into lists and lastly, quote removal is when quote characters are removed from words. (Quotes are special characters that can influence when and how text is processed).

For example 

```
~/projects/learning-regex/ex002_shell_expansion $ time for i in {1..20};do echo $i" abc "`date +%s` > file$i;sleep 1;done

real	0m20.224s
user	0m0.051s
sys	0m0.075s
~/projects/learning-regex/ex002_shell_expansion $ head file*5
==> file15 <==
15 abc 1642191768

==> file5 <==
5 abc 1642191758
~/projects/learning-regex/ex002_shell_expansion $ head file*[2,4,6,8,0]
==> file10 <==
10 abc 1642191763

==> file12 <==
12 abc 1642191765

==> file14 <==
14 abc 1642191767

==> file16 <==
16 abc 1642191769

==> file18 <==
18 abc 1642191771

==> file2 <==
2 abc 1642191755

==> file20 <==
20 abc 1642191773

==> file4 <==
4 abc 1642191757

==> file6 <==
6 abc 1642191759

==> file8 <==
8 abc 1642191761
```

here 
* `{1..20}` is Brace expansion (but note the brace in the awk script is different / out-of-scoppe for thiw ordering discussion)
* `echo $i` is Shell parameter
*

```
~/projects/learning-regex $ du -hs /Users/"$USER"/projects/*| grep learn* | head -n 2 | awk '{print $2 " " $1}'|sed 's#/Users/"${USER}"/projects/##g'
/Users/dave/projects/learning-cockroach 5.1M
/Users/dave/projects/learning-go 3.2M
``

here 
* `${USER}` is Shell parameter (also note the brace in the awk script is different / out-of-scoppe for thiw ordering discussion)
* `/Users/dave/projects/*` is Filename expansion / globing and so is done lastly

NB As per the course:

 
> It's important to understand the order in which these things happen. Just like how the order in which we solve algebraic expressions will change the result, the order in which expansion happen may change your output as well. The order in which expansion is processed is brace expansion first, then tilde expansion, parameter expansion, variable expansion, and arithmetic expansion and command substitution from left to right. Word splitting and lastly filename expansion. It's interesting that the expansion people think about most is done last. In this example, the brace expansion at the very end is processed first.

