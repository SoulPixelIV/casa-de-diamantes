//Animation
image_speed = 0;
image_index += global.dt / 15 * animationSpeed;

var currPlayerAngle = point_direction(x, y, player_obj.x, player_obj.y) + 90;

if (instance_exists(player_obj) && distance_to_object(player_obj) < aggroRange)
{
	if (currPlayerAngle < image_angle) {
		if (!firstSpinDone) {
			image_angle -= global.dt * 3;
		} else {
			image_angle -= global.dt / 3;
		}
	} else { 
		if (!firstSpinDone) {
			image_angle += global.dt * 3;
		} else {
			image_angle += global.dt / 3;
		}
	}
}

if ((image_angle < currPlayerAngle + 1) && (image_angle > currPlayerAngle - 1)) {
	firstSpinDone = true;
}

if (distance_to_object(player_obj) > aggroRange && instance_exists(player_obj)) {
	image_angle += 0;
}

//Sight Check
if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
{
	if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
	{
		if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
		{
			aimDelay -= global.dt;
		}
	}
}
else
{
	aimDelay = 230;
}

if (aimDelay < 140)
{
	if (animationSpeed < 1)
	{
		animationSpeed += global.dt / 120;
	}
	if (animationSpeed > 1)
	{
		animationSpeed = 1;
	}
}

if (aimDelay < 40 && aimDelay > 10)
{
	if (!audio_is_playing(chaingunLocked_snd))
	{
		audio_play_sound(chaingunLocked_snd, 1, false);
	}
}

if (aimDelay < 0)
{
	shootDelay -= global.dt;
}

if (aimDelay < -100)
{
	aimDelay = 230;
	throttle = true;
	setTarget = false;
}

if (throttle)
{  
	if (animationSpeed > 0)
	{
		animationSpeed -= global.dt / 120;
	}
	if (animationSpeed < 0)
	{
		animationSpeed = 0;
		throttle = false;
	}
}

if (shootDelay < 0)
{
	instance_create_layer(random_range(x - 7, x + 8), y, "Instances", bulletChaingun_obj);
	shootDelay = 5;
}

//###Death###
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
	//Enemy Slowmo
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9)
	{
		player_obj.enemySlowmo = true;
		camera_obj.follow = deathCross;
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,2)
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
		}
	}
	damageTint = false;
	instance_change(zombieGirlDeath2_obj, true);
}

if (damageTint)
{
	sprite_index = chaingunTurretFlash_spr;
	damageTintTimer -= global.dt;
}

if (damageTintTimer < 0)
{
	sprite_index = chaingunTurret_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}