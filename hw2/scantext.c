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

// Allocate memory for the array to be scanned
int *input =  NULL;
input = (int *)malloc(sizeof(int) * count);
if (input == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");
int *output =  NULL;
output = (int *)malloc(sizeof(int) * count);
if (output == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");

// Copy numbers from file to heap storage
fseek(fp, 0, SEEK_SET);
i = 0;
while (fgets(numString, 15, fp) != NULL) {
	input[i] = atoi(numString);
	i++;
}

// Prefix scan
struct timeval start, end;
gettimeofday(&start, NULL);
//output[0] = input[0];
output[0] = 0;
for (i=1; i<count; i++) {
	output[i] = output[i-1] + input[i-1];
}
gettimeofday(&end, NULL);
long int diff = (end.tv_usec + 1000000 * end.tv_sec) - (start.tv_usec + 1000000 * start.tv_sec);

// Result
/*
printf("Input:");
for (i=0; i<count; i++)
	printf(" %d", input[i]);
printf("\n");
printf("Output:");
for (i=0; i<count; i++)
	printf(" %d", output[i]); 
printf("\n");
*/
printf("Number of integers = %d\n", count);
printf("Last entry in input array = %d\n", input[count-1]);
printf("Last entry in scanned array = %d\n", output[count-1]);
printf("Scan time = %ld uSec\n", diff);

// Cleanup
free(input);
free(output);
return (0);
}
