screen = 0;
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

drawCard = false;
playerSlot = 2;
dealerSlot = 1;
dealerDraws = false;
checkScore = false;

holdingCard = false;

finished = false;

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
	chosenDeck[chosenCard] = -2;
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
chosenDeck[chosenCard] = -2;


//Create Cards
for (i = 0; i < 7; i++)
{
	playerInstances[i] = instance_create_layer(204 + i * 32, 248, "Instances", playingCards_obj);
	playerInstances[i].image_index = blackjackSpriteConverter_scr(playerDeck[i]);
}
for (i = 0; i < 7; i++)
{
	dealerInstances[i] = instance_create_layer(204 + i * 32, 48, "Instances", playingCards_obj);
	dealerInstances[i].image_index = blackjackSpriteConverter_scr(dealerDeck[i]);
}

