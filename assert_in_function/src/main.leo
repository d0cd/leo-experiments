// The 'assert_in_function' program.
program assert_in_function.aleo {
    function check_caller(b: address) {
        assert_eq(self.caller, b);
    }

    function check_signer(b: address) {
        assert_eq(self.signer, b);
    }

    transition run_check() {
        check_caller(self.caller);
        check_signer(self.signer);
    }

    transition dummy(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
