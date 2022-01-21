for i in 1 2 3 4 5 6 '[' ']' '\' '!' '-' '/';do echo $i" abc "`date +%s` > special_file$i;sleep 1;done
