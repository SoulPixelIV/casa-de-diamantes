//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Activate Checkpoint
if (distance_to_object(player_obj) < 32 && player_obj.key_up_pressed && !used)
{
	active = true;
}

if (distance_to_object(player_obj) < 32)
{
	global.lastCheckpoint = id;
}

if (active) {
	if (!playedSound1) {
		audio_play_sound_on(emitter, coinslot_snd, false, 1);
		playedSound1 = true;
	}
	timer1Sound -= global.dt;
}

if (timer1Sound < 0) {
	if (!playedSound2) {
		animationSpeed = 1;
		audio_play_sound_on(emitter, slotmachineSpinning_snd, false, 1);
		playedSound2 = true;
	}
	timer2Sound -= global.dt;
}

if (active && timer2Sound < 0)
{	
	if (instance_exists(spotlightbroken)) {
		with (spotlightbroken) {
			open = false;
		}
	}
	sprite_index = checkpointOff_spr;
}