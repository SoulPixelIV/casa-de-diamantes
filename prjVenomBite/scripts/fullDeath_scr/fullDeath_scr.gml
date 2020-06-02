camera_obj.noZoom = false;
camera_obj.deathVignette = false;
camera_obj.noHUD = false;
camera_obj.drawInfectionText = false;
player_obj.movement = true;
player_obj.hp = 100;
player_obj.maxhp = 100;

if (player_obj.lastCheckpoint != noone)
{
	player_obj.x = player_obj.lastCheckpoint.x;
	player_obj.y = player_obj.lastCheckpoint.y - 64;
}