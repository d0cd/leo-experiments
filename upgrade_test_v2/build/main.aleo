import upgrade_test_v1.aleo;
program upgrade_test_v2.aleo;

record private_data:
    owner as address.private;
    data as field.private;

mapping is_v2:
    key as address.public;
    value as boolean.public;

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
    output r2 as upgrade_test_v2.aleo/store_public_data.future;

finalize store_public_data:
    input r0 as address.public;
    input r1 as field.public;
    set r1 into public_data[r0];

function upgrade_to_v2_private:
    input r0 as upgrade_test_v1.aleo/private_data.record;
    cast self.caller r0.data into r1 as private_data.record;
    output r1 as private_data.record;

function upgrade_to_v2_public:
    input r0 as address.private;
    async upgrade_to_v2_public r0 into r1;
    output r1 as upgrade_test_v2.aleo/upgrade_to_v2_public.future;

finalize upgrade_to_v2_public:
    input r0 as address.public;
    contains is_v2[r0] into r1;
    not r1 into r2;
    assert.eq r2 true;
    get upgrade_test_v1.aleo/public_data[r0] into r3;
    set r3 into public_data[r0];
    set true into is_v2[r0];
