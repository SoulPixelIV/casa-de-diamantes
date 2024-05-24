/// @description Variables

damage = 180;
damageBonus = 0;
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
dir = player_obj.dirCursor + random_range(-0.2, 0.2);

dealtDamage = false;
createdFire = false;

