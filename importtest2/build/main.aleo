import child.aleo;
program importtest2.aleo;



function test:
    input r0 as u32.public;
    input r1 as u32.private;
    call child.aleo/foo into r2;
    async test r2 into r3;
    output r3 as importtest2.aleo/test.future;

finalize test:
    input r0 as child.aleo/foo.future;
    await r0;


function test1:
    input r0 as u32.public;
    input r1 as u32.private;
    call child.aleo/foo into r2;
    async test1 r2 r0 r1 into r3;
    output r3 as importtest2.aleo/test1.future;

finalize test1:
    input r0 as child.aleo/foo.future;
    input r1 as u32.public;
    input r2 as u32.public;
    await r0;
    assert.eq r1 r2;
