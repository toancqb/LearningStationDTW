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
