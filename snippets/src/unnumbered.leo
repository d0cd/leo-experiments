// If you are screenshotting from this file, 
// DO NOT include the line numbers.


@checksum(mapping="dao.aleo/elected", key="<ADDRESS>")
async constructor() {}


@checksum(mapping="governance.aleo/consensus", key="<ADDRESS>")
async constructor() {}


@checksum(mapping="timelock.aleo/scheduled", key="<ADDRESS>")
async constructor() {}


@checksum(mapping="multisig.aleo/approved", key="<ADDRESS>")
async constructor() {}


@checksum(mapping="token_holders.aleo/proposals", key="<ADDRESS>")
async constructor() {
    // Only token holder can vote to upgrade.
    //
    // Valid upgrades include parameter changes, 
    // fee adjustments, and new features
}


// Note: on the example below. The bracket syntax '[]' is not valid Leo.
// It will be in the future.


@custom
async constructor() {
    // Normal: DAO approval required.
    let dao_approved: bool = governance.aleo/approved[self.address];

    // Emergency: Secure multisig override.
    let emergency: bool = security.aleo/critical_path[self.address];

    // Require either condition is true.
    assert(dao_approved || emergency);
}


@custom
constructor() {
    // This program cannot be sunset until block 1000000.
    assert(block.height >= 1000000u32);
    
    // Check for the sunset signal.
    let sunset: bool = governance.aleo/sunset[checksum];
    assert(!sunset);
}


@custom
constructor() {
    // This program requires a feature to be enabled to be deployed.
    let feature_enabled: bool = features.aleo/enabled[self.address];
    assert(feature_enabled);
    
    // Governance must also approve the program contents.
    let governance_approved: bool = dao.aleo/upgrades[self.checksum];
    assert(governance_approved);
}


@custom
constructor() {
    // Revenue sharing changes need stakeholder approval.
    let fee_change_approved: bool = stakeholders.aleo/fee_votes[self.address];
    let new_fee: u32 = stakeholders.aleo/approved_fees[self.address];
    
    assert(fee_change_approved);
    assert(new_fee <= 100u32); // Max 1% fee hardcoded
}







