//creation.c

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <pthread.h>

void *fonction(void *arg) {
    int i;
    assert(arg == NULL);

    for (i = 0; i < 10; i++) {
        printf("Hello world from thread (%d)\n", i);
    }

    /* exit(12); */

    return NULL;
}

int main() {
    pthread_t tid;
    int r, i;

    r = pthread_create(&tid, NULL, &fonction, NULL);
    /* déclenche « fonction(NULL); » */
    assert(r == 0);

    for (i = 0; i < 10; i++) {
        printf("Hello world from main (%d)\n", i);
    }

    pthread_exit(NULL);

    return 45;
}

// Resultat
/*
 Hello world from main (0)
Hello world from main (1)
Hello world from main (2)
Hello world from main (3)
Hello world from main (4)
Hello world from main (5)
Hello world from main (6)
Hello world from main (7)
Hello world from main (8)
Hello world from main (9)
Hello world from thread (0)
Hello world from thread (1)
Hello world from thread (2)
Hello world from thread (3)
Hello world from thread (4)
Hello world from thread (5)
Hello world from thread (6)
Hello world from thread (7)
Hello world from thread (8)
Hello world from thread (9)
*/