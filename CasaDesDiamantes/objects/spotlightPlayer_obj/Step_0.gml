light[| eLight.X] = player_obj.x;
light[| eLight.Y] = player_obj.y;

if (shotlight) {
	light[| eLight.Range] = 125;
	shotlightTimer -= global.dt;
	light[| eLight.Range] -= global.dt / 5;
}

if (shotlightBig) {
	light[| eLight.Range] = 200;
	shotlightTimer -= global.dt;
	light[| eLight.Range] -= global.dt / 5;
}

if (shotlightTimer < 0) {
	shotlight = false;
	shotlightBig = false;
	light[| eLight.Range] = 75;
	shotlightTimer = 40;
}