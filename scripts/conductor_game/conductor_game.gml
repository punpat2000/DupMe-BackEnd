// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function conductor_game(){
	
	
	if(global.current_game_round > global.game_round) {
		//game end
		show_message("Current round: " + string(global.current_game_round));
		show_message("Number of round: " + string(global.number_of_round));
	} else {
		var key_token = buffer_read(buffer, buffer_u8);
		global.stored_conductor_keys[global.conductor_keys_i++] = key_token;
		/*
		for(var i = 0; i < array_length_1d(global.stored_conductor_keys); i++;) {
			show_message(global.stored_keys[i]);	
		}
		*/
		//show_message(string(key_token));
		buffer_seek(global.server_buffer, buffer_seek_start, 0);
		buffer_write(global.server_buffer, buffer_u8, NETWORK.game_round); //network type
		buffer_write(global.server_buffer, buffer_u8, GAME_ROUND.conducter); //game mode??
		buffer_write(global.server_buffer, buffer_u8, key_token); // key
		var send_success = network_send_packet(socket^3, global.server_buffer, buffer_tell(global.server_buffer));
		//show_message(send_success);
		
	}
	
	
	
}