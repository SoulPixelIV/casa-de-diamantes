draw_self();

switch (frame) {
	case 1:
		nameText = "Locked";
		priceText = "";
	break;
	case 2:
		nameText = "Ice HP\nBullets";
		priceText = "1350$";
		price = 1350;
		twolinemode = true;
	break;
	case 3:
		price = 1920;
		
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
			priceText = "1920$";
			if (!used && !mouseEntered) {
				image_index = frame;
			}
		}
	break;
	case 4:
		nameText = "Ricochet H\nBullets";
		priceText = "1850$";
		price = 1850;
		twolinemode = true;
	break;
	case 5:
		price = 2430;
		twolinemode = true;
		
		if (!global.shotgunUpgrade1) {
			twolinemode = false;
			nameText = "Locked";
			priceText = "";
			if (!used && !mouseEntered) {
				image_index = 1;
			}
		} else {
			twolinemode = true;
			nameText = "Ricochet\nDamage";
			priceText = "2430$";
			if (!used && !mouseEntered) {
				image_index = frame;
			}
		}
	break;
	case 6:
		nameText = "CuPy Drone";
		priceText = "0$";
		price = 0;
	break;
	case 7:
		price = 3450;
		twolinemode = true;
		
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
			priceText = "3450$";
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