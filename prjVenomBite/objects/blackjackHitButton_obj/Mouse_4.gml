blackJackCalc_obj.playerPhase++;
playerSum = 0;
dealerSum = 0;

for (i = 0; i < blackJackCalc_obj.playerPhase; i++)
{
	if (blackJackCalc_obj.playerDeck[i] == "J" || blackJackCalc_obj.playerDeck[i] == "Q" || blackJackCalc_obj.playerDeck[i] == "K")
	{
		blackJackCalc_obj.playerSum += 10;
	}
	else if (blackJackCalc_obj.playerDeck[i] == "A" && blackJackCalc_obj.playerSum > 9)
	{
		blackJackCalc_obj.playerSum = 21;
	}
	else if (blackJackCalc_obj.playerDeck[i] == "A" && blackJackCalc_obj.playerSum <= 9)
	{
		blackJackCalc_obj.playerSum += 11;
	}
	else
	{
		blackJackCalc_obj.playerSum += blackJackCalc_obj.playerDeck[i];
	}
}
for (i = 0; i < blackJackCalc_obj.dealerPhase; i++)
{
	if (blackJackCalc_obj.dealerDeck[i] == "J" || blackJackCalc_obj.dealerDeck[i] == "Q" || blackJackCalc_obj.dealerDeck[i] == "K")
	{
		blackJackCalc_obj.dealerSum += 10;
	}
	else if (blackJackCalc_obj.dealerDeck[i] == "A" && blackJackCalc_obj.dealerSum > 9)
	{
		blackJackCalc_obj.dealerSum = 21;
	}
	else if (blackJackCalc_obj.dealerDeck[i] == "A" && blackJackCalc_obj.dealerSum <= 9)
	{
		blackJackCalc_obj.dealerSum += 11;
	}
	else
	{
		blackJackCalc_obj.dealerSum += blackJackCalc_obj.dealerDeck[i];
	}
}

