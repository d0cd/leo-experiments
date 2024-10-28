program onchain_verifier.aleo;

struct Credentials:
    issuer as address;
    subject as address;
    dob as field;
    nationality as field;
    expiry as field;

record SignedCredential:
    owner as address.private;
    credential as Credentials.private;
    sig as signature.private;


function verify_dob:
    input r0 as SignedCredential.record;
    input r1 as field.private;
    input r2 as field.private;
    assert.eq self.caller r0.owner;
    assert.eq r0.credential.subject r0.owner;
    gte r0.credential.expiry r2 into r3;
    assert.eq r3 true;
    is.eq r0.credential.dob r1 into r4;
    output r4 as boolean.private;


function verify_nationality:
    input r0 as SignedCredential.record;
    input r1 as field.private;
    input r2 as field.private;
    assert.eq r0.credential.subject r0.owner;
    gte r0.credential.expiry r2 into r3;
    assert.eq r3 true;
    is.eq r0.credential.nationality r1 into r4;
    output r4 as boolean.private;
