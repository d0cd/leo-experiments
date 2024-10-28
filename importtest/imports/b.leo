program b.aleo {
    transition bar() -> u64 {
        return 42u64 then finalize();
    }

    finalize bar() {
        assert(true);
    }
}
