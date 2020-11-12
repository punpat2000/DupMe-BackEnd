// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_mode_start(){
	buffer_seek(global.server_buffer, buffer_seek_start, 0);
	buffer_write(global.server_buffer, buffer_u8, NETWORK.status);
	buffer_write(global.server_buffer, buffer_u8, STATUS.player_mode_start);
	for(var i = 0; i < ds_list_size(socket_list); i++){
		network_send_packet(ds_list_find_value(socket_list, i), global.server_buffer, buffer_tell(global.server_buffer));
	}
}