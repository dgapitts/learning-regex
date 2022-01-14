## Intro to glob and regex operations

> Globs can look and act like regular expressions but are less expressive and are easier to use. They're also easier for the system to process, as well. Do not confuse globs and regular expressions. Globs match file names, whereas regular expressions match text.

Starting with a simple script to generate 4 files 

```
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ for i in {1..4};do echo $i" abc "`date` > file$i;done
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ 
```

The * wilecard in the filename here i.e. `file*` is an example of a glob expression
```

~/projects/learning-regex/ex001_intro_to_glob_and_regex $ head file*
==> file1 <==
1 abc Wed Jan 12 21:54:11 CET 2022

==> file2 <==
2 abc Wed Jan 12 21:54:12 CET 2022

==> file3 <==
3 abc Wed Jan 12 21:54:13 CET 2022

==> file4 <==
4 abc Wed Jan 12 21:54:14 CET 2022
```

where as the `^2` and `^[2-3]` are regex operations

```
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ grep ^2  file*
file2:2 abc Wed Jan 12 21:54:12 CET 2022
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ grep ^[2-3]  file*
file2:2 abc Wed Jan 12 21:54:12 CET 2022
file3:3 abc Wed Jan 12 21:54:13 CET 2022
```