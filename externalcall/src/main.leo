import token.leo;

program externalcall.aleo {
    
    transition bar() {
	return;
    }

    transition foo() {
	return token.leo/add_new_liquidity_token() then finalize();
    }

    finalize foo() {
	assert(true);
    }
}


    

