// child.leo
program child.aleo {
    mapping testmap: bool => u32;
    transition foo() {
        return then finalize (1u32);
    }

    finalize foo (c: u32) {
        Mapping::set(testmap, true, c);
    }
}
