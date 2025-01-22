mouseEntered = true;
audio_play_sound(typewriter_snd, 1, false);

if (!used) {
	if (frame == 3 && !global.dualBarettasUpgrade1) {
		image_index = 1;
	}
	else if (frame == 5 && !global.shotgunUpgrade1) {
		image_index = 1;
	}
	else if (frame == 7 && !global.cupyUpgrade1) {
		image_index = 1;
	}
	else if (frame == 9 && !global.silencedMPUpgrade1) {
		image_index = 1;
	}
	else if (frame == 11 && !global.sniperUpgrade1) {
	image_index = 1;
	} 
	else {
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
			upgradeMenu_obj.explanationText = "[Shotgun] Bullets Ricochet on Impact";
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
				upgradeMenu_obj.explanationText = "[CuPy] Companion shoots Enemies";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;
	case 8:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "[Silenced MP] Burn Enemies";
		}
	break;
	case 9:
		if (instance_exists(upgradeMenu_obj)) {
			if (global.silencedMPUpgrade1) {
				upgradeMenu_obj.explanationText = "[Silenced MP] Overheating Flame Dispenser after Cooldown";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;
	case 10:
		if (instance_exists(upgradeMenu_obj)) {
			upgradeMenu_obj.explanationText = "[Anti Material Rifle] Split Bullet in two for Double Damage";
		}
	break;
	case 11:
		if (instance_exists(upgradeMenu_obj)) {
			if (global.sniperUpgrade1) {
				upgradeMenu_obj.explanationText = "[Anti Material Rifle] Healing Area on Bullet Impact";
			} else {
				upgradeMenu_obj.explanationText = "";
			}
		}
	break;
}