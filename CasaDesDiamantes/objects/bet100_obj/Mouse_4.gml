if (!blackJackCalc_obj.finished)
{
	if (global.money > 99)
	{
		blackJackCalc_obj.moneypool += 100;
		global.money -= 100;
		cameraBlackjack_obj.scoreSpin = true;
		cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
	}
}

