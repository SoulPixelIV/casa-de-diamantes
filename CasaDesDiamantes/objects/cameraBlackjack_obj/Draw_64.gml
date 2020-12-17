//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 375, edgeMarginVer, 1, 1, 0, -1, 1);
	
if (scoreSpin)
{
	scoreSpinTimer -= global.dt;
	draw_sprite(scoreNumberSpin_spr, -1, 452, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 442, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 432, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 422, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 412, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 402, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 392, edgeMarginVer + 2);
}
else
{
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[0], 452, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[1], 442, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[2], 432, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[3], 422, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[4], 412, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[5], 402, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[6], 392, edgeMarginVer + 2);
}
	
if (scoreSpinTimer < 0)
{
	scoreSpinTimer = scoreSpinTimerSave;
	scoreSpin = false;
}

//Blackjack System

//Draw Card Sum TEMPORARY
if (blackJackCalc_obj.screen == 1)
{
	//Player Card Sum
	draw_text(44, 80, blackJackCalc_obj.playerSum);

	//Dealer Card Sum
	draw_text(44, 20, blackJackCalc_obj.dealerSum);
}

//Draw Pot
draw_text(250, 250, "POT: " + string(blackJackCalc_obj.moneypool));

//DRAW WIN OR LOOSE STATE
if (blackJackCalc_obj.screen == 2)
{
	if (blackJackCalc_obj.checkScore)
	{
		if ((blackJackCalc_obj.playerSum > 21 || blackJackCalc_obj.playerSum < blackJackCalc_obj.dealerSum) && blackJackCalc_obj.dealerSum < 22)
		{
			//LOOSE
			draw_text(150, 150, "YOU LOOSE!");
			//blackJackCalc_obj.moneypool = 0;
			//blackJackCalc_obj.screen = 0;
		}
		else if (blackJackCalc_obj.dealerSum > 21 || blackJackCalc_obj.playerSum > blackJackCalc_obj.dealerSum)
		{
			//WIN
			draw_text(150, 150, "YOU WIN!");
			if (!blackJackCalc_obj.finished)
			{
				global.money += blackJackCalc_obj.moneypool * 2;
				//blackJackCalc_obj.moneypool = 0;
				//blackJackCalc_obj.screen = 0;
			}	
		}
		else if (blackJackCalc_obj.playerSum == blackJackCalc_obj.dealerSum)
		{
			//DRAW
			draw_text(150, 150, "DRAW!");
			if (!blackJackCalc_obj.finished)
			{
				global.money += blackJackCalc_obj.moneypool;
				//blackJackCalc_obj.moneypool = 0;
				//blackJackCalc_obj.screen = 0;
			}
		}
	}
}
