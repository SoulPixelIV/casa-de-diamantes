//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 375, edgeMarginVer, 1, 1, 0, -1, 1);
	
convMoney = string(global.money);
slots = [0,0,0,0,0,0,0];
for (i = 0; i < 6; i++)
{
	if (string_char_at(convMoney, i+1) == "")
	{
		slots[i] = 0;
	}
	else
	{
		slots[i] = int64(string_char_at(convMoney, i+1));
	}
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
draw_text(250, 250, "POT: " + string(blackJackCalc_obj.moneypool));

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
