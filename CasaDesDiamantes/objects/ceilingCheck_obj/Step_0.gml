if (!foundCeiling) {
	y -= global.dt * 2;
}

// Collision with Roof?
if (place_meeting(x, y, collider_obj)) {
	// No Empty Space Left & Right?
	if (place_meeting(x + 16, y - 2, collider_obj) && place_meeting(x - 16, y - 2, collider_obj)) {
		// No Wall Left & Right?
		if (!place_meeting(x + 16, y + 8, collider_obj) && !place_meeting(x - 16, y + 8, collider_obj)) {
			foundCeiling = true;
		}
	}
}

deathTimer -= global.dt;

if (deathTimer < 0 && !foundCeiling) {
	instance_destroy();
}