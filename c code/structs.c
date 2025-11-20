/*
    Demonstrates struct layout, alignment, and mixed-type field access.
    Shows: offset calculations, sign/zero extension, alignment behavior,
    and how each ISA handles accessing struct members.
*/

struct S {
    int a;
    char b;
};

int pack(struct S s) {
    return s.a + s.b;
}
