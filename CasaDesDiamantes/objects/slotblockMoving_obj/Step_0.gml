//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (vertOrHor == 0) {
	if (dir == 0) {
		x += global.dt;
	} else {
		x -= global.dt;
	}
} else {
	if (dir == 0) {
		y += global.dt;
	} else {
		y -= global.dt;
	}
}

//Audio
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
}

//Trigger on Contact with Player
if (distance_to_object(player_obj) < 10 && !used && !jumpAnim) {
	if (player_obj.y > y + 8) {
		if (player_obj.verspeed < 0) {
			jumpAnim = true;
			animationSpeed = 2;
		}
	}
}

if (jumpAnim) {
	if (!playedSound) {
		spinSound = audio_play_sound_on(emitter, slotmachineSpinning_snd, false, false);
		playedSound = true;
		sprite_index = slotblockJump_spr;
		image_index = 0;
	}
	if (image_index > image_number - 1) {
		used = true;
		jumpAnim = false;
	}
}

if (delayOn) {
	delayTimer -= global.dt;
	
	if (delayTimer < 0) {
		delayTimer = 100;
		delayOn = false;
	}
}

if (used && !spawned && !spinDone)
{
	animationSpeed = 1;
	if (!playedSound) {
		spinSound = audio_play_sound_on(emitter, slotmachineSpinning_snd, false, false);
		playedSound = true;
	}
	spinTimer -= global.dt;
	sprite_index = slotblockSpinning_spr;
	animationSpeed = 1;
}

if (spinTimer < 0)
{
	spinDone = true;
}

if (used && !spawned && spinDone)
{
	audio_play_sound_on(emitter, slotWin2_snd, false, false);
	if (spawnElement1 != noone)
	{
		repeat(spawnNumber1)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement1);
		}
	}
	if (spawnElement2 != noone)
	{
		repeat(spawnNumber2)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement2);
		}
	}
	if (spawnElement3 != noone)
	{
		repeat(spawnNumber3)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement3);
		}
	}
	if (spawnElement4 != noone)
	{
		repeat(spawnNumber4)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement4);
		}
	}
	if (spawnElement5 != noone)
	{
		repeat(spawnNumber5)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement5);
		}
	}
	spawned = true;
	sprite_index = slotblockOff_spr;
	animationSpeed = 1;
}

