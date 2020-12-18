screen = 0;
spawnedCards = false;
yBorderSize = 96;
xBorderSize = 32;
moneypool = 0;
playerDeck = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dealerDeck = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
playerInstances = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dealerInstances = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];

heartDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
diamondDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
clubDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
spadeDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];

cardTargetX = 204;
cardTargetY = 220;
cardTargetDealerY = 78;

drawCard = false;
playerSlot = 2;
dealerSlot = 1;
dealerDraws = false;
transactionComplete = false;
numberofAces = 0;
numberofAcesDealer = 0;

holdingCard = false;

playerSum = 0;
dealerSum = 0;

//First Round -> Player gets 2 Cards
for (i = 0; i < 2; i++)
{
	var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == -2)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	switch (chosenDeck) {
		case heartDeck:
		    playerDeck[i] = string(chosenDeck[chosenCard]) + "H";
		    break;
		case diamondDeck:
		    playerDeck[i] = string(chosenDeck[chosenCard]) + "D";
		    break;
		case clubDeck:
		    playerDeck[i] = string(chosenDeck[chosenCard]) + "C";
		    break;
		case spadeDeck:
		    playerDeck[i] = string(chosenDeck[chosenCard]) + "S";
		    break;
	}
	playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	
	//Check if card is ace
	if (blackjackConverter_scr(chosenDeck[chosenCard]) == 11)
	{
		numberofAces++;
	}
	
	chosenDeck[chosenCard] = -2;
}

//Check if already Blackjack
if (playerSum == 21 - (10 * numberofAces))
{
	screen = 2;
}

//First Round -> Dealer gets 1 Card
var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
while (chosenDeck[chosenCard] == -2)
{
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
}

switch (chosenDeck) {
	case heartDeck:
		dealerDeck[0] = string(chosenDeck[chosenCard]) + "H";
		break;
	case diamondDeck:
		dealerDeck[0] = string(chosenDeck[chosenCard]) + "D";
		break;
	case clubDeck:
		dealerDeck[0] = string(chosenDeck[chosenCard]) + "C";
		break;
	case spadeDeck:
		dealerDeck[0] = string(chosenDeck[chosenCard]) + "S";
		break;
}
dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);

//Check if card is ace
if (blackjackConverter_scr(chosenDeck[chosenCard]) == 11)
{
	numberofAcesDealer++;
}
	
chosenDeck[chosenCard] = -2;