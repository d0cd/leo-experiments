// The 'bhp512commit' program.
program bhp512commit.aleo {

	 function hello(r0: u32) -> field {
                let r1: field = BHP512::commit(r0, -76915328654976613059477945701456746133scalar);
                return r1;
        }
}
