
#include <pthread.h>
#include <stdio.h>
#include <string.h>

typedef struct s_info {
	char name[64];
	int age;
} t_info;

static void *printHello(void *args)
{
	t_info *info = (t_info*)args;
	printf("Hello from thread!\n");
	printf("I'm %s\n", info->name);
	printf("I'm %d years old\n", info->age);

	pthread_exit(NULL);
}

int main(int argc, char *argv[])
{
	int ret;
	pthread_t tid;
	t_info info;

	memcpy(info.name, "Toan", 5);
	info.age = 25;
	ret = pthread_create(&tid, NULL, printHello, (void*)&info);
	if (ret)
	{
		printf("Error\n");
	}

	pthread_exit(NULL);
}