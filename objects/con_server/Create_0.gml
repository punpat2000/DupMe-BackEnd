port = 7889;
max_clients = 2;

network_create_server(network_socket_tcp, port, max_clients);

global.server_buffer = buffer_create(1024, buffer_grow, 1);
socket_list = ds_list_create();

socket_to_instanceid = ds_map_create();

randomize();

globalvar stored_conductor_keys;
globalvar stored_player_keys;
global.conductor_keys_i = 0;
global.player_keys_i = 0;
global.resets = 0;

global.num_player = 0;

global.num_player_ready = 0;

globalvar game_round;

global.current_game_round = 0;

globalvar perfect_pitch;
globalvar instrument;
globalvar octave;
globalvar conducting_time;
globalvar number_of_round;
globalvar wallpaper;

