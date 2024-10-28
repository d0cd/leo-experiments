program condexecfinalize.aleo;



mapping data:
	key as u8.public;
	value as u8.public;


function main:
    input r0 as u8.private;
    input r1 as u8.private;
    async main r0 r1 into r2;
    output r2 as condexecfinalize.aleo/main.future;

finalize main:
    input r0 as u8.public;
    input r1 as u8.public;
    is.eq r0 0u8 into r2;
    remove data[r1];
    set r0 into data[r1];

