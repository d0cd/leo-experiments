// The 'onchain_verifier' program.
program onchain_verifier.aleo {

    struct Credentials {
        issuer: address,
        subject: address,
        dob: field,
        nationality: field,
        expiry: field
    }

    record SignedCredential {
        owner: address,
        credential: Credentials,
        sig: signature
    }

    transition verify_dob(
        rec: SignedCredential,
        dob: field,
        currentDate: field
    ) -> bool {
        // Check the owner
        assert_eq(self.caller, rec.owner);

        // Comparison of the subject an owner
        assert_eq(rec.credential.subject, rec.owner);

        // Expiration of record time verficiation
        assert(rec.credential.expiry.gte(currentDate));

        // Verfiy of dob field
        return rec.credential.dob.eq(dob);
    }

    transition verify_nationality(
        rec: SignedCredential,
        nationality: field,
        currentDate: field
    ) -> bool {
        // Check the owner
        // assert_eq(self.caller, rec.owner);

        // Comparison of the subject an owner
        assert_eq(rec.credential.subject, rec.owner);

        // Expiration of record time verficiation
        assert(rec.credential.expiry.gte(currentDate));

        // Verfiy of nationality field
        return rec.credential.nationality.eq(nationality);
    }
}
