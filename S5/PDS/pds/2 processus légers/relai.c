#include <stdio.h>
#include <assert.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>

sem_t sem;
int res;

void *th(void *arg) {
    assert(arg == NULL);

    sleep(2);
    res = 123;

    assert(sem_post(&sem) == 0);

    sleep(2);

    return NULL;
}

int main() {
    pthread_t tid;

    assert(sem_init(&sem, 0, 0) == 0);
    assert(pthread_create(&tid, NULL, &th, NULL) == 0);

    sleep(1);
    printf("J’attends le résultat\n");
    assert(sem_wait(&sem) == 0);
    printf("Résultat trouvé : %d\n", res);

    pthread_exit(NULL);

    return 0;
}
