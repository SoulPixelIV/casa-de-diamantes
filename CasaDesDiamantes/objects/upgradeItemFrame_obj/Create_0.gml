image_speed = 0;
image_index = frame;
nameText = "nameText";
priceText = "priceText";
price = 0;
twolinemode = false;
used = false;
mouseEntered = false;

switch (frame) {
	case 1:
	break;
	case 2:
		if (global.dualBarettasUpgrade1) {
			used = true;
		}
	break;
	case 3:
		if (global.dualBarettasUpgrade2) {
			used = true;
		}
	break;
	case 4:
		if (global.shotgunUpgrade1) {
			used = true;
		}
	break;
	case 5:
		if (global.shotgunUpgrade2) {
			used = true;
		}
	break;
	case 6:
		if (global.cupyUpgrade1) {
			used = true;
		}
	break;
	case 7:
		if (global.cupyUpgrade2) {
			used = true;
		}
	case 8:
		if (global.silencedMPUpgrade1) {
			used = true;
		}
	case 9:
		if (global.silencedMPUpgrade2) {
			used = true;
		}
	case 10:
		if (global.sniperUpgrade1) {
			used = true;
		}
	case 11:
		if (global.sniperUpgrade2) {
			used = true;
		}
	break;	
}

