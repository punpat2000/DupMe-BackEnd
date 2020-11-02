// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function notify_clients(player_action){
	buffer_seek(server_buffer,buffer_seek_start,0);
	buffer_write(server_buffer, buffer_u8, NETWORK.player_event);
	buffer_write(server_buffer, buffer_u8, player_action); // joined or left
	buffer_write(server_buffer, buffer_u8, global.num_player); // total number of players
	network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
}