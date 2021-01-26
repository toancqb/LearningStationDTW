/* on test -r on.c do echo oui */

/* execlp("test", "test", "-r", "on.c", (char*)NULL); */

/* char *argv[4];        */
/* argv[0] = "test";     */
/* argv[1] = "-r";       */
/* argv[2] = "on.c";     */
/* argv[3] = NULL;       */
/* execvp("test", argv); */

/* |                         */
/* | fork                    */
/* +----------------+        */
/* |                |        */
/* |                |        */
/* |                |  cmd1  */
/* |                |  exec* */
/* | wait           |        */
/* |<...............         */
/* |                         */
/* | exec* cmd2              */

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i;
    int status;

    for (i = 1; i < argc && strcmp(argv[i], "do") != 0; i++);
    assert(strcmp(argv[i], "do") == 0);

    switch (fork()) {
    case -1:
        exit(EXIT_FAILURE);

    case 0:                    /* Fils */
        argv[i] = NULL;
        execvp(argv[1], &(argv[1]));    /* &(argv[1]) == argv+1 */
        assert(0);

    default:                   /* Père */
        assert(wait(&status) != -1);
        if(WIFEXITED(status) && WEXITSTATUS(status) == EXIT_SUCCESS) {
            execvp(argv[i+1], &(argv[i+1]));
            assert(0);
        }
    }

    return EXIT_FAILURE;
}
