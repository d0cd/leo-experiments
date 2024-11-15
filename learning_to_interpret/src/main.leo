// The 'learning_to_interpret' program.
program learning_to_interpret.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
