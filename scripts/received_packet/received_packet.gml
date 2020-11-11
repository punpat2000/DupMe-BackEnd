with(con_server) {
	buffer = argument0;
	socket = argument1;
	msgid = buffer_read(buffer, buffer_u8);
	//show_message(msgid)
	
	switch(msgid) {
		case NETWORK.status:
			network_status();
			break;
		case NETWORK.game_round:
			var gameround = buffer_read(buffer, buffer_u8);
			switch(gameround) {
				case GAME_ROUND.conducter:
					conductor_game();
					break;
				case GAME_ROUND.player:
					player_game();
					break;
			}
			break;
		case NETWORK.player_config:
			var _config = buffer_read(buffer, buffer_u8);
			switch(_config) {
				case PLAYER_CONFIG.name:
					player_config();
					break;
				case PLAYER_CONFIG.reset:
					global.resets++;
					if (global.resets == 2) {
						round_change();
						global.resets = 0;
					}
					
			}
			break;
		case NETWORK.game_setting:
			//show_message("game setting called");
			if (socket == 1)
				main_setting();
			break;
	}
	
	function reset_stored_keys() {
		global.i = 0;
		global.stored_keys = 0;
	}
	/*
	function player_game() {
		var key_token = buffer_read(buffer, buffer_u8);
		//check with stored_key
		
	}
	*/
}

