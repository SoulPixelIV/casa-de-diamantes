//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 469, edgeMarginVer, 1, 1, 0, -1, 1);

if (blackJackCalc_obj.screen == 0)
{
	draw_set_font(gothicPixelBig_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 88 + 1, "Blackjack");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 88, "Blackjack");
	draw_set_font(gothicPixel_fnt);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 124 + 1, "- Press Start to Play -");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 124, "- Press Start to Play -");
}

draw_set_halign(fa_left);
if (inputMethod == 0) {
	draw_text(24, 250, "Press Escape to stop playing");
} else {
	draw_text(24, 250, "Press Select to stop playing");
}
	
//Chipbar Digit Calculation
convMoney = string(global.money);
slots = [0,0,0,0,0,0,0];
	
convMoneyLen = string_length(convMoney); //3000 = 4
var normIndex = 1;
	
//Fill all digits with Zeros first
for (i = 0; i < 7; i++) {
	slots[i] = 0;
}
	
//Fill last digits with money count
for (i = array_length(slots) - convMoneyLen; i < 7; i++) {
	slots[i] = int64(string_char_at(convMoney, normIndex));
	normIndex ++; //Index starting at 0 for convMoney reading
}

if (scoreSpin)
{
	scoreSpinTimer -= global.dt;
	draw_sprite(scoreNumberSpin_spr, -1, 457, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 447, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 437, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 427, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 417, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 407, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 397, edgeMarginVer + 2);
}
else
{
	draw_sprite(scoreNumber_spr, slots[6], 457, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[5], 447, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[4], 437, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[3], 427, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[2], 417, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[1], 407, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, slots[0], 397, edgeMarginVer + 2);
}
	
if (scoreSpinTimer < 0)
{
	scoreSpinTimer = scoreSpinTimerSave;
	scoreSpin = false;
}

//Blackjack System

//Draw Card Sum TEMPORARY
if (blackJackCalc_obj.screen == 1 || blackJackCalc_obj.screen == 2)
{
	//Player Card Sum
	draw_set_halign(fa_right);
	draw_text(global.xScreenSize - 16, 250, "Score: " + string(blackJackCalc_obj.playerSum) + " | Small Score: " + string(blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)));
	draw_set_halign(fa_left);
}

//Draw Pot
draw_set_halign(fa_center);
//draw_text(global.xScreenSize / 2, 250, "POT: " + string(blackJackCalc_obj.moneypool));
draw_set_halign(fa_left);

//DRAW WIN OR LOOSE STATE
draw_set_halign(fa_center);
if (blackJackCalc_obj.screen == 2)
{
	if (blackJackCalc_obj.playerSum > 21 + (10 * blackJackCalc_obj.numberofAces))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "LOOSE - CREDITS LOST");
	}
	else if (blackJackCalc_obj.dealerSum > 21 + (10 * blackJackCalc_obj.numberofAcesDealer))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "WIN - DOUBLE CREDITS");
	}
	else if (blackJackCalc_obj.playerSum == 21)
	{	
		//DRAW
		if (blackJackCalc_obj.dealerSum == 21)
		{
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "DRAW - CREDITS BACK");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "DRAW - CREDITS BACK");
		}
		//WIN BLACKJACK
		else
		{
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "BLACKJACK - TRIPPLE CREDITS");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "BLACKJACK - TRIPPLE CREDITS");
		}
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) > (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "WIN - DOUBLE CREDITS");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) == (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//DRAW
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "DRAW - CREDITS BACK");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "DRAW - CREDITS BACK");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) < (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "LOOSE - CREDITS LOST");
	}
}
draw_set_halign(fa_left);

if (!noHUD)
{
	draw_sprite(guiBorder_spr, 0, 0, 0);
}

//Cursor
if (inputMethod == 0) {
	draw_sprite(mousecursor_spr, 0, mouse_x, mouse_y);
} else {
	cursorImage += global.dt / 16;
	
	if (blackJackCalc_obj.screen == 0) {
		if (blackjackMenuElement == 0) {
			draw_sprite(chipRed_spr, cursorImage, 142, 124);
		} else if (blackjackMenuElement == 1) {
			draw_sprite(chipRed_spr, cursorImage, 298, 124);
		} else if (blackjackMenuElement == 2) {
			draw_sprite(chipRed_spr, cursorImage, 206, 202);
		}

		if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
			if (blackjackMenuElement == 0) {
				blackjackMenuElement = 1;
			} else {
				blackjackMenuElement = 0;
			}
		}
	
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			if (blackjackMenuElement == 1) {
				blackjackMenuElement = 0;
			} else {
				blackjackMenuElement = 1;
			}
		}
	
		if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu)) {
			if (blackjackMenuElement == 0 || blackjackMenuElement == 1) {
				blackjackMenuElement = 2;
			} else {
				blackjackMenuElement = 0;
			}
		}
	
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (blackjackMenuElement == 0) {
				if (global.money > 49)
				{
					blackJackCalc_obj.moneypool += 50;
					global.money -= 50;
					scoreSpin = true;
					scoreSpinTimer = scoreSpinTimerSave;
				}
			} else if (blackjackMenuElement == 1) {
				if (global.money > 499)
				{
					blackJackCalc_obj.moneypool += 500;
					global.money -= 500;
					cameraBlackjack_obj.scoreSpin = true;
					cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
				}
			} else if (blackjackMenuElement == 2) {
				if (blackJackCalc_obj.moneypool != 0)
				{
					blackJackCalc_obj.screen = 1;
				}
			}
		}
	} else if (blackJackCalc_obj.screen == 1) {
		if (blackjackMenuElement == 0) {
			draw_sprite(chipRed_spr, cursorImage, 73, 93);
		} else if (blackjackMenuElement == 1) {
			draw_sprite(chipRed_spr, cursorImage, 61, 189);
		}

		if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
			if (blackjackMenuElement == 0) {
				blackjackMenuElement = 1;
			} else {
				blackjackMenuElement = 0;
			}
		}
	
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			if (blackjackMenuElement == 1) {
				blackjackMenuElement = 0;
			} else {
				blackjackMenuElement = 1;
			}
		}
	
		if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu)) {
			if (blackjackMenuElement == 1) {
				blackjackMenuElement = 0;
			} else {
				blackjackMenuElement = 1;
			}
		}
	
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (blackjackMenuElement == 0) {
				blackJackCalc_obj.drawCard = true;
			} else if (blackjackMenuElement == 1) {
				blackJackCalc_obj.dealerDraws = true;
			}
		}
	} else if (blackJackCalc_obj.screen == 2) {
		blackjackMenuElement = 0;
		if (blackjackMenuElement == 0) {
			draw_sprite(chipRed_spr, cursorImage, 195, 202);
		}
	
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (blackjackMenuElement == 0) {
				room_restart();
			}
		}
	}
}

//#####LAYER 4#####
draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(0, 0, global.xScreenSize, global.yScreenSize, false);
draw_set_alpha(1);