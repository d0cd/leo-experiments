// The `Oracle` record datatype.
record Oracle {
    // The oracle owner.
    owner: address,
    // The Aleo balance (in gates).
    gates: u64,
    // The oracle set price.
    price: u64,
    // Symbol
    symbol: char,
}

// The `initialize` function initializes a new record with the
// to the receiver of oracles in `r1` for the receiver in `r0`.
@program
function initialize(owner: address, symbol: char) -> Oracle {
    return Oracle {
        owner: owner,
        gates: 0u64,
        price: 0u64,
        symbol: symbol
    };
}

// The `update` function creates a new record to update the price
@program
function update(oracle: Oracle, price: u64) -> (Oracle, Oracle) {
    // Produce a oracle record with an updated price
    return Oracle {
        owner: oracle.owner,
        gates: oracle.gates,
        price: price,
        symbol: oracle.symbol
    };
}
