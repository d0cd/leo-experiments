// The 'test-codegen' main function.
function main(a: u32, b: u32) -> u32 {
    let c: u32 = a + b;
    let d: u32 = a.add_wrapped(b);
    let e: u32 = add_wrapped(a, b);
    return c;
}
