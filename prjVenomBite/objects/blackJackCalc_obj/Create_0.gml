dealerPhase = 2;
playerPhase = 2;
dealerVisible = false;

playerSum = 0;
dealerSum = 0;

playerDeck[0] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
playerDeck[1] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
playerDeck[2] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
playerDeck[3] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
playerDeck[4] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");

dealerDeck[0] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
dealerDeck[1] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
dealerDeck[2] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
dealerDeck[3] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
dealerDeck[4] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");

for (i = 0; i < playerPhase; i++)
{
	if (playerDeck[i] == "J" || playerDeck[i] == "Q" || playerDeck[i] == "K")
	{
		playerSum += 10;
	}
	else if (playerDeck[i] == "A" && playerSum > 9)
	{
		playerSum = 21;
	}
	else if (playerDeck[i] == "A" && playerSum <= 9)
	{
		playerSum += 11;
	}
	else
	{
		playerSum += playerDeck[i];
	}
}
for (i = 0; i < dealerPhase; i++)
{
	if (dealerDeck[i] == "J" || dealerDeck[i] == "Q" || dealerDeck[i] == "K")
	{
		dealerSum += 10;
	}
	else if (dealerDeck[i] == "A" && dealerSum > 9)
	{
		dealerSum = 21;
	}
	else if (dealerDeck[i] == "A" && dealerSum <= 9)
	{
		dealerSum += 11;
	}
	else
	{
		dealerSum += dealerDeck[i];
	}
}

