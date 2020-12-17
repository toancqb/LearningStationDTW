#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <assert.h>

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

struct fonct_arg_s {
    char c;
    unsigned int nb;

    int res;
};

void *fonct_wrapper(void *arg) {
    struct fonct_arg_s *p_arg = arg;

    p_arg->res = fonct(p_arg->c, p_arg->nb);

    return NULL;
}

int main() {
    pthread_t tid;
    int r;
    struct fonct_arg_s fa;

    fa.c = '.';
    fa.nb = 1000;
    r = pthread_create(&tid, NULL, &fonct_wrapper, &fa);
    assert(r == 0);

    fonct('|', 1000);

    r = pthread_join(tid, NULL);
    assert(r == 0);
    printf("Valeur de retour de la fonction exécutée dans le thread : %d\n", fa.res);

    return 0;
}
