// token.leo
program token.aleo {
    // Define the token structure
    record Token {
        owner: address,
        amount: u64
    }

    // Mint new tokens (only callable by the deployer initially)
    transition mint(receiver: address, amount: u64) -> (Token) {
        // Create a new token record
        return Token {
            owner: receiver,
            amount: amount
        };
    }

    // Transfer tokens between addresses
    transition transfer(token: Token, receiver: address, amount: u64) -> (Token, Token) {
        // Ensure the sender has enough tokens
        assert(token.amount >= amount);

        // Create output token for receiver
        let receiver_token: Token = Token {
            owner: receiver,
            amount: amount
        };

        // Create updated token for sender
        let sender_token: Token = Token {
            owner: token.owner,
            amount: token.amount - amount
        };

        return (sender_token, receiver_token);
    }

    // Check balance of a token
    transition get_balance(token: Token) -> u64 {
        return token.amount;
    }
}