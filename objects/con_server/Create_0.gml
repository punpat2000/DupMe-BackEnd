port = 7889;
max_clients = 2;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);
socket_list = ds_list_create();

socket_to_instanceid = ds_map_create();

globalvar stored_conducter_keys;
globalvar stored_player_keys;
global.i = 0;

global.num_player = 0;

globalvar player_1_role;
globalvar player_2_role;

globalvar player_1_name;
globalvar player_2_name;

globalvar player_1_score;
globalvar player_2_score;

global.num_player_ready = 0;

global.game_round = 0;

globalvar perfect_pitch;
globalvar instrument;
globalvar octave;
globalvar conducting_time;
globalvar number_of_round;
globalvar wallpaper;

