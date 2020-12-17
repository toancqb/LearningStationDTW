#include <sys/types.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>

int main() {
    off_t pos;

    pos = lseek(STDIN_FILENO, 10, SEEK_CUR);
    if(pos == -1) {
        perror("seek");
    } else {
        printf("%ld\n", pos);
    }

    pos = lseek(STDIN_FILENO, 10, SEEK_CUR);
    if(pos == -1) {
        perror("seek");
    } else {
        printf("%ld\n", pos);
    }

    return 0;
}
