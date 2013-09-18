#include <stdio.h>

// Print usgae
void usgae (char *exe) {
fprintf(stderr, "Usage: %s -i inputfile\n", exe);
}

// Return index of smallest element
int find_smallest (int *array, int size) {
int index = 0;
int i;
for (i = 0; i < size; i++) {
	if (array[i] < array [index])
	index = i;	
}	
return index;
}

// For given array, swap elements with provided indices
void swap_elements (int *array, int index1, int index2) {
int temp;
temp = array[index1];
array[index1] = array[index2];
array[index2] = temp;
return;
}

int main (int argc, char *argv[]) {
usgae(argv[0]);
}
