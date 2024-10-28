program child.aleo;



mapping testmap:
	key as boolean.public;
	value as u32.public;

function foo:
    async foo 1u32 into r0;
    output r0 as child.aleo/foo.future;

finalize foo:
    input r0 as u32.public;
    set r0 into testmap[true];
