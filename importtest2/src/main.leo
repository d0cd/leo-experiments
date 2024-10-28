// parent.leo
import child.leo;

program importtest2.aleo {
    transition test(public a: u32, b: u32) {
        child.leo/foo();
    }

    transition test1(public a: u32, b: u32) {
	child.leo/foo();
	return then finalize(a, b);
    }

    finalize test1(a: u32, b: u32) {
	assert_eq(a, b);
    }
}
