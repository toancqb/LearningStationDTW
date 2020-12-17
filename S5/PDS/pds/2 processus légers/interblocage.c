#include <semaphore.h>
#include <stdio.h>
#include <pthread.h>
#include <assert.h>
#include <unistd.h>

sem_t sem1, sem2;

void *th(void *arg) {
    assert(arg == NULL);

    assert(sem_wait(&sem1) == 0);
    printf("thrd: J’ai pris sem1\n");
    sleep(1);
    assert(sem_wait(&sem2) == 0);
    printf("thrd: J’ai pris sem2\n");

    sleep(1);

    assert(sem_post(&sem2) == 0);
    printf("thrd: J’ai relâché sem2\n");

    assert(sem_post(&sem1) == 0);
    printf("thrd: J’ai relâché sem1\n");

    return NULL;
}

int main() {
    pthread_t tid;

    assert(sem_init(&sem1, 0, 1) == 0);
    assert(sem_init(&sem2, 0, 1) == 0);

    assert(pthread_create(&tid, NULL, &th, NULL) == 0);

    assert(sem_wait(&sem2) == 0);
    printf("main: J’ai pris sem2\n");
    sleep(1);
    assert(sem_wait(&sem1) == 0);
    printf("main: J’ai pris sem1\n");

    sleep(1);

    assert(sem_post(&sem1) == 0);
    printf("main: J’ai relâché sem1\n");

    assert(sem_post(&sem2) == 0);
    printf("main: J’ai relâché sem2\n");

    assert(pthread_join(tid, NULL) == 0);

    return 0;
}
