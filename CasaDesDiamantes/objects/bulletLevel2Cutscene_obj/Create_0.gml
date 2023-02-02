/// @description Variables

audio_play_sound(pistolShot_snd, 1, false);
damageBonus = 100;
if (instance_exists(player_obj))
{
	damageBonus = player_obj.sniperDamageValue;
	player_obj.sniperDamageValue = 0;
}
movSpeed = 7;
penetration = 5;
penetrationTime = 3;
deleteTimer = 95;
invincibilityTimer = 5;

dealtDamage = false;
createdFire = false;






