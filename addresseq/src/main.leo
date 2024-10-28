// The 'addresseq' program.
program addresseq.aleo {
    transition main(a: address, b: address) -> bool {
    	return a == b;
    }
}
