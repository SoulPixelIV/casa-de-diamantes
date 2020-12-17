// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blackjackBegin(){
	//First Round -> Player gets 2 Cards
	for (i = 0; i < 2; i++)
	{
		var chosenDeck = choose(blackJackCalc_obj.heartDeck, blackJackCalc_obj.diamondDeck, blackJackCalc_obj.clubDeck, blackJackCalc_obj.spadeDeck);
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		while (chosenDeck[chosenCard] == -2)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		switch (chosenDeck) {
		    case blackJackCalc_obj.heartDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "H";
		        break;
			case blackJackCalc_obj.diamondDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "D";
		        break;
			case blackJackCalc_obj.clubDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "C";
		        break;
			case blackJackCalc_obj.spadeDeck:
		        blackJackCalc_obj.playerDeck[i] = string(chosenDeck[chosenCard]) + "S";
		        break;
		}
		blackJackCalc_obj.playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		chosenDeck[chosenCard] = -2;
	}

	//First Round -> Dealer gets 1 Card
	var chosenDeck = choose(blackJackCalc_obj.heartDeck, blackJackCalc_obj.diamondDeck, blackJackCalc_obj.clubDeck, blackJackCalc_obj.spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == -2)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	switch (chosenDeck) {
		case blackJackCalc_obj.heartDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "H";
		    break;
		case blackJackCalc_obj.diamondDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "D";
		    break;
		case blackJackCalc_obj.clubDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "C";
		    break;
		case blackJackCalc_obj.spadeDeck:
		    blackJackCalc_obj.dealerDeck[0] = string(chosenDeck[chosenCard]) + "S";
		    break;
	}
	blackJackCalc_obj.dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	chosenDeck[chosenCard] = -2;
}
