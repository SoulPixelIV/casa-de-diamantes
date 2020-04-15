camera_obj.noZoom = false;
camera_obj.deathVignette = false;
camera_obj.noHUD = false;
camera_obj.drawInfectionText = false;
player_obj.movement = true;
/*
if (camera_obj.viewX < 640 || camera_obj.viewY < 360)
{
	camera_obj.viewX += 16 * 2;
	camera_obj.viewY += 9 * 2;
}
*/
player_obj.syringes -= 1;
player_obj.syringesLost += 1;
player_obj.hp = 100 - 25 * player_obj.syringesLost;
player_obj.maxhp -= 25;
player_obj.invincible = true;
player_obj.isZombie = true;
audio_play_sound(infectedVoice_snd, 1, false);