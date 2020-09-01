if (!blackJackCalc_obj.finished)
{
	if (global.money > 999)
	{
		blackJackCalc_obj.moneypool += 1000;
		global.money -= 1000;
		cameraBlackjack_obj.scoreSpin = true;
		cameraBlackjack_obj.scoreSpinTimer = cameraBlackjack_obj.scoreSpinTimerSave;
	}
}
