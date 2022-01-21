## How locale settings affect search

to be completed

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
