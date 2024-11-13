#include <math.h>
#include <stdio.h>
#include <stdlib.h>

const double PI = 3.1415926535897931;

void normpdf(double x, double *pdf) {
	*pdf = (1 / (sqrt(2 * PI))) * exp(-(x*x) / 2);
    // ...
}

void fmtstr(unsigned int width, unsigned int precision, char s[]) {
	unsigned int i = 0;
	s[i++] = '%';         // fills in s[0] and sets i to 1 so that you can
	                      // fill in the next element of s
    // ...
	if (width <= 9) {
		s[i++] = '0' + (width % 10);
	}
	else {
		s[i++] = '0' + (width / 10);
		s[i++] = '0' + (width % 10);
	}
	s[i++] = '.';
	if (precision <= 9) {
		s[i++] = '0' + (precision);
	}
	else {
		s[i++] = '0' + (precision / 10);
		s[i++] = '0' + (precision % 10);
	}
	s[i++] = 'f';
	s[i++] = '\0';
}


int main(int argc, char *argv[]) {
    // ...
	if (argc == 2) {
		double elem = atof(argv[1]);
		double pdf;
		normpdf(elem, &pdf);
		char elemstr[8];
		for (int i = 0; i < 16; i++) {
			fmtstr(20, i, elemstr);
			printf(elemstr, pdf);
			printf("\n");
		}
	}
	else {
		fprintf(stderr, "Usage: Error in number of arguments");
		exit(1);
	}
	return 0;
}
