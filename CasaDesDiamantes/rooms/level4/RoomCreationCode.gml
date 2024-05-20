if (global.spawn == 0)
{
	instance_create_layer(Spawn1_obj.x, Spawn1_obj.y, "Instances", player_obj);
}
if (global.spawn == 1)
{
	instance_create_layer(Spawn2_obj.x, Spawn2_obj.y, "Instances", player_obj);
}
if (global.spawn == 2)
{
	instance_create_layer(Spawn3_obj.x, Spawn3_obj.y, "Instances", player_obj);
}
if (global.spawn == 3)
{
	instance_create_layer(Spawn4_obj.x, Spawn4_obj.y, "Instances", player_obj);
}

global.currentWeapon = gameManager_obj.pickedWeapon.pistol;	
global.unlockedWeapon[0] = false;
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