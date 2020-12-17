#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>

#define TAILLE_TAMPON 1024

int main(int argc, char *argv[]) {
    int fdsrc, fddst;
    char tampon[TAILLE_TAMPON];
    int lus, ecrits;

    assert(argc > 2);

    /* On veut ouvrir argv[1] en lecture, on veut créer argv[2] */
    fdsrc = open(argv[1], O_RDONLY);
    assert(fdsrc != -1);
    fddst = open(argv[2], O_WRONLY|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP);
    assert(fddst != -1);

    while((lus = read(fdsrc, tampon, TAILLE_TAMPON * sizeof(char))) > 0) {
        ecrits = write(fddst, tampon, lus);
        assert(ecrits == lus);
    }

    close(fdsrc);
    close(fddst);

    return 0;
}
