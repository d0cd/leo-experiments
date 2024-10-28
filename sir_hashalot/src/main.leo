// The 'sir_hashalot' program.
program sir_hashalot.aleo {
    transition main(a: field) -> field {
        for i: u32 in 0u32..32768u32 {
            a = BHP1024::hash_to_field(a);
        }
        return a;
    }
}
