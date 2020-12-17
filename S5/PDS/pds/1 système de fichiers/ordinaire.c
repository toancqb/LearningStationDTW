#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>

int main(int argc, char **argv) {
    struct stat st;
    int res;
    assert(argc > 1);
    printf("argv[0]: %s\n", argv[0]);
    printf("argv[1]: %s\n", argv[1]);

    res = stat(argv[1], &st);
    assert(res != -1);
    if(S_ISREG(st.st_mode))
        printf("Fichier ordinaire\n");
    else
        printf("Autre type\n");

    return 0;
}
