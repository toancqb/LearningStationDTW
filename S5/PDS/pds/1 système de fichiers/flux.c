#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>

#define TAILLE_TAMPON 1024

int main() {
    char tampon[TAILLE_TAMPON];
    int lus, ecrits;

    while((lus = read(STDIN_FILENO, tampon, TAILLE_TAMPON * sizeof(char))) > 0) {
        ecrits = write(STDOUT_FILENO, tampon, lus);
        assert(ecrits == lus);
    }

    return 0;
}
