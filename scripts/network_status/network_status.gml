// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_status(){
	var _status = buffer_read(buffer, buffer_u8);
	switch(_status) {
		case STATUS.ready_pressed:
			key_ready_pressed();
			break;
		case STATUS.start_pressed:
			key_start_pressed();
			break;
	}
}