 program token.aleo {
    // mapping accounts: u64 => Token; 
    // mapping liquidity: address => u64;
    struct TokenInfo {
        // token id
        id: u64,
        // token name
        name: field,
        // decimals
        decimals: u8,
        // token reserves
        reserves: u128,
        // token is liquidity token or not
        is_liquid_token: bool,
    }
    mapping token_next_id: u8 => u64;
    mapping token_id_to_name: u64 => field;
    mapping token_name_to_info: field => TokenInfo;
    mapping token_name_to_owner: field => address;
    mapping account_token_to_amount: field => u128;

    record token {
        // The token owner.
        owner: address,
        // The token id
        id: u64,
        // The token amount.
        amount: u128,
    }

    /* Init function */ 
    transition init(public dex_owner: address) {
        return then finalize(dex_owner);
    }
    finalize init(public dex_owner: address) {
        Mapping::set(token_next_id, 0u8, 1u64);
        Mapping::set(token_next_id, 1u8, 1u64);
        Mapping::set(token_name_to_owner, 0field, dex_owner);
    }

    /* Add new token */
    transition add_new_token (public token_name: field, public decimals: u8) {
        return then finalize(token_name, decimals, self.caller);
    }
    finalize add_new_token(public token_name: field, public decimals: u8, public token_owner: address) {
        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            let token_id: u64 = Mapping::get_or_use(token_next_id, 0u8, 0u64);
            if (token_id == 0u64) {
                return;
            } 

            try_get_token = TokenInfo {
                id: token_id,
                name: token_name,
                decimals,
                reserves: 0u128,
                is_liquid_token: false,
            };
            Mapping::set(token_next_id, 0u8, token_id + 1u64);
            Mapping::set(token_id_to_name, token_id, token_name);
            Mapping::set(token_name_to_info, token_name, try_get_token);
            Mapping::set(token_name_to_owner, token_name, token_owner);
        } else {
            return;
        }
    }

    transition add_new_liquidity_token () {
        return then finalize();
    }
    finalize add_new_liquidity_token() {
        let current_liquidity_id: u64 = Mapping::get_or_use(token_next_id, 1u8, 0u64);
        if current_liquidity_id == 0u64 {
            return;
        }
        let token_name: field = BHP256::hash_to_field(current_liquidity_id);
        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            let token_id: u64 = Mapping::get_or_use(token_next_id, 0u8, 0u64);
            if (token_id == 0u64) {
                return;
            } 

            try_get_token = TokenInfo {
                id: token_id,
                name: token_name,
                decimals: 6u8,
                reserves: 0u128,
                is_liquid_token: true,
            };
            Mapping::set(token_next_id, 0u8, token_id + 1u64);
            Mapping::set(token_next_id, 1u8, current_liquidity_id + 1u64);
            Mapping::set(token_id_to_name, token_id, token_name);
            Mapping::set(token_name_to_info, token_name, try_get_token);
        } else {
            return;
        }
    }

    /* Mint */
    transition mint_by_name(public receiver: address, public amount: u128, public token_name: field) {
        // Mint the tokens publicly by invoking the computation on-chain.
        return then finalize(receiver, amount, token_name, self.caller);
    }

    finalize mint_by_name(public receiver: address, public amount: u128, public token_name: field, caller: address) {
        let token_owner: address = Mapping::get(token_name_to_owner, token_name);
        
        if token_owner != caller {
            return;
        }

        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 
        if try_get_token.is_liquid_token == true {
            return;
        }

        let new_token_info: TokenInfo = TokenInfo{
            id: try_get_token.id,
            name: try_get_token.name,
            decimals: try_get_token.decimals,
            reserves: try_get_token.reserves + amount,
            is_liquid_token: try_get_token.is_liquid_token,
        };
        let token_name_hased: field = BHP256::hash_to_field(token_name);
        let receiver_hashed: field = BHP256::hash_to_field(receiver);

        let current_amount: u128 = Mapping::get_or_use(account_token_to_amount, token_name_hased + receiver_hashed, 0u128);
        Mapping::set(account_token_to_amount, token_name_hased + receiver_hashed, current_amount + amount);
        Mapping::set(token_name_to_info, token_name, new_token_info);
    }

    transition mint_by_id(public receiver: address, public amount: u128, public id: u64) {
        // Mint the tokens publicly by invoking the computation on-chain.
        return then finalize(receiver, amount, id, self.caller);
    }

    finalize mint_by_id(public receiver: address, public amount: u128, public id: u64, caller: address) {
        let token_name: field = Mapping::get_or_use(token_id_to_name, id, 0field);
        if token_name == 0field {
            return;
        }
        let token_owner: address = Mapping::get(token_name_to_owner, token_name);
        
        if token_owner != caller {
            return;
        }

        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 
        if try_get_token.is_liquid_token == true {
            return;
        }

        let new_token_info: TokenInfo = TokenInfo{
            id: try_get_token.id,
            name: try_get_token.name,
            decimals: try_get_token.decimals,
            reserves: try_get_token.reserves + amount,
            is_liquid_token: try_get_token.is_liquid_token,
        };
        let token_name_hased: field = BHP256::hash_to_field(token_name);
        let receiver_hashed: field = BHP256::hash_to_field(receiver);

        let current_amount: u128 = Mapping::get_or_use(account_token_to_amount, token_name_hased + receiver_hashed, 0u128);
        Mapping::set(account_token_to_amount, token_name_hased + receiver_hashed, current_amount + amount);
        Mapping::set(token_name_to_info, token_name, new_token_info);
    }

    /* Burn */
    // Only liquidity token can be burnt
    // TODO: Check requirement before burn
    transition burn(public amount: u128, public liquid_token_id: u64) {
        return then finalize(amount, liquid_token_id);
    }

    finalize burn(public amount: u128, public liquid_token_id: u64) {
        let token_name: field = BHP256::hash_to_field(liquid_token_id);
        
        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 
        if try_get_token.is_liquid_token != true {
            return;
        }

        let new_token_info: TokenInfo = TokenInfo{
            id: try_get_token.id,
            name: try_get_token.name,
            decimals: try_get_token.decimals,
            reserves: try_get_token.reserves - amount,
            is_liquid_token: try_get_token.is_liquid_token,
        };
        let dex_owner: address = Mapping::get(token_name_to_owner, 0field);
        let dex_owner_hashed: field = BHP256::hash_to_field(dex_owner);

        let current_amount: u128 = Mapping::get_or_use(account_token_to_amount, token_name + dex_owner_hashed, 0u128);
        Mapping::set(account_token_to_amount, token_name + dex_owner_hashed, current_amount - amount);
        Mapping::set(token_name_to_info, token_name, new_token_info);
    }

    /* Transfer */
    transition transfer_by_id(public receiver: address, public amount: u128, public token_id: u64) {
        // Transfer the tokens publicly, by invoking the computation on-chain.
        return then finalize(self.caller, receiver, amount, token_id);
    }

    finalize transfer_by_id(public sender: address, public receiver: address, public amount: u128, public token_id: u64) {
        let token_name: field = Mapping::get_or_use(token_id_to_name, token_id, 0field);
        if token_name == 0field {
            return;
        }

        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 

        let token_name_hashed: field = BHP256::hash_to_field(token_name);
        let sender_hashed: field = BHP256::hash_to_field(sender);
        let receiver_hashed: field = BHP256::hash_to_field(receiver);
        
        // Decrements `account[sender]` by `amount`.
        // If `account[sender]` does not exist, it will be created.
        // If `account[sender] - amount` underflows, `transfer_public` is reverted.
        let sender_amount: u128 = Mapping::get_or_use(account_token_to_amount, sender_hashed + token_name_hashed, 0u128);
        Mapping::set(account_token_to_amount, sender_hashed + token_name_hashed, sender_amount - amount);
        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `transfer_public` is reverted.
        let receiver_amount: u128 = Mapping::get_or_use(account_token_to_amount, receiver_hashed + token_name_hashed, 0u128);
        Mapping::set(account_token_to_amount, receiver_hashed + token_name_hashed, receiver_amount + amount);
    }

    transition transfer_by_name(public receiver: address, public amount: u128, public token_name: field) {
        // Transfer the tokens publicly, by invoking the computation on-chain.
        return then finalize(self.caller, receiver, amount, token_name);
    }

    finalize transfer_by_name(public sender: address, public receiver: address, public amount: u128, public token_name: field) {
        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 

        let token_name_hashed: field = BHP256::hash_to_field(token_name);
        let sender_hashed: field = BHP256::hash_to_field(sender);
        let receiver_hashed: field = BHP256::hash_to_field(receiver);
        
        // Decrements `account[sender]` by `amount`.
        // If `account[sender]` does not exist, it will be created.
        // If `account[sender] - amount` underflows, `transfer_public` is reverted.
        let sender_amount: u128 = Mapping::get_or_use(account_token_to_amount, sender_hashed + token_name_hashed, 0u128);
        Mapping::set(account_token_to_amount, sender_hashed + token_name_hashed, sender_amount - amount);
        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `transfer_public` is reverted.
        let receiver_amount: u128 = Mapping::get_or_use(account_token_to_amount, receiver_hashed + token_name_hashed, 0u128);
        Mapping::set(account_token_to_amount, receiver_hashed + token_name_hashed, receiver_amount + amount);
    }

    transition transfer_liquid(public receiver: address, public amount: u128, public liquid_token_id: u64) {
        // Transfer the tokens publicly, by invoking the computation on-chain.
        return then finalize(self.caller, receiver, amount, liquid_token_id);
    }

    finalize transfer_liquid(public sender: address, public receiver: address, public amount: u128, public liquid_token_id: u64) {
        let token_name: field = BHP256::hash_to_field(liquid_token_id);
        if token_name == 0field {
            return;
        }

        let try_get_token: TokenInfo = Mapping::get_or_use(
            token_name_to_info, 
            token_name, 
            TokenInfo {
                id: 0u64,
                name: 0field,
                decimals: 0u8,
                reserves: 0u128,
                is_liquid_token: false,
            });
        if try_get_token.id == 0u64 {
            return;
        } 
        if try_get_token.is_liquid_token != true {
            return;
        }

        let sender_hashed: field = BHP256::hash_to_field(sender);
        let receiver_hashed: field = BHP256::hash_to_field(receiver);
        
        // Decrements `account[sender]` by `amount`.
        // If `account[sender]` does not exist, it will be created.
        // If `account[sender] - amount` underflows, `transfer_public` is reverted.
        let sender_amount: u128 = Mapping::get_or_use(account_token_to_amount, sender_hashed + token_name, 0u128);
        Mapping::set(account_token_to_amount, sender_hashed + token_name, sender_amount - amount);
        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `transfer_public` is reverted.
        let receiver_amount: u128 = Mapping::get_or_use(account_token_to_amount, receiver_hashed + token_name, 0u128);
        Mapping::set(account_token_to_amount, receiver_hashed + token_name, receiver_amount + amount);
    }
}

