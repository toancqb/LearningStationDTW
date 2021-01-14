//compteurs.c

#include <stdio.h>
#include <pthread.h>
#include <assert.h>

#define ITER 100000000

volatile int c1 = 0;
int c2 = 0;
int c3 = 0;

void *th_compteur(void *arg) {
    int i;

    assert(arg == NULL);

    for (i = 0; i < ITER; i++) {
        c1++;
        c2++;
    }

    return NULL;
}

int main() {
    pthread_t tid;
    int r, i;

    r = pthread_create(&tid, NULL, &th_compteur, NULL);
    assert(r == 0);

    for (i = 0; i < ITER; i++) {
        c1++;
        c3++;
    }

    r = pthread_join(tid, NULL);
    assert(r == 0);

    printf("%d = %d + %d = %d\n", c1, c2, c3, c2 + c3);


    return 0;
}

// Resultat:
// 135125747 = 100000000 + 100000000 = 200000000
