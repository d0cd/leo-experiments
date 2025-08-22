// A Leo test file.
// To learn more about testing your program, see the documentation at https://docs.leo-lang.org
program test.aleo {
    @test
    transition test_helloworld() {{
        assert_eq(1u32 + 2u32, 3u32);
    }}
}
