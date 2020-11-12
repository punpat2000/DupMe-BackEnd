// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function round_change(){
	
	
	var temp = ds_map_find_value(socket_to_instanceid, socket^3).player_role;
	ds_map_find_value(socket_to_instanceid, socket^3).player_role = ds_map_find_value(socket_to_instanceid, socket).player_role;
	ds_map_find_value(socket_to_instanceid, socket).player_role = temp;
	reset_game_values();
	
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.game_round);
	buffer_write(global.server_buffer, buffer_u8, GAME_ROUND.number);
	buffer_write(global.server_buffer, buffer_u8,global.game_round);
	for(var i = 0; i < ds_list_size(socket_list); i++){
		network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
	}
	
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.player_config);
	buffer_write(global.server_buffer, buffer_u8, PLAYER_CONFIG.role);
	buffer_write(global.server_buffer, buffer_u8, ds_map_find_value(socket_to_instanceid, socket).player_role);
	//show_message("Player1 Role" + string(ds_map_find_value(socket_to_instanceid, socket).player_role));
	network_send_packet(socket, global.server_buffer, buffer_tell(global.server_buffer));
	
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.player_config);
	buffer_write(global.server_buffer, buffer_u8, PLAYER_CONFIG.role);
	buffer_write(global.server_buffer, buffer_u8, ds_map_find_value(socket_to_instanceid, socket^3).player_role);
	//show_message("Player1 Role" + string(ds_map_find_value(socket_to_instanceid, socket^3).player_role));
	network_send_packet(socket^3, global.server_buffer, buffer_tell(global.server_buffer));
	
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.status);
	buffer_write(global.server_buffer, buffer_u8, STATUS.conducter_mode_start);
	for(var i = 0; i < ds_list_find_value(socket_list, i); i++) {
		network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
	}
	
}

function reset_game_values() {
	global.stored_conductor_keys = 0;
	global.stored_player_keys = 0;
	global.conductor_keys_i = 0;
	global.player_keys_i = 0;
}