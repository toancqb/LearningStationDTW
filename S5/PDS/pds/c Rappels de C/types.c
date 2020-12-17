#include <stdio.h>
#include <unistd.h>

struct exemple_s {
    int b;
    char tampon[12];
};

int main() {
    struct exemple_s x;

    printf("%lu\n", sizeof(int));
    printf("%lu\n", sizeof(char));
    printf("%lu\n", sizeof(struct exemple_s));

    x.b = 0x41424344;
    x.tampon[0]  = '0';
    x.tampon[1]  = '1';
    x.tampon[2]  = '2';
    x.tampon[3]  = '3';
    x.tampon[4]  = '4';
    x.tampon[5]  = '5';
    x.tampon[6]  = '6';
    x.tampon[7]  = '7';
    x.tampon[8]  = '8';
    x.tampon[9]  = '9';
    x.tampon[10] = 'a';
    x.tampon[11] = 'b';

    printf("x est à l’adresse : %p\n", &x);
    write(STDOUT_FILENO, &x, sizeof(struct exemple_s));
    /* affiche DCBA0123456789ab */

    return 0;
}
