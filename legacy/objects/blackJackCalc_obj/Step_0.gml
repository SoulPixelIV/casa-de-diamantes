//Player draws card
if (drawCard)
{
	var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == -2)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	switch (chosenDeck) {
	    case heartDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "H";
	        break;
		case diamondDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "D";
	        break;
		case clubDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "C";
	        break;
		case spadeDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "S";
	        break;
	}
	playerInstances[playerSlot].image_index = blackjackSpriteConverter_scr(playerDeck[playerSlot]);
	playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	chosenDeck[chosenCard] = -2;
	
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
		while (chosenDeck[chosenCard] == -2)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		switch (chosenDeck) {
		    case heartDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "H";
		        break;
			case diamondDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "D";
		        break;
			case clubDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "C";
		        break;
			case spadeDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "S";
		        break;
		}
		dealerInstances[dealerSlot].image_index = blackjackSpriteConverter_scr(dealerDeck[dealerSlot]);
		dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		chosenDeck[chosenCard] = -2;
		dealerSlot++;
	}
	dealerDraws = false;
	checkScore = true;
}

//Check Score
/*
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
		while (chosenDeck[chosenCard] == -1)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		switch (chosenDeck) {
		    case heartDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "H";
		        break;
			case diamondDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "D";
		        break;
			case clubDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "C";
		        break;
			case spadeDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "S";
		        break;
		}
		dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		chosenDeck[chosenCard] = -1;
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
*/
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







