#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

// Print usgae
void usgae (char *exe) {
fprintf(stderr, "Usage: %s -i inputfile\n", exe);
exit(1);
}

// Return index of smallest element
int find_smallest (long int *array, int size) {
int index = 0;
int i;
for (i = 0; i < size; i++) {
	if (array[i] < array[index])
	index = i;	
}	
return index;
}

// For given array, swap elements with provided indices
void swap_elements (long int *array, int index1, int index2) {
long int temp;
temp = array[index1];
array[index1] = array[index2];
array[index2] = temp;
return;
}

// compare function for qsort
int compare (const void *a, const void *b) {
const long *rec1 = a;
const long *rec2 = b;
return ((int)(*rec1) - (int)(*rec2));
}


int main (int argc, char *argv[]) {
// Check for valid input arguments
if (argc != 3)
	usgae(argv[0]);
if (strcmp(argv[1], "-i"))
	usgae(argv[0]);

// Check for valid input file
FILE *fp = fopen(argv[2], "r");
int count=0, i;
char numString[15];
if (fp == NULL) {
	perror("open");
	exit(1);
}
while (fgets(numString, 15, fp) != NULL) 
	count++;

// Allocate memory for the array to be sorted
long int *randomArray =  NULL;
randomArray = (long int *)malloc(sizeof(long int) * count);
if (randomArray == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");

// Copy numbers from file to heap storage
fseek(fp, 0, SEEK_SET);
i = 0;
while (fgets(numString, 15, fp) != NULL) {
	randomArray[i] = atol(numString);
	i++;
}

// Sort the array
int smallestIndex;
struct timeval start1, end1;
gettimeofday(&start1, NULL);
for (i = 0; i < count; i++) {
	smallestIndex = find_smallest((randomArray + i), (count - i));
	swap_elements(randomArray + i, 0, smallestIndex);
}
gettimeofday(&end1, NULL);
long int diff1 = (end1.tv_usec + 1000000 * end1.tv_sec) - (start1.tv_usec + 1000000 * start1.tv_sec);

// Repeat for qsort
fseek(fp, 0, SEEK_SET);

// Sort the array with qsort
struct timeval start2, end2;
gettimeofday(&start2, NULL);
qsort(randomArray, count, sizeof(long int), compare);
gettimeofday(&end2, NULL);
long int diff2 = (end2.tv_usec + 1000000 * end2.tv_sec) - (start2.tv_usec + 1000000 * start2.tv_sec);


// Print the required details
//for (i = 0; i < count; i++) {
//	printf("%ld\t", randomArray[i]);
//}
printf("Number of integers read = %d\n", count);
printf("Smallest integer = %ld\n", randomArray[0]);
printf("Largest integer = %ld\n", randomArray[count-1]);
printf("Time spent in selection sort = %ld uSec\n", diff1);
printf("Time spent in quick sort = %ld uSec\n", diff2);

// Cleanup
free(randomArray);
return (0);
}
