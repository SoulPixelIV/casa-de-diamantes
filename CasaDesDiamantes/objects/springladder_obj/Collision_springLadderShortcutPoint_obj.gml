movedShortcut = true;
startPos = y;

if (audio_is_playing(springLadderShortcut_snd)) {
	audio_stop_sound(springLadderShortcut_snd);
}
playedSound = false;

if (index == 1) {
	global.level15Spring = true;
}
