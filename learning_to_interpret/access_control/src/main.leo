// The 'access_control' program.
program access_control.aleo {

    mapping timelocks: address => u32;

    // Set a timelock for a user.
    // This function can only be called by the program's owner.
    async transition set_timelock(user: address, time: u32) -> Future {
        assert_eq(self.caller, aleo1rhgdu77hgyqd3xjj8ucu3jj9r2krwz6mnzyd80gncr5fxcwlh5rsvzp9px);
        return update_timelock(user, time);
    }

    async function update_timelock(user: address, time: u32) {
        assert(time >= block.height);
        Mapping::set(timelocks, user, time);
    }
}
