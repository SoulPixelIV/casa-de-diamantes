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
	playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	chosenDeck[chosenCard] = 0;
	
	playerSlot++;
	drawCard = false;
}

//Dealer draws card
if (dealerDraws)
{
	while (dealerSum < 17)
	{
		var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		while (chosenDeck[chosenCard] == 0)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		dealerDeck[dealerSlot] = chosenDeck[chosenCard];
		dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		chosenDeck[chosenCard] = 0;
		dealerSlot++;
	}
	dealerDraws = false;
	checkScore = true;
}

//Check Score
if (playerSum == 21)
{
	if (dealerSum < 10)
	{
		//WIN
	}
	else
	{
		var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		while (chosenDeck[chosenCard] == 0)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		dealerDeck[dealerSlot] = chosenDeck[chosenCard];
		dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		chosenDeck[chosenCard] = 0;
		dealerSlot++;
		drawLastCard = false;
		
		if (dealerSum == 21)
		{
			//DRAW
		}
		else
		{
			//WIN
		}
	}
}

if (checkScore)
{
	if (playerSum > dealerSum)
	{
		//WIN
	}
	if (playerSum < dealerSum)
	{
		//LOOSE
	}
	if (playerSum == dealerSum)
	{
		//DRAW
	}
}







