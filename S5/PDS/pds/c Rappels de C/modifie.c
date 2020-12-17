#include <stdio.h>

void modifie(int *n, int *t) {
    n[0]++;
    t[0]++;
}

int main() {
    int n = 0;
    int t[1] = { 0 };

    printf("avant\n");
    printf("n: %d\n", n);
    printf("t: [%d]\n", t[0]);

    modifie(&n, t);

    printf("après\n");
    printf("n: %d\n", n);
    printf("t: [%d]\n", t[0]);

    return 0;
}
