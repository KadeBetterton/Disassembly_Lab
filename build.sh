#!/usr/bin/env bash
set -e


mkdir -p executables/x86 executables/arm executables/mips executables/riscv


FILES=(
    "arithmetic"
    "functions"
    "loops"
    "pointers"
    "structs"
    "unrolling"   
)

echo "=== Building object files for all architectures ==="

for f in "${FILES[@]}"; do
    src="c code/$f.c"
    name="$f"

    # Only unrolling.c gets -O3 for optimization
    if [[ "$name" == "unrolling" ]]; then
        OPT="-O3"
    else
        OPT="-O0"
    fi

    echo "---- Compiling $src with $OPT ----"

    # x86 build
    gcc -g $OPT -c "$src" -o "executables/x86/$name.o"

    # ARM build
    arm-linux-gnueabi-gcc -g $OPT -static -c "$src" -o "executables/arm/$name.o"

    # MIPS build
    mips-linux-gnu-gcc -g $OPT -static -c "$src" -o "executables/mips/$name.o"

    # RISC-V build
    riscv64-linux-gnu-gcc -g $OPT -static -c "$src" -o "executables/riscv/$name.o"
done

echo "=== All object files created successfully ==="
