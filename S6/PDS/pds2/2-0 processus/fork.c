#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

int main() {
    pid_t pid;
    int status;
    /* int *p = NULL; */

    printf("Père : PID=%d, PPID=%d\n", getpid(), getppid());

    printf("abc");
    fflush(stdout);

    pid = fork();
    switch(pid) {
        case -1:
            assert(0);

        case 0: /* fils */
            printf("Fils : PID=%d, PPID=%d\n", getpid(), getppid());
            sleep(2);
            printf("Fils : PID=%d, PPID=%d\n", getpid(), getppid());

            /* assert(0); /1* Pour voir une fin sur signal *1/ */
            /* *p = 10; */
            exit(123);

        default: /* père */
            printf("Père : PID=%d, PPID=%d\n", getpid(), getppid());
            printf("Mon fils : PID=%d\n", pid);

            sleep(2);
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
