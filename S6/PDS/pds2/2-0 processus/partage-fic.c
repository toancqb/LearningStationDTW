#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>

int main() {
    int fd;
    char c;

    fd = open("chiffres", O_RDONLY);
    assert(fd != -1);

    assert(lseek(fd, 3, SEEK_SET) != -1);

    switch (fork()) {
    case -1:
        exit(EXIT_FAILURE);

    case 0:                    /* Fils */
        sleep(1);
        assert(read(fd, &c, 1) == 1);
        printf("Fils : %c\n", c);
        exit(EXIT_SUCCESS);

    default:                   /* Père */
        sleep(2);
        assert(read(fd, &c, 1) == 1);
        printf("Père : %c\n", c);
        exit(EXIT_SUCCESS);
    }

    return 0;
}
