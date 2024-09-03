if (drawn) {
	audio_play_sound(typewriterPush_snd, 1, false);
}

if (global.pushDelay < 0) {
	if (blackJackCalc_obj.screen == 2)
	{
		if (bet50)
		{
			if (global.money > 49)
			{
				blackJackCalc_obj.moneypool += 50;
				global.money -= 50;
				cameraBlackjack_obj.scoreSpin = true;
				cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
				blackjackChipHolderSpawner_obj.spawning50 = true;
			}
		}
		else if (bet500)
		{
			if (global.money > 499)
			{
				blackJackCalc_obj.moneypool += 500;
				global.money -= 500;
				cameraBlackjack_obj.scoreSpin = true;
				cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
				blackjackChipHolderSpawner_obj.spawning500 = true;
			}
		}
		else if (bet10000)
		{
			if (global.money > 9999)
			{
				blackJackCalc_obj.moneypool += 10000;
				global.money -= 10000;
				cameraBlackjack_obj.scoreSpin = true;
				cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
			}
		}
		else if (start && blackJackCalc_obj.moneypool != 0)
		{
			blackJackCalc_obj.screen = 3;
		}
	}

	if (blackJackCalc_obj.screen == 3)
	{
		if (hit)
		{
			blackJackCalc_obj.drawCard = true;
		}
		else if (stand)
		{
			blackJackCalc_obj.dealerDraws = true;
		}
	}

	if (blackJackCalc_obj.screen == 4)
	{
		if (back)
		{
			gameManager_obj.blackjackBackToMenu = true;
			room_restart();
		}
	}
	global.pushDelay = global.pushDelaySave;
}


