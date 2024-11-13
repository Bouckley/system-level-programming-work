#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

void enc(char msg[], int shift) {
	int msg_len = strlen(msg);
	for (int i = 0; i < msg_len; i++) {
		char ch = toupper(msg[i]);
        	if (isalpha(msg[i])) {
        		ch = (ch - 'A' + shift) % 26 + 'A';
		}
		else {
			char ch = ' ';
		}
		msg[i] = ch;
	}
	printf("%s\n", msg);
}

int main(int argc, char *argv[]) {
	if (argc != 3) {
		fprintf(stderr, "Usage: Number of arguments incorrect (Needs 2)");
		exit(1);
	}
	else {
		int shift = atoi(argv[1]);
		char *msg = argv[2];
		enc(msg, shift);
	}
}
