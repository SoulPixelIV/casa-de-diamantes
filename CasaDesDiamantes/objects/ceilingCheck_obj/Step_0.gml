if (!foundCeiling) {
	y -= global.dt * 2;
}

if (place_meeting(x, y, collider_obj)) {
	foundCeiling = true;
}

deathTimer -= global.dt;

if (deathTimer < 0 && !foundCeiling) {
	instance_destroy();
}