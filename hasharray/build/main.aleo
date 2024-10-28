program hasharray.aleo;



function main:
    input r0 as [u32; 4u32].public;
    hash.psd2 r0 into r1 as field;
    output r1 as field.private;
