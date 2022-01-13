~/projects/learning-regex/ex001_intro_to_glob_and_regex $ head file*
==> file1 <==
1 abc Wed Jan 12 21:54:11 CET 2022

==> file2 <==
2 abc Wed Jan 12 21:54:12 CET 2022

==> file3 <==
3 abc Wed Jan 12 21:54:13 CET 2022

==> file4 <==
4 abc Wed Jan 12 21:54:14 CET 2022
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ grep ^2  file*
file2:2 abc Wed Jan 12 21:54:12 CET 2022
~/projects/learning-regex/ex001_intro_to_glob_and_regex $ grep ^[2-3]  file*
file2:2 abc Wed Jan 12 21:54:12 CET 2022
file3:3 abc Wed Jan 12 21:54:13 CET 2022
