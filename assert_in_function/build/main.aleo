program assert_in_function.aleo;



closure check_caller:
    input r0 as address;
    assert.eq self.caller r0;


closure check_signer:
    input r0 as address;
    assert.eq self.signer r0;


function run_check:
    call check_caller self.caller;
    call check_signer self.signer;


function dummy:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;
