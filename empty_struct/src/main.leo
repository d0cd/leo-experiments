// The 'empty_struct' program.
program empty_struct.aleo {
    struct Foo {}

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
