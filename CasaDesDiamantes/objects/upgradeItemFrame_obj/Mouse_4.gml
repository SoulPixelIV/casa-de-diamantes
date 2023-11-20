switch (frame) {
	case 1:
	break;
	case 2:
		if (global.money >= 1350 && !global.dualBarettasUpgrade1) {
			global.dualBarettasUpgrade1 = true;
			global.money -= 1350;
			frame = 0;
			used = true;
		}
	break;
	case 3:
		if (global.money >= 1920 && !global.dualBarettasUpgrade2) {
			global.dualBarettasUpgrade2 = true;
			global.money -= 1920;
			frame = 0;
			used = true;
		}
	break;
	case 4:
		if (global.money >= 1850 && !global.shotgunUpgrade1) {
			global.shotgunUpgrade1 = true;
			global.money -= 1850;
			frame = 0;
			used = true;
		}
	break;
	case 5:
		if (global.money >= 2430 && !global.shotgunUpgrade2) {
			global.shotgunUpgrade2 = true;
			global.money -= 2430;
			frame = 0;
			used = true;
		}
	break;
	case 6:
		if (!global.cupyUpgrade1) {
			global.cupyUpgrade1 = true;
			frame = 0;
			used = true;
		}
	break;
	case 7:
		if (global.money >= 3450 && !global.cupyUpgrade2) {
			global.cupyUpgrade2 = true;
			global.money -= 3450;
			frame = 0;
			used = true;
		}
	break;
	
}
