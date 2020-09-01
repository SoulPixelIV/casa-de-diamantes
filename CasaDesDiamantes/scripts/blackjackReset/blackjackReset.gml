// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blackjackReset(){
	
	blackJackCalc_obj.finished = false;
	
	blackJackCalc_obj.playerDeck = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
	blackJackCalc_obj.dealerDeck = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
	blackJackCalc_obj.playerInstances = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
	blackJackCalc_obj.dealerInstances = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];

	blackJackCalc_obj.heartDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
	blackJackCalc_obj.diamondDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
	blackJackCalc_obj.clubDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];
	blackJackCalc_obj.spadeDeck = [2,3,4,5,6,7,8,9,"X","B","Q","K","A"];

	blackJackCalc_obj.drawCard = false;
	blackJackCalc_obj.playerSlot = 2;
	blackJackCalc_obj.dealerSlot = 1;
	blackJackCalc_obj.dealerDraws = false;
	blackJackCalc_obj.checkScore = false;

	blackJackCalc_obj.holdingCard = false;

	blackJackCalc_obj.playerSum = 0;
	blackJackCalc_obj.dealerSum = 0;

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
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "H";
		        break;
			case diamondDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "D";
		        break;
			case clubDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "C";
		        break;
			case spadeDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "S";
		        break;
		}
		blackJackCalc_obj.playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
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
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "H";
		    break;
		case diamondDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "D";
		    break;
		case clubDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "C";
		    break;
		case spadeDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "S";
		    break;
	}
	blackJackCalc_obj.dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	chosenDeck[chosenCard] = -2;
	
	//Create Cards
	for (i = 0; i < 7; i++)
	{
		blackJackCalc_obj.playerInstances[i] = instance_create_layer(204 + i * 32, 248, "Instances", playingCards_obj);
		blackJackCalc_obj.playerInstances[i].image_index = blackjackSpriteConverter_scr(blackJackCalc_obj.playerDeck[i]);
	}
	for (i = 0; i < 7; i++)
	{
		blackJackCalc_obj.dealerInstances[i] = instance_create_layer(204 + i * 32, 48, "Instances", playingCards_obj);
		blackJackCalc_obj.dealerInstances[i].image_index = blackjackSpriteConverter_scr(blackJackCalc_obj.dealerDeck[i]);
	}
}
