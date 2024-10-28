import token.aleo;
program multitoken.aleo;

record token_record:
    owner as address.private;
    amount as u64.private;
    asset as address.private;


function deposit:
    input r0 as address.private;
    input r1 as u64.private;
    input r2 as address.private;
    input r3 as boolean.private;
    assert.eq r3 true;
    call token.aleo/transfer_public r0 r1;
    cast r0 r1 r2 into r4 as token_record.record;
    output r4 as token_record.record;
