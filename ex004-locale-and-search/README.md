## How locale settings affect search


### generate.sh to create files with alphanumeric chars, accentuated chars, punctuation, spaces …

```
~/projects/learning-regex/ex004-locale-and-search $ cat generate.sh
time for i in ' ' '\t' '\n' 1 2 3  á  é  í  ó  ú A E I O U a e i o u b c d f D F G H '[' ']' '\' '!' '-' '/' ;do echo $i" abc "`date +%s` >> "file$i.txt";sleep 1;done
ls -ltr
~/projects/learning-regex/ex004-locale-and-search $ ./generate.sh
./generate.sh: line 1: file/.txt: No such file or directory

real	0m35.393s
user	0m0.090s
sys	0m0.138s
...
-rw-r--r--  1 dave  staff  3572 Jan 21 21:52 README.md
-rwxr-xr-x  1 dave  staff   180 Jan 22 21:05 generate.sh
-rw-r--r--  1 dave  staff    16 Jan 22 21:05 file .txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 file\t.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 file\n.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:05 file1.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:05 file2.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:05 file3.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 fileá.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 fileé.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 fileí.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 fileó.txt
-rw-r--r--  1 dave  staff    18 Jan 22 21:05 fileú.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:05 fileA.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:05 fileE.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:05 fileI.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:05 fileO.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:06 fileU.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 fileb.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 filec.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:06 filed.txt
-rw-r--r--  1 dave  staff    34 Jan 22 21:06 filef.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 fileG.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 fileH.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 file[.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 file].txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 file\.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 file!.txt
-rw-r--r--  1 dave  staff    17 Jan 22 21:06 file-.txt
```

now filtering by alphanumeric chars, accentuated chars, punctuation, spaces …
```
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:punct:]].txt
file!.txt	file-.txt	file[.txt	file\.txt	file].txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:space:]].txt
file .txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:digit:]].txt
file1.txt	file2.txt	file3.txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:alpha:]].txt
fileA.txt	fileG.txt	fileI.txt	fileU.txt	filec.txt	filef.txt	fileé.txt	fileó.txt
fileE.txt	fileH.txt	fileO.txt	fileb.txt	filed.txt	fileá.txt	fileí.txt	fileú.txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:upper:]].txt
fileA.txt	fileE.txt	fileG.txt	fileH.txt	fileI.txt	fileO.txt	fileU.txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:lower:]].txt
fileb.txt	filec.txt	filed.txt	filef.txt	fileá.txt	fileé.txt	fileí.txt	fileó.txt	fileú.txt
~/projects/learning-regex/ex004-locale-and-search $ ls file[[:alnum:]].txt
file1.txt	file3.txt	fileE.txt	fileH.txt	fileO.txt	fileb.txt	filed.txt	fileá.txt	fileí.txt	fileú.txt
file2.txt	fileA.txt	fileG.txt	fileI.txt	fileU.txt	filec.txt	filef.txt	fileé.txt	fileó.txt
```


### Surprise issue with bash case mixing upper and lower case in file operations

I was expecting this to generate 5 files
* 5 accented lower case vowels
* 5 upper case vowels
* lower case vowels


```
~/projects/learning-regex/ex004-locale-and-search $ for i in á  é  í  ó  ú A E I O U a e i o u;do echo $i" abc "`date +%s` > accented_file$i;sleep 1;done
~/projects/learning-regex/ex004-locale-and-search $ ls accented_file[A-o]*
accented_fileA	accented_fileE	accented_fileI	accented_fileO	accented_fileU
~/projects/learning-regex/ex004-locale-and-search $ ls -ltr
total 80
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileá
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileé
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileí
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileó
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileú
-rw-r--r--  1 dave  staff  17 Jan 21 21:31 accented_fileA
-rw-r--r--  1 dave  staff  17 Jan 21 21:31 accented_fileE
-rw-r--r--  1 dave  staff  17 Jan 21 21:31 accented_fileI
-rw-r--r--  1 dave  staff  17 Jan 21 21:31 accented_fileO
-rw-r--r--  1 dave  staff  17 Jan 21 21:31 accented_fileU
```

so I appear to be missing the lower case vowels?

Here are my locale settins (not sure if this is relevant)

```
~/projects/learning-regex/ex004-locale-and-search $ locale
LANG=
LC_COLLATE="C"
LC_CTYPE="UTF-8"
LC_MESSAGES="C"
LC_MONETARY="C"
LC_NUMERIC="C"
LC_TIME="C"
LC_ALL=
```

Focusing on generating just the lower case files:
```
~/projects/learning-regex/ex004-locale-and-search $ for i in a e i o u;do echo $i" abc "`date +%s` > accented_file$i;sleep 1;done
~/projects/learning-regex/ex004-locale-and-search $ ls -ltr
total 80
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileá
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileé
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileí
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileó
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileú
-rw-r--r--  1 dave  staff  17 Jan 21 21:39 accented_fileA
-rw-r--r--  1 dave  staff  17 Jan 21 21:39 accented_fileE
-rw-r--r--  1 dave  staff  17 Jan 21 21:39 accented_fileI
-rw-r--r--  1 dave  staff  17 Jan 21 21:39 accented_fileO
-rw-r--r--  1 dave  staff  17 Jan 21 21:39 accented_fileU
```
as above 
* this still doesn't work i.e. no lower case files (final character)
* the timestamp is updated on the upper case files ?


checking my script 

```
~/projects/learning-regex/ex004-locale-and-search $ for i in a e i o u;do echo $i;done
a
e
i
o
u
```

and confirming that this is updating by replacing '>' with '>>'
```
~/projects/learning-regex/ex004-locale-and-search $ for i in a e i o u;do echo $i" abc "`date +%s` >> accented_file$i;sleep 1;done
~/projects/learning-regex/ex004-locale-and-search $ ls -ltr
total 80
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileá
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileé
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileí
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileó
-rw-r--r--  1 dave  staff  18 Jan 21 21:30 accented_fileú
-rw-r--r--  1 dave  staff  34 Jan 21 21:41 accented_fileA
-rw-r--r--  1 dave  staff  34 Jan 21 21:41 accented_fileE
-rw-r--r--  1 dave  staff  34 Jan 21 21:41 accented_fileI
-rw-r--r--  1 dave  staff  34 Jan 21 21:41 accented_fileO
-rw-r--r--  1 dave  staff  34 Jan 21 21:41 accented_fileU
~/projects/learning-regex/ex004-locale-and-search $ cat accented_fileA
a abc 1642797580
a abc 1642797694
```
