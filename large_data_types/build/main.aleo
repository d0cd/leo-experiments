program large_data_types.aleo;

function create_a_massive_array:
    cast  0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 0u32 into r0 as [u32; 32u32];
    cast  r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 r0 into r1 as [[u32; 32u32]; 32u32];
    cast  r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 into r2 as [[[u32; 32u32]; 32u32]; 32u32];
    cast  r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 r2 into r3 as [[[[u32; 32u32]; 32u32]; 32u32]; 32u32];
    cast  r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 r3 into r4 as [[[[[u32; 32u32]; 32u32]; 32u32]; 32u32]; 32u32];
    cast  r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 r4 into r5 as [[[[[[u32; 32u32]; 32u32]; 32u32]; 32u32]; 32u32]; 32u32];
    cast  r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 r5 into r6 as [[[[[[[u32; 32u32]; 32u32]; 32u32]; 32u32]; 32u32]; 32u32]; 32u32];
    hash.bhp1024 r6 into r7 as u32;
    output r7 as u32.private;
