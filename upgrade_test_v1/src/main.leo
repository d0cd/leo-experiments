// The 'upgrade_test' program.
program upgrade_test_v1.aleo {
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
