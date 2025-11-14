#[test_only]
module contract::fa_challenge_tests {
    use contract::fa_launchpad;
    use std::string;
    use aptos_framework::fungible_asset;
    use std::signer;
    use aptos_framework::object;

    #[test(module_signer = @contract, user = @0xCAFE)]
    fun test_init(module_signer: &signer, user: &signer) {
        // init module
        fa_launchpad::init_for_test(module_signer);

        let fa_metadata =
            fa_launchpad::create(
                user,
                string::utf8(b""),
                string::utf8(b""),
                8,
                string::utf8(b""),
                string::utf8(b"")
            );

        assert!(object::is_owner(fa_metadata, signer::address_of(user)));

        assert!(fungible_asset::supply(fa_metadata).destroy_some() == 0);

        let fa = fa_launchpad::mint(user, fa_metadata, 10);

        assert!(fungible_asset::metadata_from_asset(&fa) == fa_metadata);

        assert!(fungible_asset::amount(&fa) == 10);

        assert!(fungible_asset::supply(fa_metadata).destroy_some() == 10);

        fa_launchpad::burn(fa);

        assert!(fungible_asset::supply(fa_metadata).destroy_some() == 0);
    }

    #[test(module_signer = @contract, user = @0xCAFE, other_user = @0xBEEF)]
    #[expected_failure(abort_code = 1, location = fa_launchpad)] // ERROR_NOT_OWNER
    fun test_burn_not_owner(module_signer: &signer, user: &signer, other_user: &signer) {
        // init module
        fa_launchpad::init_for_test(module_signer);

        let fa_metadata =
            fa_launchpad::create(
                user,
                string::utf8(b""),
                string::utf8(b""),
                8,
                string::utf8(b""),
                string::utf8(b"")
            );

        // mint to other user
        let fa = fa_launchpad::mint(other_user, fa_metadata, 10);
        fa_launchpad::burn(fa);

    }
}

