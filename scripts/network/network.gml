enum NETWORK {
	game_mode,
	status,
	game_round,
	player_event,
	player_config,
	player_establish,
	game_setting,
	player_status
}

enum PLAYER_STATUS {
	host,
	guest
}

enum PLAYER_CONFIG {
	name, //client sends to server
	role, //server randomly assigns
	increment_score,
	wrong_key,
	right_keys,
	reset,
}

enum PLAYER_EVENT {
	joined,
	left,
}

enum GAME_ROUND {
	conducter,
	player,
	number,
}

enum ROLE {
	conducter,
	player
}

enum STATUS {
	wait_for_other,
	wait_for_your_readiness,
	wait_for_ready,
	ready_pressed,
	conducter_mode_start,
	player_mode_start,
	during_conducter_game,
	during_player_game,
	disconnected,
	start_pressed,
	conductor_mode_end,
	player_mode_end,
	game_ended,
	game_reset
}

enum MODE {
	guitar,
	piano
}

enum WALLPAPER {
	overworld,
	nether,
	theend
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
	br,
	cm,
	csm,
	dm,
	dsm,
	em,
	fm,
	fsm,
	gm,
	gsm,
	am,
	asm,
	bm,
}