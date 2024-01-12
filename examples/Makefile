plug: ex1_c ex2_c
	cat ex1.txt
	@make ex1_e
	cat ex1.txt
	echo "---"
	cat ex2.cpp
	@make ex2_e
	cat ex2.cpp

unplug: ex1_e ex2_e
	ex1_c
	ex2_c

ex1_e:
	../plug -f ex1.txt -d hw 'hello world' -g hw
ex1_c:
	../plug -f ex1.txt -u hw

ex2_e:
	../plug -f ex2.cpp -d code '	puts(hello world);' -g code
ex2_c:
	../plug -f ex2.cpp -u code
