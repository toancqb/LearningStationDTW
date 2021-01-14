
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <wait.h>

int main() 
{
	pid_t pid;

	printf("A: ce message s’affiche 1 fois\n");
	fflush(stdout);

	pid = fork();
	if (pid == 0) {
	/*qui suis-je, le pere ou le fils ?*/
	printf("[%d] je suis le fils %d\n", getpid(), pid);
	} else {
	/*qui suis-je, le pere ou le fils ?*/
		wait(NULL);
		printf("[%d] je suis le pere (mon fils est %d)\n", getpid(), pid);
	}
	printf("B: ce message s’affiche 2 fois \n");
	fflush(stdout);

	exit(EXIT_SUCCESS);
}