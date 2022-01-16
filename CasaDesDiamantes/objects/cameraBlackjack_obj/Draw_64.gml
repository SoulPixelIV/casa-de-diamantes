//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 469, edgeMarginVer, 1, 1, 0, -1, 1);

if (blackJackCalc_obj.screen == 0)
{
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, 38, "Blackjack");
	draw_text(global.xScreenSize / 2, 54, "Please place your bet!");
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
	draw_text(xScreenSize - 100, yScreenSize - 30, "Score: " + string(blackJackCalc_obj.playerSum) + " | Small Score: " + string(blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)));
}

//Draw Pot
draw_text(global.xScreenSize / 2, 250, "POT: " + string(blackJackCalc_obj.moneypool));

//DRAW WIN OR LOOSE STATE
if (blackJackCalc_obj.screen == 2)
{
	if (blackJackCalc_obj.playerSum > 21 + (10 * blackJackCalc_obj.numberofAces))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, yScreenSize / 3, "LOOSE - CREDITS LOST");
	}
	else if (blackJackCalc_obj.dealerSum > 21 + (10 * blackJackCalc_obj.numberofAcesDealer))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, yScreenSize / 3, "WIN - DOUBLE CREDITS");
	}
	else if (blackJackCalc_obj.playerSum == 21)
	{	
		//DRAW
		if (blackJackCalc_obj.dealerSum == 21)
		{
			draw_set_color(c_black);
			draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "DRAW - CREDITS BACK");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(xScreenSize / 2, yScreenSize / 3, "DRAW - CREDITS BACK");
		}
		//WIN BLACKJACK
		else
		{
			draw_set_color(c_black);
			draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "BLACKJACK - TRIPPLE CREDITS");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(xScreenSize / 2, yScreenSize / 3, "BLACKJACK - TRIPPLE CREDITS");
		}
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) > (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//WIN NORMAL
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "WIN - DOUBLE CREDITS");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, yScreenSize / 3, "WIN - DOUBLE CREDITS");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) == (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//DRAW
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "DRAW - CREDITS BACK");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, yScreenSize / 3, "DRAW - CREDITS BACK");
	}
	else if ((blackJackCalc_obj.playerSum - (10 * blackJackCalc_obj.numberofAces)) < (blackJackCalc_obj.dealerSum - (10 * blackJackCalc_obj.numberofAcesDealer)))
	{
		//LOOSE
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, yScreenSize / 3 + 1, "LOOSE - CREDITS LOST");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, yScreenSize / 3, "LOOSE - CREDITS LOST");
	}
}

if (!noHUD)
{
	draw_sprite(guiBorder_spr, 0, 0, 0);
}

draw_sprite(mousecursor_spr, 0, mouse_x, mouse_y);