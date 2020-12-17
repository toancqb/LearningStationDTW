#include <semaphore.h>
#include <assert.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

#define TAILLE_DONNEE 32
#define TAILLE_FILE   10
#define ITER          1000000

typedef struct donnee_s {
    char ch[TAILLE_DONNEE];
} donnee_t;

donnee_t file[TAILLE_FILE];
int premier_libre;
int premier_occupe;
sem_t sem_libre;
sem_t sem_occup;

void *producteur(void * arg) {
    int i;

    assert(arg == NULL);

    for (i = 0; i < ITER; i++) {
        assert(sem_wait(&sem_libre) != -1);
        snprintf(file[premier_libre].ch, TAILLE_DONNEE, "Donnée %d", i);
        printf("P: %s\n", file[premier_libre].ch);
        fflush(stdout);
        premier_libre = (premier_libre + 1) % TAILLE_FILE;
        assert(sem_post(&sem_occup) != -1);
    }

    return NULL;
}

void *consommateur(void * arg) {
    int i;

    assert(arg == NULL);

    for (i = 0; i < ITER; i++) {
        assert(sem_wait(&sem_occup) != -1);
        printf("C: %s\n", file[premier_occupe].ch);
        fflush(stdout);
        premier_occupe = (premier_occupe + 1) % TAILLE_FILE;
        assert(sem_post(&sem_libre) != -1);
    }

    return NULL;
}

int main() {
    pthread_t tid;

    premier_libre = 0;
    premier_occupe = 0;

    assert(sem_init(&sem_libre, 0, TAILLE_FILE) != -1);
    assert(sem_init(&sem_occup, 0, 0) != -1);

    assert(pthread_create(&tid, NULL, &producteur, NULL) == 0);
    consommateur(NULL);
    assert(pthread_join(tid, NULL) == 0);

    return 0;
}
