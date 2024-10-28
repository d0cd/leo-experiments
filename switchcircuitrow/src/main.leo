// The 'switchcircuitrow' main function.
program switchcircuitrow.aleo {

	struct Row { c2: u8, c3: u8, c1: u8 }

	transition main() -> u8 {
		let r1: Row = Row { c3: 3u8, c1: 1u8, c2: 2u8 };
		return r1.c1;
	}
}
