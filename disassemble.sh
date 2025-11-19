#!/usr/bin/env bash
set -e

# Create output folders
mkdir -p analysis/x86 analysis/arm analysis/mips analysis/riscv

FILES=(
    "arithmetic/arithmetic"
    "functions/functions"
    "loops/loops"
    "pointers/pointers"
    "structs/structs"
)

echo "=== Dumping objdump output for all ISAs ==="

for f in "${FILES[@]}"; do
    name=$(basename "$f")

    echo "---- Disassembling $name.o ----"

    # x86
    objdump -d build/x86/$name.o > analysis/x86/${name}_x86.txt

    # ARM
    arm-linux-gnueabi-objdump -d build/arm/$name.o > analysis/arm/${name}_arm.txt

    # MIPS
    mips-linux-gnu-objdump -d build/mips/$name.o > analysis/mips/${name}_mips.txt

    # RISC-V
    riscv64-linux-gnu-objdump -d build/riscv/$name.o > analysis/riscv/${name}_riscv.txt

done

echo "=== All disassembly files created successfully ==="
