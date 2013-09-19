#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int count_chars(int argc, char **argv) {
int count = 0;
int i;
for (i = 1; i < argc; i++) {
	count += strlen(argv[i]);
}
return count;
}

int main (int argc, char *argv[]) {
if (argc < 2) { 
	printf("Usage: %s \"Input String\"\n", argv[0]);
	exit(1);
}
else {
	printf("String length = %d\n", count_chars(argc, argv));
	return 0;
}
}
