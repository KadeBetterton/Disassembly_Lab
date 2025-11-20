/*
    Demonstrates basic arithmetic, comparisons, and branching.
    Shows: branch patterns, compare instructions, immediate handling,
    and ALU operation differences across x86, ARM, MIPS, and RISC-V.
*/

int compute(int x, int y) {
    int z = x * 4;
    if (z > y) {
        z = z - y;
    }
    return z;
}
