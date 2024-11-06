import upgrade_test_v1.aleo;

// The 'upgrade_test_v2.leo' program.
program upgrade_test_v2.aleo {

    // A mapping to indicate if a user is using v2.
    mapping is_v2: address => bool;

    // A transition that upgrades a user's private state to v2.
    transition upgrade_to_v2_private(old_data: upgrade_test_v1.aleo/private_data) -> private_data {
        return private_data {
            owner: self.caller,
            data: old_data.data
        };
    }

    // A transition that upgrades a user's public state to v2.
    async transition upgrade_to_v2_public(addr: address) -> Future {
        return upgrade_public(addr);
    }

    // An async function that upgrades a user's public state to v2.
    async function upgrade_public(addr: address) {
        // Check that the user is using v1.
        assert(!Mapping::contains(is_v2, addr));
        // Read the user's public state from v1.
        let old_data: field = Mapping::get(upgrade_test_v1.aleo/public_data, addr);
        // Set the user's public state to v2.
        Mapping::set(public_data, addr, old_data);
        // Set the user's v2 flag to true.
        Mapping::set(is_v2, addr, true);
    }


    //
    // Logic from upgrade_test_v1.aleo
    //

    // A record containing some private data.
    record private_data {
        owner: address,
        data: field
    }

    // A mapping containing public data.
    mapping public_data: address => field;

    // A transition that creates a private data record.
    transition store_private_data(private data: field) -> private_data {
        return private_data {
            owner: self.caller,
            data
        };
    }

    // A transition that stores public data.
    async transition store_public_data(addr: address, data: field) -> Future {
        return store_public(addr, data);
    }

    // An async function that stores public date.
    // A call to this function returns a `Future` that is executed at a later time.
    async function store_public(addr: address, data: field) {
        Mapping::set(public_data, addr, data);
    }
}
