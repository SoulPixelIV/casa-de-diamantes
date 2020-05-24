//Player draws card
if (drawCard)
{
	var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == 0)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	playerDeck[playerSlot] = chosenDeck[chosenCard];
	chosenDeck[chosenCard] = 0;
	
	playerSlot++;
	drawCard = false;
}

//Dealer draws card
if (dealerDraws)
{
	for (i = 0; i < 2; i++)
	{
		var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		while (chosenDeck[chosenCard] == 0)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		dealerDeck[i] = chosenDeck[chosenCard];
		chosenDeck[chosenCard] = 0;
	}
}

