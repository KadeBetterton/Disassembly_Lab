#include <stdio.h>

__attribute__((noinline))
int compute_sum(int n) {
    int x[8];
    for (int i = 0; i < 8; i++) x[i] = n + i;
    int sum = 0;
    for (int i = 0; i < 8; i++) {
        int a = x[i];
        sum += a * a;
        sum += a + 3;
        sum ^= a << 1;
    }
    return sum;
}


int main() {
    printf("%d\n", compute_sum(100));
    return 0;
}
