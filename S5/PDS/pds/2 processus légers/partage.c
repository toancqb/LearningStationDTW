#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <pthread.h>

int vg = 0;

void* fonction(void *arg) {
    assert(arg == NULL);
    printf("Début du thread, vg = %d\n", vg);
    vg++;
    sleep(2);
    printf("Fin du thread, vg = %d\n", vg);
    return NULL;
}

int main() {
    int r;
    pthread_t tid;

    printf("Début du main, vg = %d\n", vg);
    vg++;
    r = pthread_create(&tid, NULL, &fonction, NULL);
    assert(r == 0);
    sleep(1);
    printf("Milieu du main, vg = %d\n", vg);
    sleep(2);
    printf("Fin du main, vg = %d\n", vg);

    return 0;
}
