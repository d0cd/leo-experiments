// The 'hasharray' program.
program hasharray.aleo {
    transition main(public a: [u32; 4]) -> field {
        return Poseidon2::hash_to_field(a);
    }
}
