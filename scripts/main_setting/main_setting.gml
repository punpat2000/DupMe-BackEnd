// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function main_setting(){
	global.perfect_pitch = buffer_read(buffer, buffer_u8);	
	global.instrument = buffer_read(buffer, buffer_u8);
	global.octave = buffer_read(buffer, buffer_u8);
	global.conducting_time = buffer_read(buffer, buffer_u8);
	global.number_of_round = buffer_read(buffer, buffer_u8);
	global.wallpaper = buffer_read(buffer, buffer_u8);
	//show_message("pp: " + string(global.perfect_pitch) + " " + "wallpaper" + string(global.wallpaper));
	
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, NETWORK.game_setting);
	buffer_write(server_buffer, buffer_u8, global.perfect_pitch);
	buffer_write(server_buffer, buffer_u8, global.instrument);
	buffer_write(server_buffer, buffer_u8, global.octave);
	buffer_write(server_buffer, buffer_u8, global.conducting_time);
	buffer_write(server_buffer, buffer_u8, global.number_of_round);
	buffer_write(server_buffer, buffer_u8, global.wallpaper);
	
	for(var i = 0; i < ds_list_size(socket_list); i++){
		network_send_packet(ds_list_find_value(socket_list, i), server_buffer, buffer_tell(server_buffer));
	}
}