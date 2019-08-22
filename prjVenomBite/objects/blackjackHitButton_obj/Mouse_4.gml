if (blackJackCalc_obj.playerSum < 21)
{
	blackJackCalc_obj.playerPhase++;
	playerSum = 0;
	dealerSum = 0;

	for (i = 0; i < blackJackCalc_obj.playerPhase; i++)
	{
		blackJackCalc_obj.playerSum += blackJackCalc_obj.playerDeck[i];
	}
	for (i = 0; i < blackJackCalc_obj.dealerPhase; i++)
	{
		blackJackCalc_obj.dealerSum += blackJackCalc_obj.dealerDeck[i];
	}
}
