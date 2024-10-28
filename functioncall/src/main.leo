// The 'functioncall' main function.
function main(public a: u32, b: u32) -> u32 {
    let c: u32 = adder(a, b);
    return c;
}

function adder(a: u32, b: u32) -> u32 {
    return a + b;
}
