// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_game(){
	var key_token = buffer_read(buffer, buffer_u8);
	global.stored_player_keys[global.player_keys_i++] = key_token;
	
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.game_round); //network type
	buffer_write(global.server_buffer, buffer_u8, GAME_ROUND.player); //game mode??
	buffer_write(global.server_buffer, buffer_u8, key_token); // key
	network_send_packet(socket^3, global.server_buffer, buffer_tell(global.server_buffer));
	if(global.player_keys_i > global.conductor_keys_i) {
		//end_round
	} else {
		if(global.stored_player_keys[global.player_keys_i] != global.stored_conductor_keys[global.player_keys_i]) {
			//end_round
		} else {
			//var _player_score = ds_map_find_value(socket_to_instanceid, socket).player_score;
			//_player_score++;
			
		}
		
	}
	/*
	for(var i = 0; i < array_length_1d(global.stored_player_keys); i++) {
		if(global.stored_conductor_keys[i] == global.stored_player_keys[i]) {
			//how can we know what player to added score to
		} else {
			//end_round
		}
	}
	*/
}