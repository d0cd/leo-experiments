program addresseq.aleo;



function main:
    input r0 as address.private;
    input r1 as address.private;
    is.eq r0 r1 into r2;
    output r2 as boolean.private;
