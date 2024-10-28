// The 'logicalopviamethodcall' main function.
function main(public a: u32, b: u32) -> u32 {
    let c: u32 = a + b;
    let cond1: bool = a == b;
    let cond2: bool = b != 0u32;
    let d: bool = cond2.and(cond1);
    return c;
}
