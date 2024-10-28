// The 'condexecfinalize' program.
program condexecfinalize.aleo {

    mapping data: u8 => u8;

    async transition main(a: u8, b: u8) -> Future {
        return finalize_main(a, b);
    }

    async function finalize_main(a: u8, b: u8) {
        if a == 0u8 {
            data.remove(b);
        } else {
            data.set(b, a);
        }
    }
}
