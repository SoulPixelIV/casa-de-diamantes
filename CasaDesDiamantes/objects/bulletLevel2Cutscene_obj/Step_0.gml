/// @description Movement

zombie = instance_nearest(x, y, zombieGirl_obj);
move_towards_point(zombie.x, zombie.y, global.dt * 6);
image_angle = 211;

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && !place_meeting(x, y, colliderBulletFree_obj) && !place_meeting(x, y, colliderOneWay_obj))
	{
		audio_play_sound(bulletHitGround_snd, 1, false);
		instance_change(bulletHit_obj, true);
	}
}

if (dealtDamage)
{
	penetrationTime -= global.dt;
}
if (penetrationTime < 0)
{
	dealtDamage = false;
	penetrationTime = 3;
}