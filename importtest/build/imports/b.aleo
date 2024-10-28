program b.aleo;



function bar:
    async bar into r0;
    output 42u64 as u64.private;
    output r0 as b.aleo/bar.future;

finalize bar:
    assert.eq true true;
