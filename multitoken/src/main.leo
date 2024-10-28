import token.aleo;
program multitoken.aleo {
    record token_record {
        owner: address,
        amount: u64,
        asset: address
    }
    transition deposit(receiver: address, amount: u64, asset: address, is_compliant: bool) -> token_record {      
        assert(is_compliant);
        token.aleo/transfer_public(receiver, amount);

        return token_record {
            owner: receiver,
            amount: amount,
            asset: asset,
        };
    }
}
