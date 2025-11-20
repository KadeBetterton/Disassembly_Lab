/*
    Demonstrates function calls and calling conventions.
    Shows: argument registers, return registers, stack frame setup,
    prologue/epilogue differences, and how each ISA performs calls.
*/

int add(int a, int b) {
    return a + b;
}

int wrapper() {
    return add(10, 20);
}
