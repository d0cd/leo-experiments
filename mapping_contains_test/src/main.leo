// The 'mapping_contains_test' program.
program mapping_contains_test.aleo {
    mapping data: u8 => u8;

    async transition insert(key: u8, value: u8) -> Future {
        return add_key(key, value);
    }

    async function add_key(key: u8, value: u8) {
        data.set(key, value);
    }

    async transition contains(key: u8) -> Future {
        return contains_key(key);
    }

    async function contains_key(key: u8) {
        let contains: bool = data.contains(key);
        assert(contains);
    }
}

