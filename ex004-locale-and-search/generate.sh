time for i in ' ' '\t' '\n' 1 2 3  á  é  í  ó  ú A E I O U a e i o u b c d f D F G H '[' ']' '\' '!' '-' '/' ;do echo $i" abc "`date +%s` >> "file$i.txt";sleep 1;done
ls -ltr
