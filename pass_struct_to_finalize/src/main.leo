// The 'pass_struct_to_finalize' program.
program pass_struct_to_finalize.aleo {

	struct foo {
		a: u32,
		b: u32
	}

	mapping stor: u32 => foo;

	
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c then finalize(foo { a, b });
    }

    finalize main(input: foo) {
	Mapping::set(stor, input.a, input);
    }
}
