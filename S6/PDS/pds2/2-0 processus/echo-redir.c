#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <assert.h>


int main() {
    int fd;

    switch (fork()) {
    case -1:
        exit(EXIT_FAILURE);

    case 0:                    /* Fils */
        fd = open("log", O_WRONLY | O_CREAT | O_TRUNC, 0644);
        assert(fd != -1);
        assert(dup2(fd, STDOUT_FILENO) != -1);
        /* ici, fd et STDOUT_FILENO sont le même fichier ! */
        close(fd);
        execlp("echo", "echo", "12345", (char *)NULL);
        assert(0);

    default:                   /* Père */
        assert(wait(NULL) != -1);
    }

    return 0;
}
