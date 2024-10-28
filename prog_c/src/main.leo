// The 'import_example' program.
import prog_a.aleo;
import prog_b.aleo;
program prog_c.aleo {
    transition double_wrapper(owner: address, val: u32) -> prog_a.aleo/A {
        let arg1:u32 = 1u32;
        let arg2:u32 = arg1 + 1u32;
        return prog_b.aleo/wrapper_mint(owner,arg2);
    }
}
