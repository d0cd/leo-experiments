// The 'b' program.
import prog_a.aleo;
program prog_b.aleo {
    transition wrapper_mint(owner: address, val: u32) ->  prog_a.aleo/A {
        return prog_a.aleo/mint(aleo1q30lfyggefvzzxqaaclzrn3wd94q4u8zzy8jhhfrcqrf306ayvqsdvj7s4, 1u32);
    }
}
