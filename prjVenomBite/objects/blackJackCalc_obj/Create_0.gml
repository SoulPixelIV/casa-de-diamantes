playerDeck = [0,0,0,0,0,0,0,0,0,0];
dealerDeck = [0,0,0,0,0,0,0,0,0,0];

heartDeck = [2,3,4,5,6,7,8,9,10,"B","Q","K","A"];
diamondDeck = [2,3,4,5,6,7,8,9,10,"B","Q","K","A"];
clubDeck = [2,3,4,5,6,7,8,9,10,"B","Q","K","A"];
spadeDeck = [2,3,4,5,6,7,8,9,10,"B","Q","K","A"];

drawCard = false;
playerSlot = 2;
dealerDraws = false;

playerSum = 0;
dealerSum = 0;

//First Round -> Player gets 2 Cards
for (i = 0; i < 2; i++)
{
	var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == 0)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	playerDeck[i] = chosenDeck[chosenCard];
	chosenDeck[chosenCard] = 0;
}

