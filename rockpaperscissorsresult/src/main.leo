// The 'rockpaperscissorsresult' main function.
// This function takes in the original balances of Alice and Bob and their respective moves and returns the new balances of both players.
function compute_new_balances(alice_balance: u32, bob_balance: u32, alice_choice: u8, bob_choice: u8) -> (u32, u32) {
    // For the purposes of this example,
    // Let 0u8 = Rock, 1u8 = Paper, 2u8 = Scissors.

    // If either Alice or Bob chose an invalid choice, return the original balances.
    if (alice_choice > 2u8) || (bob_choice > 2u8) {
        return (alice_balance, bob_balance);
    }

    // draw
    if (alice_choice == bob_choice) {
        alice_balance += 1u32;
        bob_balance += 1u32;
    } else if (alice_choice == 0u8) {
        if (bob_choice == 1u8) {
            // alice: rock, bob: paper, bob wins.
            bob_balance += 2u32;
        } else {
            // alice: rock, bob: scissors, alice wins.
            alice_balance += 2u32;
        }
    } else if (alice_choice == 1u8) {
        if (bob_choice == 2u8) {
            // alice: paper, bob: scissors, bob wins.
            bob_balance += 2u32;
        } else {
            // alice: paper, bob: rock, alice wins.
            alice_balance += 2u32;
        }
    } else if (alice_choice == 2u8) {
        if (bob_choice == 0u8) {
            // alice: scissors, bob: rock, bob wins.
            bob_balance += 2u32;
        } else {
            // alice: scissors, bob: paper, alice wins.
            alice_balance += 2u32;
        }
    }

    return (alice_balance, bob_balance);
}
