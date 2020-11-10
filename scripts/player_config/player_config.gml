// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_config(){
	var token_name = buffer_read(buffer, buffer_string);
	ds_map_find_value(socket_to_instanceid, socket).name = token_name
	
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, NETWORK.player_config);
	buffer_write(server_buffer, buffer_u8, PLAYER_CONFIG.name);
	buffer_write(server_buffer, buffer_string, token_name);
	network_send_packet(socket^3, server_buffer, buffer_tell(server_buffer));
	
	//show_message("Name: " + string(ds_map_find_value(socket_to_instanceid, socket).name));
}