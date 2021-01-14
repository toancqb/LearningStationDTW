#include <stdio.h>

int main()
{
    int i;
    long int sum = 0;

    for(i = 0; i <= 1000000000; i++)
    {
        sum += i;
    }
    printf("%ld\n", sum);
    return 0;
}