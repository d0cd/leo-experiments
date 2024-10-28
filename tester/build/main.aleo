import credits.aleo;
program tester.aleo;






function main:
    input r0 as address.public;
    input r1 as u64.private;
    call credits.aleo/transfer_public_to_private r0 r1 into r2 r3;
    async main r3 into r4;
    output r2 as credits.aleo/credits.record;
    output r4 as tester.aleo/main.future;

finalize main:
    input r0 as credits.aleo/transfer_public_to_private.future;
    await r0;
    assert.eq true true;
