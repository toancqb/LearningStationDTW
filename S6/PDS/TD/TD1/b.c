#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    int i;
    pid_t pid;

    for (i = 0; i < 3; i++) {
        pid = fork();
        if (pid == -1) {        /* erreur */
            perror("erreur fork");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {  /* fils */
            fprintf(stderr, "[%d<-%d] fils : %d\n", getpid(), getppid(), i);
        } else {                /* pere */
            fprintf(stderr, "[%d<-%d] pere : %d\n", getpid(), getppid(), i);
        }
    }
    exit(EXIT_SUCCESS);
}
