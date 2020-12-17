#include <unistd.h>
#include <stdio.h>

/* On veut exécuter deux appels à la fonction « fonct » de façon
 * concurrente */

int fonct(char c, unsigned int nb) {
    unsigned int i;
    for (i = 0; i < nb; i++) {
        putchar(c);
        fflush(stdout);
        usleep(100000);
    }
    return 1234;
}

int main() {
    fonct('.', 1000);
    fonct('|', 1000);

    return 0;
}
