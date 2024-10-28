// The 'testmapping.aleo' program.
program testmapping.aleo;

interface Token:
    owner as address;
    balance as u128;

mapping balances:
        key left as address.public;
        value right as u128.public;

mapping tokens:
        key left2 as address.public;
        value righ2 as Token.public;

