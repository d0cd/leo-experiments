// The 'large_data_types' program.
program large_data_types.aleo {

    transition create_a_massive_array() -> u32 {
        let array: [u32; 32] = [0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32,0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32,0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32,0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32, 0u32];
        let array2: [[u32; 32]; 32] = [array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array, array];
        let array3: [[[u32; 32]; 32]; 32] = [array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2, array2];
        let array4: [[[[u32; 32]; 32]; 32]; 32] = [array3, array3, array3, array3, array3, array3, array3, array3,array3, array3, array3, array3,array3, array3, array3, array3,array3, array3, array3, array3,array3, array3, array3, array3,array3, array3, array3, array3,array3, array3, array3, array3];
        let array5: [[[[[u32; 32]; 32]; 32]; 32]; 32] = [array4, array4, array4, array4, array4, array4, array4, array4,array4, array4, array4, array4,array4, array4, array4, array4,array4, array4, array4, array4,array4, array4, array4, array4,array4, array4, array4, array4,array4, array4, array4, array4];
        let array6: [[[[[[u32; 32]; 32]; 32]; 32]; 32]; 32] = [array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5, array5];
        let array7: [[[[[[[u32; 32]; 32]; 32]; 32]; 32]; 32]; 32] = [array6, array6, array6, array6,array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6, array6];  

        return BHP1024::hash_to_u32(array7);
    }
}
