// The 'propfunccallprogfunc' main function.
@program
function main(public a: u32, b: u32) -> u32 {
    let c: u32 = a + b;
    let d: u32 = foo(c, c);
    return d;
}


@program
function foo(a: u32, b: u32) -> u32 {
	let c: u32 = a * b;
	return c;
}
