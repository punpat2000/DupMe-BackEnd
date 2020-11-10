// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function conducter_game(){
	var key_token = buffer_read(buffer, buffer_u8);
	global.stored_conducter_keys[global.i++] = key_token;
	for(var i = 0; i < array_length_1d(global.stored_conducter_keys); i++;) {
		//show_message(global.stored_keys[i]);	
	}
	show_message(string(key_token));
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, NETWORK.game_round); //network type
	buffer_write(server_buffer, buffer_u8, GAME_ROUND.conducter); //game mode??
	buffer_write(server_buffer, buffer_u8, key_token); // key
	network_send_packet(socket^3, server_buffer, buffer_tell(server_buffer));
}