#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>
#include <limits.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    int fd;
    char chemin[PATH_MAX];

    assert(argc > 1);

    /* Comment concaténer argv[1] et "test" */
    snprintf(chemin, PATH_MAX, "%s/%s", argv[1], "test");

    fd = creat(chemin, S_IRWXU);
    assert(fd != -1);

    return 0;
}
