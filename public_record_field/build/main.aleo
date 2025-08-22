program public_record_field.aleo;

record data:
    owner as address.private;
    value_0 as u8.public;
    value_1 as u8.private;

function mint:
    input r0 as u8.private;
    input r1 as u8.private;
    cast self.caller r0 r1 into r2 as data.record;
    output r2 as data.record;
