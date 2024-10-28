// The 'earlyreturn' main function.
function main(a: u32, b: bool) -> u32 {
    if (b) {
        a += 1u32;
    } else {
        return a;
    }
    return a;
}
