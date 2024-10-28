// The 'return_in_finalize' program.
program return_in_finalize.aleo {
    transition main(public a: u32, public b: u32) -> u32 {
    	return then finalize(a, b);
    }

    finalize main(public a: u32, public b: u32) -> u32 {
	return a + b;
    }
}
