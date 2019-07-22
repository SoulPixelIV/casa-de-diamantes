/// @description Other HUD Elements

//Slowmo Circle
if (player_obj.slowmoTimer > 350)
{
	draw_sprite(slowmoEnergyCircle_spr, 0, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 300)
{
	draw_sprite(slowmoEnergyCircle_spr, 1, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 250)
{
	draw_sprite(slowmoEnergyCircle_spr, 2, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 200)
{
	draw_sprite(slowmoEnergyCircle_spr, 3, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 150)
{
	draw_sprite(slowmoEnergyCircle_spr, 4, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 100)
{
	draw_sprite(slowmoEnergyCircle_spr, 5, player_obj.x - 32, player_obj.y - 32);
}
else if (player_obj.slowmoTimer > 50)
{
	draw_sprite(slowmoEnergyCircle_spr, 6, player_obj.x - 32, player_obj.y - 32);
}