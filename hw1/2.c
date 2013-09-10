#include <stdio.h>
#include <stdlib.h>

int main () {
long int myID = 9069798065;
char myIDString[11];
sprintf(myIDString, "%ld", myID);
myIDString[3] = '\0';
printf("Hello! I\'m student %s\n", myIDString);
return 0; 
}
