// The 'pedersen_commit_type' program.
program pedersen_commit_type.aleo {
    transition main() -> group {
	let a: i64 = 1i64;
        let b: group = Pedersen128::commit(a, 1scalar);
	return b;
    }
}
