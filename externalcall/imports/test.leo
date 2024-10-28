program test.aleo {
    transition baz() {
            return then finalize();
    }

    // finalize baz() {
    // 	if (true) {
    //     	if (false) {
    //     		return;
    //     	}
    //     } else {
    //     	return;
    //     }
    // }

    finalize baz() {
	if (true) {
		return;
	}
	return;
    }
}
