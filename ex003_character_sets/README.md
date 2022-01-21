## Character sets - use single square brackets

> Character sets are like a specialized question mark wildcard. They match exactly one character, but we get to specify the possible matches by providing a list. To create a character set, you use single square brackets containing the list of characters you want to match.


### Setup

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

or you can use `generate.sh`

```
~/projects/learning-regex/ex003_character_sets $ ./generate.sh
./generate.sh: line 1: special_file/: No such file or directory
~/projects/learning-regex/ex003_character_sets $ cat ./generate.sh
for i in 1 2 3 4 5 6 '[' ']' '\' '!' '-' '/';do echo $i" abc "`date +%s` > special_file$i;sleep 1;done
```

### Escaping and special chars

``
~/projects/learning-regex/ex003_character_sets $ time for i in {1..20};do echo $i" abc\ "`date +%s` > file-$i;sleep 1;done

real	0m20.240s
user	0m0.051s
sys	0m0.086s
~/projects/learning-regex/ex003_character_sets $ time for i in {1..20};do echo $i" abc- "`date +%s` > file$i;sleep 1;done

real	0m20.225s
user	0m0.052s
sys	0m0.086s
``

this find files starting `file1` or `file2` or `file3`
```
~/projects/learning-regex/ex003_character_sets $ ls file[1-3]*
file1	file10	file11	file12	file13	file14	file15	file16	file17	file18	file19	file2	file20	file3
```


this find files starting `file1` or `file2` or `file3` or `file-`

```
~/projects/learning-regex/ex003_character_sets $ ls file[1-3-]*
file-1	file-11	file-13	file-15	file-17	file-19	file-20	file-4	file-6	file-8	file1	file11	file13	file15	file17	file19	file20
file-10	file-12	file-14	file-16	file-18	file-2	file-3	file-5	file-7	file-9	file10	file12	file14	file16	file18	file2	file3
```

similarly 

```
~/projects/learning-regex/ex003_character_sets $ grep 'abc[-\]' file*
file-1:1 abc\ 1642620873
file-10:10 abc\ 1642620882
file-11:11 abc\ 1642620883
file-12:12 abc\ 1642620884
file-13:13 abc\ 1642620885
file-14:14 abc\ 1642620886
file-15:15 abc\ 1642620887
file-16:16 abc\ 1642620888
file-17:17 abc\ 1642620889
file-18:18 abc\ 1642620890
file-19:19 abc\ 1642620891
file-2:2 abc\ 1642620874
file-20:20 abc\ 1642620892
file-3:3 abc\ 1642620875
file-4:4 abc\ 1642620876
file-5:5 abc\ 1642620877
file-6:6 abc\ 1642620878
file-7:7 abc\ 1642620879
file-8:8 abc\ 1642620880
file-9:9 abc\ 1642620881
file1:1 abc- 1642620906
file10:10 abc- 1642620915
file11:11 abc- 1642620916
file12:12 abc- 1642620917
file13:13 abc- 1642620918
file14:14 abc- 1642620919
file15:15 abc- 1642620920
file16:16 abc- 1642620921
file17:17 abc- 1642620922
file18:18 abc- 1642620923
file19:19 abc- 1642620924
file2:2 abc- 1642620907
file20:20 abc- 1642620925
file3:3 abc- 1642620908
file4:4 abc- 1642620909
file5:5 abc- 1642620910
file6:6 abc- 1642620911
file7:7 abc- 1642620912
file8:8 abc- 1642620913
file9:9 abc- 1642620914
```

lastly and this isn't strictly a character set but to search on a `\` you need to escape it i.e. `\\`
```
~/projects/learning-regex/ex003_character_sets $ grep 'abc\' file*
grep: trailing backslash (\)
~/projects/learning-regex/ex003_character_sets $ grep 'abc\\' file*
file-1:1 abc\ 1642620873
file-10:10 abc\ 1642620882
file-11:11 abc\ 1642620883
file-12:12 abc\ 1642620884
file-13:13 abc\ 1642620885
file-14:14 abc\ 1642620886
file-15:15 abc\ 1642620887
file-16:16 abc\ 1642620888
file-17:17 abc\ 1642620889
file-18:18 abc\ 1642620890
file-19:19 abc\ 1642620891
file-2:2 abc\ 1642620874
file-20:20 abc\ 1642620892
file-3:3 abc\ 1642620875
file-4:4 abc\ 1642620876
file-5:5 abc\ 1642620877
file-6:6 abc\ 1642620878
file-7:7 abc\ 1642620879
file-8:8 abc\ 1642620880
file-9:9 abc\ 1642620881
```
## more special chars

using a for loop to generate files with special characters in the name (typically you want to avoid filenames like this if possible):

```
~/projects/learning-regex/ex003_character_sets $  for i in 1 2 3 4 5 6 '[' ']' '\' '!' '-' '/';do echo $i" abc "`date +%s` > special_file$i;sleep 1;done
-bash: special_file/: No such file or directory
~/projects/learning-regex/ex003_character_sets $ head special_file*
==> special_file! <==
! abc 1642700758

==> special_file- <==
- abc 1642700759

==> special_file1 <==
1 abc 1642700749

==> special_file2 <==
2 abc 1642700750

==> special_file3 <==
3 abc 1642700751

==> special_file4 <==
4 abc 1642700752

==> special_file5 <==
5 abc 1642700753

==> special_file6 <==
6 abc 1642700754

==> special_file[ <==
[ abc 1642700755

==> special_file\ <==
\ abc 1642700757

==> special_file] <==
] abc 1642700756
```

now you can use regex for the special characters like `[` and `]` but 
* they have to be at the front of the list
* the order is important if you more 
```
~/projects/learning-regex/ex003_character_sets $ head special_file[1]
1 abc 1642700749
~/projects/learning-regex/ex003_character_sets $ head special_file[[1]
==> special_file1 <==
1 abc 1642700749

==> special_file[ <==
[ abc 1642700755
~/projects/learning-regex/ex003_character_sets $ head special_file[[]1]
head: special_file[[]1]: No such file or directory
~/projects/learning-regex/ex003_character_sets $ head special_file[[1]
==> special_file1 <==
1 abc 1642700749

==> special_file[ <==
[ abc 1642700755
```

