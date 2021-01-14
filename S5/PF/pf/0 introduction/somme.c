int somme(int n) {
    int i;
    int somme = 0;

    for (i = 1; i <= n; i++) {
        somme += i;
    }

    return somme;
}

int sommePairs(int n) {
    int i;
    int somme = 0;

    for (i = 2; i <= n; i+=2) {
        somme += i;
    }

    return somme;
}
