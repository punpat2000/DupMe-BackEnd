// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_game(){
	//show_message("Recieved")
	var key_token = buffer_read(buffer, buffer_u8);
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.game_round); //network type
	buffer_write(global.server_buffer, buffer_u8, GAME_ROUND.player); //game mode??
	buffer_write(global.server_buffer, buffer_u8, key_token); // key
	network_send_packet(socket^3, global.server_buffer, buffer_tell(global.server_buffer));
	global.stored_player_keys[global.player_keys_i] = key_token;
	if(global.player_keys_i + 1 == global.conductor_keys_i) {
		//show_message(global.current_game_round + 1)
		if (global.current_game_round + 1 == global.game_round * 2) {
			//finish
			global.current_game_round = 0;
			buffer_seek(global.server_buffer, buffer_seek_start, 0);
			buffer_write(global.server_buffer, buffer_u8, NETWORK.status); //network type
			buffer_write(global.server_buffer, buffer_u8, STATUS.game_ended); //game mode??
			for(var i = 0; i < ds_list_size(socket_list); i++){
				network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
			}
		} else {
			global.current_game_round++;
			//swap roll
			buffer_seek(global.server_buffer, buffer_seek_start, 0);
			buffer_write(global.server_buffer, buffer_u8, NETWORK.player_config); //network type
			buffer_write(global.server_buffer, buffer_u8, PLAYER_CONFIG.right_keys); //game mode??
			for(var i = 0; i < ds_list_size(socket_list); i++){
				network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
			}
		}
		
		
		//round_change();
	} else {
		if(global.stored_player_keys[global.player_keys_i] != global.stored_conductor_keys[global.player_keys_i]) {
			//show_message(global.current_game_round + 1)
			//show_message(global.game_round * 2)
			if (global.current_game_round + 1 == global.game_round * 2) {
				global.current_game_round = 0;
				buffer_seek(global.server_buffer, buffer_seek_start, 0);
				buffer_write(global.server_buffer, buffer_u8, NETWORK.status); //network type
				buffer_write(global.server_buffer, buffer_u8, STATUS.game_ended); //game mode??
				for(var i = 0; i < ds_list_size(socket_list); i++){
					network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
				}
			} else {
				global.current_game_round++;
				//swap roll
				//end_round
			//send wrong key
				buffer_seek(global.server_buffer, buffer_seek_start, 0);
				buffer_write(global.server_buffer, buffer_u8, NETWORK.player_config); //network type
				buffer_write(global.server_buffer, buffer_u8, PLAYER_CONFIG.wrong_key); //game mode??
				for(var i = 0; i < ds_list_size(socket_list); i++){
					network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
				}
			}
			
		} else {
			//var _player_score = ds_map_find_value(socket_to_instanceid, socket).player_score;
			//_player_score++;
			//show_message("success");
			buffer_seek(global.server_buffer, buffer_seek_start, 0);
			buffer_write(global.server_buffer, buffer_u8, NETWORK.player_config); //network type
			buffer_write(global.server_buffer, buffer_u8, PLAYER_CONFIG.increment_score); //game mode??
			for(var i = 0; i < ds_list_size(socket_list); i++){
				network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
			}
			global.player_keys_i++;
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