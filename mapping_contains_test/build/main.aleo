program mapping_contains_test.aleo;



mapping data:
	key as u8.public;
	value as u8.public;


function insert:
    input r0 as u8.private;
    input r1 as u8.private;
    async insert r0 r1 into r2;
    output r2 as mapping_contains_test.aleo/insert.future;

finalize insert:
    input r0 as u8.public;
    input r1 as u8.public;
    set r1 into data[r0];




function contains:
    input r0 as u8.private;
    async contains r0 into r1;
    output r1 as mapping_contains_test.aleo/contains.future;

finalize contains:
    input r0 as u8.public;
    contains data[r0] into r1;
    assert.eq r1 true;

