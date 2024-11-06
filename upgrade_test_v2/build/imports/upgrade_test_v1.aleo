program upgrade_test_v1.aleo;

record private_data:
    owner as address.private;
    data as field.private;

mapping public_data:
    key as address.public;
    value as field.public;

function store_private_data:
    input r0 as field.private;
    cast self.caller r0 into r1 as private_data.record;
    output r1 as private_data.record;

function store_public_data:
    input r0 as address.private;
    input r1 as field.private;
    async store_public_data r0 r1 into r2;
    output r2 as upgrade_test_v1.aleo/store_public_data.future;

finalize store_public_data:
    input r0 as address.public;
    input r1 as field.public;
    set r1 into public_data[r0];
