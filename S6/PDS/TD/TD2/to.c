/* to log echo oui */
/* to log "echo oui" "echo non" */

/* exec */
/* dup2 */
/* open */

/* |              */
/* +------------+ */
/* |            | */
/* |            | */
/* |            | */
/* |            | */
/* +-----+      | */
/* |     |      | */
/* |     |      | */
/* |     |      | */

/*    |            */
/*    |            */
/*    | open       */
/*    | dup2       */
/*    |            */
/*    |            */
/*    | exec       */
/*    |            */

/* STDIN_FILENO */
/* STDOUT_FILENO */
/* STDERR_FILENO */

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <assert.h>
#include <unistd.h>

int main() {
    int fd;

    fd = open("log", O_WRONLY|O_CREAT|O_TRUNC, 0644);
    assert(fd != -1);

    assert(dup2(fd, STDOUT_FILENO) != -1);
    /* maintenant
     *   write(fd, ...
     * et
     *   write(STDOUT_FILENO, ...
     * font _exactement_ la même chose
     */
    close(fd);

    printf("oui");

    return 0;
}
