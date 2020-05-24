//Draw Player Deck
for (i = 0; i < 7; i++)
{
	draw_text(256 + i * 32, 356, playerDeck[i]);
}
//Draw Dealer Deck
for (i = 0; i < 7; i++)
{
	draw_text(256 + i * 32, 156, dealerDeck[i]);
}

//Player Card Sum
draw_text(312, 400, playerSum);

//Dealer Card Sum
draw_text(312, 200, dealerSum);
	