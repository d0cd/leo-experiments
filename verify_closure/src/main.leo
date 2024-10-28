// The 'verify_closure' program.
program verify_closure.aleo {
    function test_closure(a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = test_closure(a, b);
        return c;
    }
}
