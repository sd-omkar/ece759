#include <iostream>
#include <stdio.h>

int main () {
int d;
char c;
short s;
int *p;
int arr[2];

p = &d;
*p = 10;
c = (char)1;

p = arr;
*(p+1) = 5;
p[0] = d;

*((char*)p + 1) = c;
printf("sizeof p = %d\n", sizeof(p));
return 0;
}

// Answers:
// 1) p = 0 @7, 0x7fffffffdcc0 @10, 0x7fffffffdcb0 @14, sizeof(p) = 8 bytes
// 2) address of p = 0x7fffffffdcc8, address of c = 0x7fffffffdcc5
// 3) arr[0] = 10
// 4) 266
// 5) initially arr[0] = 10 = 000A
// 	then, 1 at 2^8, so 256 + 10 = 266
