startDelay -= global.dt;

if (startDelay < 0) {
	if (image_alpha < 1) {
		image_alpha += global.dt / 300;
	}
	endDelay -= global.dt;
}

if (endDelay < 0) {
	if (image_alpha > 0) {
		image_alpha -= global.dt / 200;
	} else {
		if (instance_exists(endcredits_obj)) {
			endcredits_obj.open = true;
		}
	}
}
