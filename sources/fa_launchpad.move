/// Challenge module: FA (Fungible Asset) Public Launch Platform
/// This is a platform where anyone can create a FA, but only the creator can mint,
/// and anyone can burn their own FA tokens.
/// You are allowed to edit the constants below to customize metadata, but tests expect
/// the public APIs to follow the original behavior.
module contract::fa_launchpad {
    use std::option;
    use std::string;
    use aptos_framework::object;
    use aptos_framework::object::Object;

    use aptos_framework::fungible_asset;

    /// Error code: Caller is not the owner of the FA
    const ERROR_NOT_OWNER: u64 = 1;
    /// Error code: Event is missing (reserved for future use)
    const ERROR_EVENT_MISSING: u64 = 2;
    /// Error code: TokenRefsStore not found for the given FA metadata
    const ERROR_TOKEN_REFS_NOT_FOUND: u64 = 3;

    /// You may tweak these constants if you want to experiment with custom metadata values.
    /// Tests cover the behavior of the functions, not the literal strings.

    struct SignerCapabilityStore has key {
        extend_ref: object::ExtendRef
    }

    // struct CollectionRefsStore has key { collection_object: Object<collection::Collection>, mutator_ref: collection::MutatorRef }

    struct TokenRefsStore has key {
        mutator_ref: fungible_asset::MutateMetadataRef,
        mint_ref: fungible_asset::MintRef,
        burn_ref: fungible_asset::BurnRef,
        extend_ref: object::ExtendRef,
        transfer_ref: option::Option<object::TransferRef>
    }

    fun init_module(sender: &signer) {
        let fungible_asset_creator_cref = object::create_named_object(sender, b"");
        let fungible_asset_creator_extend_ref =
            object::generate_extend_ref(&fungible_asset_creator_cref);
        let fungible_asset_creator_signer =
            &object::generate_signer(&fungible_asset_creator_cref);

        move_to(
            fungible_asset_creator_signer,
            SignerCapabilityStore { extend_ref: fungible_asset_creator_extend_ref }
        );
    }

    /// ==========================================================================
    /// Challenge TODOs
    /// ==========================================================================
    /// FA Public Launch Platform functionality:
    /// 1. `create` - Anyone can call this function to create a new FA (Fungible Asset).
    ///    The creator becomes the owner of the FA and gains mint permissions.
    /// 2. `mint` - Only the FA's creator (owner) can call this function to mint new tokens.
    /// 3. `burn` - Anyone can call this function to burn their own FA tokens.
    ///
    /// Look at `tests/fa_launchpad_test.move` for the exact expectations.

    /// Create a new FA (Fungible Asset)
    /// Anyone can call this function to create a new FA.
    /// - Creates a new FA object with metadata (name, symbol, decimals, etc.)
    /// - Stores `TokenRefsStore` containing mint_ref, burn_ref, and other references
    /// - Transfers the created FA object to the caller, who becomes the owner
    public fun create(
        sender: &signer,
        name: string::String,
        symbol: string::String,
        decimals: u8,
        icon_uri: string::String,
        project_uri: string::String
    ): Object<fungible_asset::Metadata> {
        abort 0
    }

    /// Mint FA tokens
    /// Only the FA's creator (owner) can call this function to mint new tokens.
    /// - Verifies that the caller is the owner of the FA
    /// - Uses mint_ref to mint the specified amount of tokens
    public fun mint(
        sender: &signer,
        metadata: Object<fungible_asset::Metadata>,
        amount: u64
    ): fungible_asset::FungibleAsset {
        abort 0
    }

    /// Burn FA tokens
    /// Anyone can call this function to burn their own FA tokens.
    /// - Uses burn_ref to burn the provided FA tokens
    public fun burn(fa: fungible_asset::FungibleAsset) {
        abort 0
    }

    public fun get_fungible_asset_creator_address(): address {
        object::create_object_address(&@contract, b"")
    }

    #[test_only]
    public fun init_for_test(sender: &signer) {
        init_module(sender);
    }
}

