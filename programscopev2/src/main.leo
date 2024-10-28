program programscopev2 {

    import foo.aleo;

    circuit Amount {
        val: u64;
    }


    record Token {
        owner: address,
        gates: u64,
        amount: Amount,
    }



    function mint(owner: address, amount: u64) -> Token {
    	let calculated_total: u64 = calculate(amount);
    	return Token {
            owner: owner,
            gates: 0u64,
            amount: Amount { val: calculated_total },
        };
    }

    function transfer(token: Token, to: address, amount: u64) -> (Token, Token) {

    	let difference: u64 = token.amount.val - amount;

    	let remaining: Token = Token {
    	    owner: token.owner,
    	    gates: token.gates,
    	    amount: Amount { val: difference },
    	};

    	let transferred: Token = Token {
    	    owner: to,
    	    gates: 0u64,
    	    amount: Amount { val: amount },
    	};

    	return (remaining, transferred);
    }
}

function calculate(a: u64) -> u64 {
    return a * a + a;
}


