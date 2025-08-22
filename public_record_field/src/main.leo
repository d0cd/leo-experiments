// The 'public_record_field' program.
program public_record_field.aleo {
    record data {
        owner: address,
        public value_0: u8,
        private value_1: u8
    }

    transition mint(value_0: u8, value_1: u8) -> data {
        return data {
            owner: self.caller,
            value_0,
            value_1 
        };
    }
}
