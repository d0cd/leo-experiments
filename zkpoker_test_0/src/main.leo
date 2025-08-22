import room_manager.aleo;
import house_dealer.aleo;

// Testnet configs.
// const PLAYER_0_ADDRESS: address = aleo155lp6t4vhlx0d4mjfn9z535n5zthcfwsud4av9zyxxe5skr2sg9qafc428;
// const PLAYER_1_ADDRESS: address = aleo1haj3062qxjagwg7yzdq6w5mvf70qhcca39mvawcyanun5e73d5qqlepx66;
// const DEALER_ADDRESS: address = aleo1udk86zevqp0gyz7jkjxz03l7qadvafqah4kkmdrkgpy2vuw7qszqvp96v4;
// const GSM_ADDRESS: address = aleo1vlfw7s4r04c40pfy6x87zg6xx3flt5raerep4etysawufq0kdc8qwqu6t6;

// Devnet configs.
// const PLAYER_0_ADDRESS: address = ;
// const PLAYER_1_ADDRESS: address = ;
// const DEALER_ADDRESS: address = ;
// const GSM_ADDRESS: address = ;

program zkpoker_test_0.aleo {

    // Set up the room.
    transition set_up_game() -> (room_manager.aleo/RoomConfig, Future) {
        assert_eq(self.signer, )
        let (config, f1) = room_manager.aleo/rm_create_room(
            2u64, 1u64, 2u64, 2u8, 2u64
        );
        let f2: Future = room_manager.aleo/join_room(config.room_id, 2u64);


    }

}
