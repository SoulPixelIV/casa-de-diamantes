moving = false;

with (player_obj) {
	jump_scr();
	verspeed -= global.dt * 1.7;
	onSpringLadderDelay = onSpringLadderDelaySave;
	onSpringLadder = false;
	gravityOn = true;
}




