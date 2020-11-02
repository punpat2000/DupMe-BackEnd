enum NETWORK {
	game_mode,
	status,
	game_round,
	player_event,
	player_config,
	player_establish,
	game_setting,
}

enum GAME_SETTING {
	perfect_pitch,
	instrument,
	octave,
	arm_sound,
	set_conducting_time,
	set_number_of_round,
	wallpaper
}

enum PERFECT_PITCH {
	true,
	false
}

enum INSTRUMENT {
	piano,
	guitar
}

enum OCTAVE {
	true,
	false
}

enum ARM_SOUND {
	true,
	false
}

enum SET_CONDUCTING_TIME {
	conducting_time_5s,
	conducting_time_10s,
	conducting_time_15s,
	conducting_time_20s
}

enum SET_NUMBER_OF_ROUND {
	number_of_round_2,
	number_of_round_3,
	number_of_round_4,
	number_of_round_5
}
	

enum CONFIG {
	name, //client sends to server
	role, //server randomly assigns
}

enum PLAYER_EVENT {
	joined,
	left,
}

enum GAME_ROUND {
	conducter,
	player,
}

enum ROLE {
	conducter,
	player
}

enum STATUS {
	wait_for_other,
	wait_for_your_readiness,
	wait_for_other_ready,
	ready_pressed,
	conducter_mode_start,
	player_mode_start,
	during_conducter_game,
	during_player_game,
	disconnected,
}

enum MODE {
	guitar,
	piano
}

enum PIANOKEYS {
	c,
	cs,
	d,
	ds,
	e,
	f,
	fs,
	g,
	gs,
	a,
	as,
	b,
	cr,
	csr,
	dr,
	dsr,
	er,
	fr,
	fsr,
	gr,
	gsr,
	ar,
	asr,
	br
}