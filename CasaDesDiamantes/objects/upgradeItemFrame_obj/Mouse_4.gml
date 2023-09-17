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
		//ADD SECOND DUAL BARETTAS UPGRADE
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
		//ADD CUPY UPGRADE 1
	break;
	case 7:
		//ADD CUPY UPGRADE 2
	break;
	
}
