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

part_emitter_region(global.partSystem, partEmitterFlamethrower, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(global.partSystem, partEmitterFlamethrower, global.flamethrowerSparkPart, 19);