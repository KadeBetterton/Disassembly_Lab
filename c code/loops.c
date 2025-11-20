/*
    Demonstrates loops and array indexing with repeated memory access.
    Shows: load/store behavior, addressing modes, loop counters,
    branch-back patterns, and memory access differences across ISAs.
*/

int loop(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum;
}
