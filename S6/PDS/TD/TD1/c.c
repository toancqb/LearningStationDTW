
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <wait.h>

pid_t ifork() {
    fprintf(stderr, "fork() %d ? (^C to abort) ", getpid());
    fflush(stderr);
    getchar();
    return fork();
}

int main()
{
	int i;
    pid_t pid;

    for (i = 0; i < 4; i++) {
        pid = ifork();
        if (pid == -1) {        /* erreur */
            perror("erreur fork");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {  /* fils */
            fprintf(stderr, "[%d] fils : %d\n", getpid(), i);
        } /*else {                
            fprintf(stderr, "[%d] pere : %d\n", getpid(), i);
        }*/
    }
    exit(EXIT_SUCCESS);
}