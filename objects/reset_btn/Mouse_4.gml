buffer_seek(global.server_buffer, buffer_seek_start, 0);
buffer_write(global.server_buffer, buffer_u8, NETWORK.status); //network type
buffer_write(global.server_buffer, buffer_u8, STATUS.game_reset); //game mode??
network_send_packet(1, global.server_buffer, buffer_tell(global.server_buffer));
network_send_packet(2, global.server_buffer, buffer_tell(global.server_buffer));

buffer_seek(global.server_buffer, buffer_seek_start, 0);
buffer_write(global.server_buffer, buffer_u8, NETWORK.status);
buffer_write(global.server_buffer, buffer_u8, STATUS.wait_for_your_readiness);
network_send_packet(2, global.server_buffer, buffer_tell(global.server_buffer));
				
buffer_seek(global.server_buffer, buffer_seek_start, 0);
buffer_write(global.server_buffer, buffer_u8, NETWORK.status);
buffer_write(global.server_buffer, buffer_u8, STATUS.wait_for_ready);
network_send_packet(1, global.server_buffer, buffer_tell(global.server_buffer));

reset_game_values();