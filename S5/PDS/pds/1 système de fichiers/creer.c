#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>

int main() {
    int fd;

    fd = creat("/tmp/test", S_IRWXU);
    assert(fd != -1);

    fd = creat("test", S_IRWXU);
    assert(fd != -1);

    return 0;
}
