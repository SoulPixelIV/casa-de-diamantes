if (open) {
	if (!switchOn) {
		image_index = 1;
		switchOn = true;
	}
	countDelay -= global.dt;
	if (countDelay < 0) {
		image_index++;
		countDelay = countDelaySave;
	}
}

if (used && !spawned && !spinDone)
{
	spinTimer -= global.dt;
	sprite_index = slotblockSpinning_spr;
	animationSpeed = 1;
	if (!playedSound) {
		spinSound = audio_play_sound_on(emitter, slotmachineSpinning_snd, false, false);
		playedSound = true;
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

if (spinTimer < 0)
{
	spinDone = true;
}

if (used && !spawned && spinDone)
{
	animationSpeed = 1;
	audio_stop_sound(spinSound);
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

