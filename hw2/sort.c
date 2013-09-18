#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

typedef struct __entity {
    int key;
    char newline;
} entity;

// Print usgae
void usgae (char *exe) {
fprintf(stderr, "Usage: %s -i inputfile\n", exe);
exit(1);
}

// Return index of smallest element
int find_smallest (entity *array, int size) {
int index = 0;
int i;
for (i = 0; i < size; i++) {
	if (array[i].key < array[index].key)
	index = i;	
}	
return index;
}

// For given array, swap elements with provided indices
void swap_elements (entity *array, int index1, int index2) {
int temp;
temp = array[index1].key;
array[index1].key = array[index2].key;
array[index2].key = temp;
return;
}

int main (int argc, char *argv[]) {
// Check for valid input arguments
if (argc != 3)
	usgae(argv[0]);
if (strcmp(argv[1], "-i"))
	usgae(argv[0]);

// Check for valid input file
char *inputfile = argv[2];
int fd = open(inputfile, O_RDONLY);
if (fd < 0) {
	perror("open");
	exit(1);
    }

// Get count of numbers to be sorted
int count;
struct stat buf;
int err = fstat(fd, &buf);
if (err != 0) {
	fprintf(stderr, "Error checking file %s\n", argv[2]);
	exit(1);
}
count = (buf.st_size)/sizeof(entity);

// Allocate memory for the array to be sorted
entity *randomArray =  NULL;
randomArray = (entity *)malloc(sizeof(entity) * count);
if (randomArray == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");

// Get the file contents
int bytesRead = read(fd, randomArray, buf.st_size);
if (bytesRead != buf.st_size) {
	perror("read");
 	exit(1);
}

// Sort the array
int i, smallestIndex;
struct timeval start1, end1;
gettimeofday(&start1, NULL);
for (i = 0; i < count; i++) {
	smallestIndex = find_smallest((randomArray + i), (count - i));
	swap_elements(randomArray + i, 0, smallestIndex);
}
gettimeofday(&end1, NULL);
long int diff = (end1.tv_usec + 1000000 * end1.tv_sec) - (start1.tv_usec + 1000000 * start1.tv_sec);


// Print the required details
//for (i = 0; i < count; i++) {
//	printf("%d\n", randomArray[i].key);
//}
Printf("Selection sort metrics:\n");
printf("\tNumber of integers read = %d\n", count);
printf("\tSmallest integer = %d\n", randomArray[0].key);
printf("\tLargest integer = %d\n", randomArray[count-1].key);
printf("\tTime spend sorting = %ldms\n", diff/1000);

// Cleanup
free(randomArray);
return (0);
}
