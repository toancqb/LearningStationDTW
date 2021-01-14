#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/* Pas de partage des variables */

int main() {
    pid_t pid;
    int status;
    int i = 123;
    int *p;

    p = malloc(sizeof(int));
    assert(p != NULL);
    *p = 456;

    printf("Père : PID=%d, PPID=%d\n", getpid(), getppid());

    pid = fork();
    switch(pid) {
        case -1:
            assert(0);

        case 0: /* fils */
            printf("Fils : PID=%d, PPID=%d\n", getpid(), getppid());
            printf("Fils : %d, %d\n", i, *p);

            printf("&i = %p\n", &i);
            printf("p  = %p\n", p);

            i++;
            (*p)++;
            sleep(3);
            printf("Fils : %d, %d\n", i, *p);
            printf("Fils : PID=%d, PPID=%d\n", getpid(), getppid());

            sleep(1000);
            exit(123);

        default: /* père */
            printf("Père : PID=%d, PPID=%d\n", getpid(), getppid());
            printf("&i = %p\n", &i);
            printf("p  = %p\n", p);

            printf("Mon fils : PID=%d\n", pid);
            sleep(2);
            printf("Père : %d, %d\n", i, *p);
            i++;
            (*p)++;
            printf("Père : %d, %d\n", i, *p);

            printf("Déclenchement de wait\n");
            pid = wait(&status);
            assert(pid != -1);
            if(WIFEXITED(status)) {
                printf("Fils terminé normalement : %d\n", WEXITSTATUS(status));
            } else if(WIFSIGNALED(status)) {
                printf("Fils terminé sur signal : %d\n", WTERMSIG(status));
            }

            exit(EXIT_SUCCESS);
    }
}
