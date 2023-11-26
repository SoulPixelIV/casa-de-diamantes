mouseEntered = true;

if (!used) {
	if (frame == 3 && !global.dualBarettasUpgrade1) {
		image_index = 8;
	}
	else if (frame == 5 && !global.shotgunUpgrade1) {
		image_index = 8;
	}
	else if (frame == 7 && !global.cupyUpgrade1) {
		image_index = 8;
	} else {
		image_index = (image_number / 2) + frame;
	}
}

switch (frame) {
	case 1:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "";
		}
	break;
	case 2:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "[Dual Barettas] Freeze & Slow Enemies";
		}
	break;
	case 3:
		if (instance_exists(upgradeMenu_obj)) {
			if (global.dualBarettasUpgrade1) {
				upgradeMenu_obj.explanationText = "[Dual Barettas] Frozen Enemies hurt each other";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;
	case 4:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "[Shotgun] Bullets ricochet on impact";
		}
	break;
	case 5:
		if (instance_exists(upgradeMenu_obj)) {
			if (global.shotgunUpgrade1) {
				upgradeMenu_obj.explanationText = "[Shotgun] Ricocheting Bullets multiply in damage";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;
	case 6:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "[CuPy] Support Companion";
		}
	break;
	case 7:
		if (instance_exists(upgradeMenu_obj)) {
			if (global.cupyUpgrade1) {
				upgradeMenu_obj.explanationText = "[CuPy] Companion shoots enemies";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;	
}