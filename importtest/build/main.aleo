import b.aleo;
program importtest.aleo;



function foo:
    call b.aleo/bar into r0 r1;
    async foo r1 into r2;
    output r0 as u64.private;
    output r2 as importtest.aleo/foo.future;

finalize foo:
    input r0 as b.aleo/bar.future;
    await r0;
