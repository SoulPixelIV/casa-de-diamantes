if (global.spawn == 0)
{
	instance_create_layer(Spawn1_obj.x, Spawn1_obj.y, "Instances", player_obj);
}
if (global.spawn == 1)
{
	instance_create_layer(Spawn2_obj.x, Spawn2_obj.y, "Instances", player_obj);
}

global.unlockedWeapon[1] = false;
global.unlockedWeapon[2] = false;
global.unlockedWeapon[3] = false;
global.unlockedWeapon[4] = false;
global.pistolAmmo = 0;
global.shotgunAmmo = 0;
global.sniperAmmo = 0;
global.bowAmmo = 0;
global.silencedMPAmmo = 0;
global.hasWarpzoneKey = false;