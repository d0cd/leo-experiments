
@program
function main(current_0: address, current_1: u64, current_2: address, current_3: u64, current_4: group, bidder: address, bid: u64) -> (address, u64, address, u64) {
    let winning_bidder: address = bid > current_3 ? bidder : current_2;
    let winning_bid: u64 = bid > current_3 ? bid : current_3;
    return (current_0, current_1, winning_bidder, winning_bid);
}
