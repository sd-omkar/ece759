#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>

typedef struct __entity {
    int key;
    char newline;
} entity;

void
usage(char *prog) 
{
    fprintf(stderr, "usage: %s <-i file>\n", prog);
    exit(1);
}

int
main(int argc, char *argv[])
{
    // arguments
    char *inFile = "/no/such/file";

    // input params
    int c;
    opterr = 0;
    while ((c = getopt(argc, argv, "i:")) != -1) {
	switch (c) {
	case 'i':
	    inFile = strdup(optarg);
	    break;
	default:
	    usage(argv[0]);
	}
    }

    // open and create output file
    int fd = open(inFile, O_RDONLY);
    if (fd < 0) {
	perror("open");
	exit(1);
    }

    while (1) {	
	int rc;
	char newline;
	entity single;
	rc = read(fd, &single, sizeof(entity));
	if (rc == 0) // 0 indicates EOF
	    break;
	if (rc < 0) {
	    perror("read");
	    exit(1);
	}
	printf("%d", single.key);
	printf("%c", single.newline);
    }
    
    (void) close(fd);
    return 0;
}

