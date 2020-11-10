// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function notify_clients(player_action){
	//buffer_seek(server_buffer,buffer_seek_start,0);
	//show_message("socket notify: "+string(socket));
	//buffer_write(server_buffer, buffer_u8, NETWORK.status);
	//buffer_write(server_buffer, buffer_u8, player_action); // joined or left
	//buffer_write(server_buffer, buffer_u8, global.num_player); // total number of players
	switch(player_action) {
		case PLAYER_EVENT.left:
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, NETWORK.status);
			buffer_write(server_buffer, buffer_u8, STATUS.wait_for_other);
			//for(var i = 0; i < ds_list_size(socket_list); i++){
			//	network_send_packet(ds_list_find_value(socket_list, i), server_buffer, buffer_tell(server_buffer));
			//}
			break;
		case PLAYER_EVENT.joined:
			if(global.num_player == 1) {
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, NETWORK.status);
				buffer_write(server_buffer, buffer_u8, STATUS.wait_for_other);
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			} else {
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, NETWORK.status);
				buffer_write(server_buffer, buffer_u8, STATUS.wait_for_your_readiness);
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
				
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, NETWORK.status);
				buffer_write(server_buffer, buffer_u8, STATUS.wait_for_ready);
				network_send_packet(socket^3, server_buffer, buffer_tell(server_buffer));
				
				
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, NETWORK.player_config);
				buffer_write(server_buffer, buffer_u8, PLAYER_CONFIG.name);
				//show_message("socket="+string(socket));
				//show_message("ืsocket for socket^^3=" + string(socket^3))
				buffer_write(server_buffer, buffer_string, string(ds_map_find_value(con_server.socket_to_instanceid, socket^3).name)); //retrieve socket's object's name
				//show_message("line 41:" + string(ds_map_find_value(con_server.socket_to_instanceid, socket^3).name));
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer)); //11 ^^ 10 = 01 send to 
			}
			break;
	}
}