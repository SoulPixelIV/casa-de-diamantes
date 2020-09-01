//Draw Player Deck
/*
for (i = 0; i < 7; i++)
{
	draw_sprite(playingCards_spr, blackjackSpriteConverter_scr(playerDeck[i]), 24 + i * 32, 148);
}
//Draw Dealer Deck
for (i = 0; i < 7; i++)
{
	draw_sprite(playingCards_spr, blackjackSpriteConverter_scr(dealerDeck[i]), 24 + i * 32, 48);
}
*/
//Player Card Sum
draw_text(44, 80, playerSum);

//Dealer Card Sum
draw_text(44, 20, dealerSum);

if (checkScore)
{
	if ((playerSum > 21 || playerSum < dealerSum) && dealerSum < 22)
	{
		//LOOSE
		draw_text(50, 50, "YOU LOOSE!");
		moneypool = 0;
		finished = true;
	}
	else if (dealerSum > 21 || playerSum > dealerSum)
	{
		//WIN
		draw_text(50, 50, "YOU WIN!");
		if (!finished)
		{
			global.money += moneypool * 2;
			moneypool = 0;
			finished = true;
		}	
	}
	else if (playerSum == dealerSum)
	{
		//DRAW
		draw_text(50, 50, "DRAW!");
		if (!finished)
		{
			global.money += moneypool;
			moneypool = 0;
			finished = true;
		}
	}
}