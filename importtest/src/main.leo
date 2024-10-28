import b.leo;

program importtest.aleo {
    transition foo() -> u64 {
        return b.leo/bar();
    }
}
