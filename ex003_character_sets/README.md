### Character sets - use single square brackets

> Character sets are like a specialized question mark wildcard. They match exactly one character, but we get to specify the possible matches by providing a list. To create a character set, you use single square brackets containing the list of characters you want to match.


creating some files
```
~/projects/learning-regex/ex003_character_sets $ time for i in {1..20};do echo $i" abc "`date +%s` > file$i;sleep 1;done

real	0m20.222s
user	0m0.052s
sys	0m0.079s
~/projects/learning-regex/ex003_character_sets $ ls
file1	file10	file11	file12	file13	file14	file15	file16	file17	file18	file19	file2	file20	file3	file4	file5	file6	file7	file8	file9
```

and now selecting files using Character sets mark wildcards:

```
~/projects/learning-regex/ex003_character_sets $ ls file[1,2]
file1	file2
~/projects/learning-regex/ex003_character_sets $ ls file[1,2,3]
file1	file2	file3
~/projects/learning-regex/ex003_character_sets $ ls file[1-3]
file1	file2	file3
~/projects/learning-regex/ex003_character_sets $ ls file*[1-3]
file1	file11	file12	file13	file2	file3
```

