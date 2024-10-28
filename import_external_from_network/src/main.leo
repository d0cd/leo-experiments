// The 'import_external_from_network' program.
program import_external_from_network.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
