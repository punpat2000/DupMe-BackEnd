// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function notify_clients(player_action){
	buffer_seek(server_buffer,buffer_seek_start,0);
	show_message("socket notify: "+string(socket));
	buffer_write(server_buffer, buffer_u8, NETWORK.player_event);
	buffer_write(server_buffer, buffer_u8, player_action); // joined or left
	buffer_write(server_buffer, buffer_u8, global.num_player); // total number of players
	switch(player_action) {
		case PLAYER_EVENT.left:
			network_send_packet(socket^3, server_buffer, buffer_tell(server_buffer)); //socket# xor 11 -> 10 or 01
			break;
		case PLAYER_EVENT.joined:
			for(var i = 0; i < ds_list_size(socket_list); i++){
				network_send_packet(ds_list_find_value(socket_list, i), server_buffer, buffer_tell(server_buffer));
			}
			break;
	}
}