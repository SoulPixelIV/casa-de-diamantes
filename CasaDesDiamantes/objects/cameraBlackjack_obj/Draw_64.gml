//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 469, edgeMarginVer, 1, 1, 0, -1, 1);

pressDelay -= global.dt;

//START MENU
if (blackJackCalc_obj.screen == 0)
{
	draw_set_font(gothicPixelBig_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 58 + 1, "Blackjack");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 58, "Blackjack");
	draw_set_font(gothicPixel_fnt);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 124 + 1, "- Press Start to Play -");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 124, "- Press Start to Play -");
	
	//Continue to Main Menu
	if (pressDelay < 0) {
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1) || mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(4, gp_start)) {
			pressDelay = pressDelaySave;
			blackJackCalc_obj.screen = 1;
		}
	}
}
draw_set_halign(fa_left);

//MAIN MENU
if (blackJackCalc_obj.screen == 1) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 58 + 1, "Blackjack");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 58, "Blackjack");
	draw_set_font(gothicPixel_fnt);
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 124 + 1, "Play");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 124, "Play");
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 148 + 1, "How to Play");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 148, "How to Play");
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 172 + 1, "Quit");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 172, "Quit");
	
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
	{
		if (cursorPos > 0)
		{
			cursorPos--;
		}
		else
		{
			cursorPos = 2;
		}
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
	{
		if (cursorPos < 2)
		{
			cursorPos++;
		}
		else
		{
			cursorPos = 0;
		}
	}
	if (pressDelay < 0) {
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			switch (cursorPos)
			{
				case 0:
					blackJackCalc_obj.screen = 2;
					cursorPos = 0;
					pressDelay = pressDelaySave;
				break;
				case 1:
					blackJackCalc_obj.screen = 5;
					cursorPos = 0;
					pressDelay = pressDelaySave;
				break;
				case 2:
					global.spawn = 1;
					room_goto(level_Casino);
					cursorPos = 0;
					pressDelay = pressDelaySave;
				break;
			}
		}
	}
	
	cursorAnim += global.dtNoSlowmo / 17;
	switch (cursorPos)
	{
		case 0:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 32, 128);
		break;
		case 1:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 48, 152);
		break;
		case 2:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 32, 176);
		break;
	}
}

//BET MENU
if (blackJackCalc_obj.screen == 2) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 58 + 1, "Blackjack");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 58, "Blackjack");
	
	draw_set_font(gothicPixel_fnt);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 84 + 1, "- Place your Bet -");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 84, "- Place your Bet -");
	
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
	{
		if (cursorPos > 0)
		{
			cursorPos--;
		}
		else
		{
			cursorPos = 2;
		}
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
	{
		if (cursorPos < 2)
		{
			cursorPos++;
		}
		else
		{
			cursorPos = 0;
		}
	}
	if (pressDelay < 0) {
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
		{
			switch (cursorPos)
			{
				case 0:
					if (global.money > 49) {
						blackJackCalc_obj.moneypool += 50;
						global.money -= 50;
						cameraBlackjack_obj.scoreSpin = true;
						cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
						blackjackChipHolderSpawner_obj.spawning50 = true;
					}
					pressDelay = pressDelaySave;
				break;
				case 1:
					if (global.money > 499) {
						blackJackCalc_obj.moneypool += 500;
						global.money -= 500;
						cameraBlackjack_obj.scoreSpin = true;
						cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
						blackjackChipHolderSpawner_obj.spawning500 = true;
					}
					pressDelay = pressDelaySave;
				break;
				case 2:
					if (blackJackCalc_obj.moneypool != 0) {
						blackJackCalc_obj.screen = 3;
						cursorPos = 0;
					}
					pressDelay = pressDelaySave;
				break;
			}
		}
	}
	
	cursorAnim += global.dtNoSlowmo / 17;
	switch (cursorPos)
	{
		case 0:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 92, 122);
		break;
		case 1:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 92, 160);
		break;
		case 2:
			draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 92, 198);
		break;
	}
}

//HELP MENU
if (blackJackCalc_obj.screen == 5)
{
	draw_set_font(gothicPixelBig_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 58 + 1, "Blackjack");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 58, "Blackjack");
	draw_set_font(gothicPixel_fnt);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 84 + 1, "- How to Play -");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 84, "- How to Play -");
	
	draw_set_font(gothicPixel_fnt);
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 104 + 1, "-Beat the Dealer by having a higher hand value");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 104, "-Beat the Dealer by having a higher hand value");
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 124 + 1, "-The score shows your hand value");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 124, "-The score shows your hand value");
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 144 + 1, "-Do not draw over a value of 21");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 144, "-Do not draw over a value of 21");
	
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, 164 + 1, "-J,Q,K count as 10|A counts as either 1 or 11");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 164, "-J,Q,K count as 10|A counts as either 1 or 11");
	
	//Continue to Main Menu
	if (pressDelay < 0) {
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1) || mouse_check_button_pressed(mb_left)) {
			pressDelay = pressDelaySave;
			blackJackCalc_obj.screen = 1;
		}
	}
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
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 21, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 31, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 41, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 51, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 61, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 71, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 81, 12 + (0 / 2));
	}
	else
	{
		draw_sprite(scoreNumber_spr, slots[6], global.xScreenSize - 21, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[5], global.xScreenSize - 31, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[4], global.xScreenSize - 41, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[3], global.xScreenSize - 51, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[2], global.xScreenSize - 61, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[1], global.xScreenSize - 71, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[0], global.xScreenSize - 81, 12 + (0 / 2));
	}
	
if (scoreSpinTimer < 0)
{
	scoreSpinTimer = scoreSpinTimerSave;
	scoreSpin = false;
}

//Blackjack System

//Draw Card Sum
if (blackJackCalc_obj.screen == 3)
{
	//Player Card Sum
	if (blackJackCalc_obj.numberofAces > 0) {
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(272 - 1, 180 + 1,  "Score: " + string(blackJackCalc_obj.playerSum) + "(" + string(blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) + ")");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(272, 180, "Score: " + string(blackJackCalc_obj.playerSum) + "(" + string(blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) + ")");
		draw_set_halign(fa_left);
	} else {
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(272 - 1, 180 + 1,  "Score: " + string(blackJackCalc_obj.playerSum));
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(272, 180, "Score: " + string(blackJackCalc_obj.playerSum));
		draw_set_halign(fa_left);
	}
	
	//Dealer Card Sum
	if (blackJackCalc_obj.numberofAcesDealer > 0) {
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(272 - 1, 78 + 1,  "Score: " + string(blackJackCalc_obj.dealerSum) + "(" + string(blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)) + ")");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(272, 78, "Score: " + string(blackJackCalc_obj.dealerSum) + "(" + string(blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)) + ")");
		draw_set_halign(fa_left);
	} else {
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		draw_text(272 - 1, 78 + 1,  "Score: " + string(blackJackCalc_obj.dealerSum));
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(272, 78, "Score: " + string(blackJackCalc_obj.dealerSum));
		draw_set_halign(fa_left);
	}
}

//Draw Pot
if (blackJackCalc_obj.screen == 2) {
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2) + 27 - 1, 198 + 1, string(blackJackCalc_obj.moneypool) + "$");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text((global.xScreenSize / 2) + 27, 198, string(blackJackCalc_obj.moneypool) + "$");
	draw_set_halign(fa_left);
}

//DRAW WIN OR LOOSE STATE
draw_set_halign(fa_center);
if (blackJackCalc_obj.screen == 4)
{
	if (inputMethod == 1) {
		draw_sprite(chipRed_spr, cursorImage, 188, 176);
		
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			gameManager_obj.blackjackBackToMenu = true;
			room_restart();
		}
	}
	
	if (blackJackCalc_obj.playerSum > 21 + (10 * blackJackCalc_obj.numberofAces))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(c_red);
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "LOOSE - CREDITS LOST");
		
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Lost " + string(blackJackCalc_obj.moneypool) + "$");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Lost " + string(blackJackCalc_obj.moneypool) + "$");
	}
	else if (blackJackCalc_obj.dealerSum > 21 + (10 * blackJackCalc_obj.numberofAcesDealer))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(c_green);
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "WIN - DOUBLE CREDITS");
		
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Won " + string(blackJackCalc_obj.moneypool) + "$");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Won " + string(blackJackCalc_obj.moneypool) + "$");
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
			
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Won 0$");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Won 0$");
		}
		//WIN BLACKJACK
		else
		{
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "BLACKJACK - TRIPPLE CREDITS");
			draw_text_color(global.xScreenSize / 2, global.yScreenSize / 3, "BLACKJACK - TRIPPLE CREDITS", c_red, c_green, c_blue, c_yellow, 1);
			
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Won " + string(blackJackCalc_obj.moneypool * 2) + "$");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Won " + string(blackJackCalc_obj.moneypool * 2) + "$");
		}
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) > (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(c_green);
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "WIN - DOUBLE CREDITS");
		
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Won " + string(blackJackCalc_obj.moneypool) + "$");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Won " + string(blackJackCalc_obj.moneypool) + "$");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) == (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//DRAW
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "DRAW - CREDITS BACK");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "DRAW - CREDITS BACK");
			
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Won 0$");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Won 0$");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) < (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(c_red);
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "LOOSE - CREDITS LOST");
		
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 3 + 32 + 1, "Lost " + string(blackJackCalc_obj.moneypool) + "$");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 32, "Lost " + string(blackJackCalc_obj.moneypool) + "$");
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
	
	if (blackJackCalc_obj.screen == 3) {
		if (blackjackMenuElement == 0) {
			draw_sprite(chipRed_spr, cursorImage, 122, 223);
		} else if (blackjackMenuElement == 1) {
			draw_sprite(chipRed_spr, cursorImage, 254, 223);
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
	
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (pressDelay < 0) {
				if (blackjackMenuElement == 0) {
					blackJackCalc_obj.drawCard = true;
					pressDelay = pressDelaySave;
				} else if (blackjackMenuElement == 1) {
					blackJackCalc_obj.dealerDraws = true;
					pressDelay = pressDelaySave;
				}
			}
		}
	}
}

//#####LAYER 4#####
draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(0, 0, global.xScreenSize, global.yScreenSize, false);
draw_set_alpha(1);