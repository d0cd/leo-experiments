import prog_a.aleo;
import prog_b.aleo;
program prog_c.aleo;



function double_wrapper:
    input r0 as address.private;
    input r1 as u32.private;
    add 1u32 1u32 into r2;
    call prog_b.aleo/wrapper_mint r0 r2 into r3;
    output r3 as prog_a.aleo/A.record;
