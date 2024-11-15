program access_control.aleo {

    struct Metadata {
        locker: address,
        lockee: address,
    }

    mapping timelocks: Metadata => u32;

    // Set a timelock for a user.
    async transition set_timelock(user: address, time: u32) -> Future {
        let metadata: Metadata = Metadata {
            locker: self.caller,
            lockee: user,
        };
        return update_timelock(metadata, time);
    }

    async function update_timelock(metadata: Metadata, time: u32) {
        Mapping::set(timelocks, metadata, block.height + time);
    }
}
