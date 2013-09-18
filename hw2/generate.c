#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>

typedef struct __entity {
    int key;
    char newline;
} entity;

void
usage(char *prog) 
{
    fprintf(stderr, "usage: %s <-s random seed> <-n number of records> <-o output file>\n", prog);
    exit(1);
}

int
main(int argc, char *argv[])
{
    // arguments
    int randomSeed  = 0;
    int recordsLeft = 0;
    char *outFile   = "/no/such/file";

    // input params
    int c;
    opterr = 0;
    while ((c = getopt(argc, argv, "n:s:o:")) != -1) {
	switch (c) {
	case 'n':
	    recordsLeft = atoi(optarg);
	    break;
	case 's':
	    randomSeed  = atoi(optarg);
	    break;
	case 'o':
	    outFile     = strdup(optarg);
	    break;
	default:
	    usage(argv[0]);
	}
    }

    // seed random number generator
    srand(randomSeed);

    // open and create output file
    int fd = open(outFile, O_WRONLY|O_CREAT|O_TRUNC, S_IRWXU);
    if (fd < 0) {
	perror("open");
	exit(1);
    }

    entity randomArray[recordsLeft];
    int i, rc;
    char newline = '\n';
    for (i = 0; i < recordsLeft; i++) {
	// fill in random key
	randomArray[i].key = -10 + rand() % 20;
	randomArray[i].newline= '\n';
	rc = write(fd, randomArray+i, sizeof(entity));
	if (rc != sizeof(entity)) {
	    perror("write");
	    exit(1);
	}
    }

    // ok to ignore error code here, because we're done anyhow...
    (void) close(fd);

    return 0;
}

