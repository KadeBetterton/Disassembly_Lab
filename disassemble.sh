#!/usr/bin/env bash
set -e


mkdir -p "objdump assembly results/x86" \
         "objdump assembly results/arm" \
         "objdump assembly results/mips" \
         "objdump assembly results/riscv"

FILES=(
    "arithmetic"
    "functions"
    "loops"
    "pointers"
    "structs"
    "unrolling"     
)


for f in "${FILES[@]}"; do
    name="$f"

    echo "---- Disassembling $name.o ----"

    # x86
    objdump -d "executables/x86/$name.o" \
        > "objdump assembly results/x86/${name}_x86.txt"

    # ARM
    arm-linux-gnueabi-objdump -d "executables/arm/$name.o" \
        > "objdump assembly results/arm/${name}_arm.txt"

    # MIPS
    mips-linux-gnu-objdump -d "executables/mips/$name.o" \
        > "objdump assembly results/mips/${name}_mips.txt"

    # RISC-V
    riscv64-linux-gnu-objdump -d "executables/riscv/$name.o" \
        > "objdump assembly results/riscv/${name}_riscv.txt"
done

echo "=== All disassembly files created successfully ==="
