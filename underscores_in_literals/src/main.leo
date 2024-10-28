// The 'underscores_in_literals' program.
program underscores_in_literals.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b + 1_000u32;
        return c;
    }
}
