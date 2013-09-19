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

// Get count of numbers to be scanned
int count, i;
struct stat buf;
int err = fstat(fd, &buf);
if (err != 0) {
	fprintf(stderr, "Error checking file %s\n", argv[2]);
	exit(1);
}
count = (buf.st_size)/sizeof(entity);

// Allocate memory for the array to be scanned
entity *input =  NULL;
input = (entity *)malloc(sizeof(entity) * count);
if (input == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");
entity *output =  NULL;
output = (entity *)malloc(sizeof(entity) * count);
if (output == NULL)
	fprintf(stderr, "Error: Cannot allocate memory ");

// Get the file contents
int bytesRead = read(fd, input, buf.st_size);
if (bytesRead != buf.st_size) {
	perror("read");
 	exit(1);
}
close(fd);

// Prefix scan
struct timeval start, end;
gettimeofday(&start, NULL);
//output[0].key = input[0].key;
output[0].key = 0;
for (i=1; i<count; i++) {
	output[i].key = output[i-1].key + input[i-1].key;
}
gettimeofday(&end, NULL);
long int diff = (end.tv_usec + 1000000 * end.tv_sec) - (start.tv_usec + 1000000 * start.tv_sec);

// Result
printf("Input:");
for (i=0; i<count; i++)
	printf(" %d", input[i].key);
printf("\n");
printf("Output:");
for (i=0; i<count; i++)
	printf(" %d", output[i].key); 
printf("\n");
printf("Number of integers = %d\n", count);
printf("Last entry in scanned array = %d\n", input[count-1].key);
printf("Scan time = %ld uSec\n", diff);

// Cleanup
free(input);
free(output);
return (0);
}
