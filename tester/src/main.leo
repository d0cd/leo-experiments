import credits.aleo;

program tester.aleo {
    transition main(public a: address, b: u64) -> credits.aleo/credits {
        let c: credits.aleo/credits = credits.aleo/transfer_public_to_private(a, b);
        return c then finalize();
    }

    finalize main() {
        assert_eq(true, true);
    }
}
