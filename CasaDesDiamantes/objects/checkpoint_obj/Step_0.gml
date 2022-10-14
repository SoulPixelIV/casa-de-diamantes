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

//Drop Reward
if (active && timer2Sound < 0)
{	
	item = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,3,3,3,3,3,5);
	
	if (item == 1)
	{
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 64, y, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.ledBluePart, 50);

		part_emitter_destroy(global.partSystem, partEmitter);

		audio_play_sound_on(emitter, slotmachineLevel1_snd, false, 1);
		var maxAmount = random_range(moneyDropMin, moneyDropMax);
		for (i = 0; i < maxAmount; i++)
		{
			chip = choose(1,1,1,1,1,2,2,2,3)
		
			if (chip == 1)
			{
				var chipblue = instance_create_layer(x, y - 64, "Instances", chipBluePickup_obj);
				chipblue.verspeed += -2.5;
			}
			if (chip == 2)
			{
				var chipred = instance_create_layer(x, y - 64, "Instances", chipRedPickup_obj);
				chipred.verspeed += -2.3;
			}
			if (chip == 3)
			{
				var chipviolet = instance_create_layer(x, y - 64, "Instances", chipVioletPickup_obj);
				chipviolet.verspeed += -2;
			}
		}
	}
	if (item == 2)
	{
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 64, y, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.ledRedPart, 85);

		part_emitter_destroy(global.partSystem, partEmitter);
		audio_play_sound_on(emitter, slotmachineLevel2_snd, false, 1);
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			ammo = choose(1,1,1,1,1,2,2)
		
			if (ammo == 1)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackPistolDrop_obj);
			}
			if (ammo == 2)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackShotgunDrop_obj);
			}
		}
	}
	if (item == 3)
	{
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 64, y, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.ledRedPart, 85);

		part_emitter_destroy(global.partSystem, partEmitter);
		audio_play_sound_on(emitter, slotmachineLevel2_snd, false, 1);
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			instance_create_layer(x, y - 64, "Instances", healthpackDrop_obj);
		}
	}
	if (item == 5)
	{
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, x - 32, x + 32, y - 64, y, ps_shape_ellipse, ps_distr_invgaussian);

		part_emitter_burst(global.partSystem, partEmitter, global.ledYellowPart, 100);

		part_emitter_destroy(global.partSystem, partEmitter);
		
		audio_play_sound_on(emitter, slotmachineLevel3_snd, false, 1);
		var maxAmount = random_range(moneyDropMin, moneyDropMax);
		for (i = 0; i < maxAmount; i++)
		{
			chip = choose(1,1,1,1,1,2,2,2,3)
		
			if (chip == 1)
			{
				var chipblue = instance_create_layer(x, y - 64, "Instances", chipBluePickup_obj);
				chipblue.verspeed += -2.5;
			}
			if (chip == 2)
			{
				var chipred = instance_create_layer(x, y - 64, "Instances", chipRedPickup_obj);
				chipred.verspeed += -2.3;
			}
			if (chip == 3)
			{
				var chipviolet = instance_create_layer(x, y - 64, "Instances", chipVioletPickup_obj);
				chipviolet.verspeed += -2;
			}
		}
		
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			ammo = choose(1,1,1,1,1,2,2)
		
			if (ammo == 1)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackPistolDrop_obj);
			}
			if (ammo == 2)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackShotgunDrop_obj);
			}
		}
		
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			instance_create_layer(x, y - 64, "Instances", healthpackDrop_obj);
		}
	}

	active = false;
	used = true;
	playedSound1 = false;
	playedSound2 = false;
	timer1Sound = 100;
	timer2Sound = 450;
	sprite_index = checkpoint_spr;
	animationSpeed = 0.3;
}