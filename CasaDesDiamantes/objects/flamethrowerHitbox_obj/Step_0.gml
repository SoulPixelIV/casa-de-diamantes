x = player_obj.partX2;
y = player_obj.partY2;
image_angle = player_obj.dirCursor;

if (dealtDamage = true) {
	damageDelay -= global.dt;
	if (damageDelay < 0) {
		dealtDamage = false;
		damageDelay = damageDelaySave;
	}
}