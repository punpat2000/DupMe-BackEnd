// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_config(){
	var token_name = buffer_read(buffer, buffer_string);
	show_message("test!!!!!");
	//ds_map_add(async_load, name, token_name);
	//show_message("name: " + string(ds_map_find_value(async_load, name)));
	global._player.name = token_name;
	global.num_player_ready++;
	show_message("Name: " + string(global._player.name));
	if(global.num_player_ready == 2) {
						
	}
}