#include <unistd.h>
#include <assert.h>

/* Commande qui exécute ls -al */

int main(int argc, char *argv[], char *envp[]) {
    char *argv_ls[] = { "ls", "-al", (char *) NULL };

    assert(argc > 0);
    assert(argv[0] != NULL);

    /* execl("/bin/ls", "ls", "-al", (char *) NULL); */
    /* assert(0); */

    /* execlp("ls", "ls", "-al", (char *) NULL); */
    /* assert(0); */

    execvp("ls", argv_ls);
    assert(0);

    execve("/bin/ls", argv_ls, envp);
    assert(0);

    return 12;
}
