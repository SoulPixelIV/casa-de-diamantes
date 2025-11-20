draw_self();

switch (frame) {
	case 1:
		nameText = "Locked";
		priceText = "";
	break;
	case 2:
		if (!global.dualBarettasUpgrade1) {
			nameText = "Ice HP\nBullets";
			priceText = "1680$";
			price = 1680;
			twolinemode = true;
		} else {
			nameText = "Ice HP\nBullets";
			priceText = "Purchased";
			price = 9999999999999999;
			twolinemode = true;
		}
	break;
	case 3:
		price = 2400;
		
		if (!global.dualBarettasUpgrade2) {
			if (!global.dualBarettasUpgrade1) {
				twolinemode = false;
				nameText = "Locked";
				priceText = "";
				if (!used && !mouseEntered) {
					image_index = 1;
				}
			} else {
				twolinemode = true;
				nameText = "Freeze\nBreakshot";
				priceText = "2400$";
				if (!used && !mouseEntered) {
					image_index = frame;
				}
			}
		} else {
			twolinemode = true;
			nameText = "Freeze\nBreakshot";
			priceText = "Purchased";
			price = 999999999999;
			if (!used && !mouseEntered) {
				image_index = frame;
			}
		}
	break;
	case 4:
		if (!global.shotgunUpgrade1) {
			nameText = "Inf. Range\nShots";
			priceText = "2300$";
			price = 2300;
			twolinemode = true;
		} else {
			nameText = "Inf. Range\nShots";
			priceText = "Purchased";
			price = 9999999999999;
			twolinemode = true;
		}
	break;
	case 5:
		price = 3000;
		twolinemode = true;
		
		if (!global.shotgunUpgrade2) {
			if (!global.shotgunUpgrade1) {
				twolinemode = false;
				nameText = "Locked";
				priceText = "";
				if (!used && !mouseEntered) {
					image_index = 1;
				}
			} else {
				twolinemode = true;
				nameText = "Ricochet H\nBullets";
				priceText = "3000$";
				if (!used && !mouseEntered) {
					image_index = frame;
				}
			}
		} else {
			twolinemode = true;
				nameText = "Ricochet H\nBullets";
				priceText = "Purchased";
				price = 999999999999;
				if (!used && !mouseEntered) {
					image_index = frame;
				}
		}
	break;
	case 6:
		if (!global.cupyUpgrade1) {
			nameText = "CuPy Drone";
			priceText = "0$";
			price = 0;
		} else {
			nameText = "CuPy Drone";
			priceText = "Purchased";
			price = 9999999999999999;
		}
	break;
	case 7:
		price = 4300;
		twolinemode = true;
		
		if (!global.cupyUpgrade2) {
			if (!global.cupyUpgrade1) {
				twolinemode = false;
				nameText = "Locked";
				priceText = "";
				if (!used && !mouseEntered) {
					image_index = 1;
				}
			} else {
				twolinemode = true;
				nameText = "CuPy Drone\nLaser";
				priceText = "4300$";
				if (!used && !mouseEntered) {
					image_index = frame;
				}
			}
		} else {
			twolinemode = true;
				nameText = "CuPy Drone\nLaser";
				priceText = "Purchased";
				price = 9999999999999;
				if (!used && !mouseEntered) {
					image_index = frame;
				}
		}
	break;
	case 8:
		if (!global.silencedMPUpgrade1) {
			nameText = "Flame AP\nBullets";
			priceText = "4250$";
			price = 4250;
			twolinemode = true;
		} else {
			nameText = "Flame AP\nBullets";
			priceText = "Purchased";
			price = 9999999999999999;
			twolinemode = true;
		}
	break;
	case 9:
		price = 6250;
		
		if (!global.silencedMPUpgrade2) {
			if (!global.silencedMPUpgrade1) {
				twolinemode = false;
				nameText = "Locked";
				priceText = "";
				if (!used && !mouseEntered) {
					image_index = 1;
				}
			} else {
				twolinemode = true;
				nameText = "Flame\nDispenser";
				priceText = "6250$";
				if (!used && !mouseEntered) {
					image_index = frame;
				}
			}
		} else {
			twolinemode = true;
			nameText = "Flame\nDispenser";
			priceText = "Purchased";
			price = 999999999999;
			if (!used && !mouseEntered) {
				image_index = frame;
			}
		}
	break;
	case 10:
		if (!global.sniperUpgrade1) {
			nameText = "Split\nBullets";
			priceText = "5250$";
			price = 5250;
			twolinemode = true;
		} else {
			nameText = "Split\nBullets";
			priceText = "Purchased";
			price = 9999999999999999;
			twolinemode = true;
		}
	break;
	case 11:
		price = 6875;
		
		if (!global.sniperUpgrade2) {
			if (!global.sniperUpgrade1) {
				twolinemode = false;
				nameText = "Locked";
				priceText = "";
				if (!used && !mouseEntered) {
					image_index = 1;
				}
			} else {
				twolinemode = true;
				nameText = "Healing\nAura";
				priceText = "6875$";
				if (!used && !mouseEntered) {
					image_index = frame;
				}
			}
		} else {
			twolinemode = true;
			nameText = "Healing\nAura";
			priceText = "Purchased";
			price = 999999999999;
			if (!used && !mouseEntered) {
				image_index = frame;
			}
		}
	break;
}

draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(c_black);
if (!twolinemode) {
	draw_text_ext(x - 1, y - 31 + 1, nameText, 12, 99999);

	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text_ext(x, y - 31, nameText, 12, 99999);
} else {
	draw_text_ext(x - 1, y - 43 + 1, nameText, 12, 99999);

	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text_ext(x, y - 43, nameText, 12, 99999);
}

draw_set_color(c_black);
draw_text_ext(x - 1, y + 22 + 1, priceText, 12, 99999);

if (global.money >= price)
{
	draw_set_color(make_color_rgb(255, 215, 0));
}
else
{
	draw_set_color(c_red);
}
draw_text_ext(x, y + 22, priceText, 12, 99999);

if (used) {
	image_index = 0;
}