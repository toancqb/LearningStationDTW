#include <stdio.h>
#include <stdlib.h>

int fib(int n)
{
	if (n < 2)
        return n;
    else
    {
        int x, y;
        x = fib(n-1);
        y = fib(n-2);
        return x + y;
    }
}

int main(int argc, char *argv[])
{
    int n, res;

    n = strtol(argv[1], NULL, 10);
    res = fib(n);

    printf("fib(%d) = %d\n", n, res);
    return 0;
}