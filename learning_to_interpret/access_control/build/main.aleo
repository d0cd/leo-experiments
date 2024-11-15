program access_control.aleo;

mapping timelocks:
    key as address.public;
    value as u32.public;

function set_timelock:
    input r0 as address.private;
    input r1 as u32.private;
    assert.eq self.caller aleo1rhgdu77hgyqd3xjj8ucu3jj9r2krwz6mnzyd80gncr5fxcwlh5rsvzp9px;
    async set_timelock r0 r1 into r2;
    output r2 as access_control.aleo/set_timelock.future;

finalize set_timelock:
    input r0 as address.public;
    input r1 as u32.public;
    gte r1 block.height into r2;
    assert.eq r2 true;
    set r1 into timelocks[r0];
