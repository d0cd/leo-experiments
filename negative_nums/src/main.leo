// The 'negative_nums' program.
program negative_nums.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
	let d: i8 = -128i8;
	let e: i8 = -0x80i8;
	let k: i8 = -0x81i8;
	//let f: i8 = -0xF0i8;
	//let g: i8 = -129i8;
	let j: i8 = 0x80i8;
        return c;
    }
}
