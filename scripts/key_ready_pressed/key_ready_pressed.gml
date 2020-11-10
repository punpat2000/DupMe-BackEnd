// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function key_ready_pressed(){
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, NETWORK.status);
	buffer_write(server_buffer, buffer_u8, STATUS.ready_pressed);
	network_send_packet(socket^3, server_buffer, buffer_tell(server_buffer));
}