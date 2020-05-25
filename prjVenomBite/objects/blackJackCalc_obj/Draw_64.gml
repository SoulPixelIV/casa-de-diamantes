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
draw_text(44, 200, playerSum);

//Dealer Card Sum
draw_text(44, 100, dealerSum);