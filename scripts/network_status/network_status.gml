// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_status(){
	var _status = buffer_read(buffer, buffer_u8);
	switch(_status) {
		case STATUS.ready_pressed:
			key_ready_pressed();
			break;
		case STATUS.start_pressed:
			key_start_pressed();
			break;
		case STATUS.conductor_mode_end:
			player_mode_start();
			break;
		case STATUS.player_mode_end:
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
			break;
	}
}