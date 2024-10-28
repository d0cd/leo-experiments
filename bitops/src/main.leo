// The 'bitops' program.
program bitops.aleo {
    // Get the i-th bit from a given 32-bit number
    inline get_bit(number: u32, i: u8) -> bool {
        // The bug happens with either of these two ways of calculating the mask:
        // let mask: u32 = 2u32 ** i;
        let mask: u32 = 1u32 << i;
        return number.and(mask) > 0u32;
    }

    // Get the occupant (player1 or player2) of the i-th cell in game board
    inline get_cell_occupant(board: u32, i: u8) -> u8 {
        return get_bit(board, i) ? 2u8 : 1u8; // player1 -> 1u8, player2 -> 2u8
    }

    transition make_move(board: u32, i: u8){
        let occupant: u8 =  get_cell_occupant(board, i);
        // rest of the code was ommited as it's not needed to reproduce the bug 
    }
}
