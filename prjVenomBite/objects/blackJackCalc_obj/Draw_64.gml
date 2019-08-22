for (i = 0; i <= dealerPhase; i++)
{
	draw_text(256 + i * 32, 256, dealerDeck[i]);
}
for (i = 0; i <= playerPhase; i++)
{
	draw_text(256 + i * 32, 356, playerDeck[i]);
}

if (dealerVisible)
{
	if (playerSum > 21)
	{
		draw_text(64, 64, "YOU LOOSE!");
	}
	else if (dealerSum > 21)
	{
		draw_text(64, 64, "YOU WIN!");
	}
	else if (playerSum > dealerSum)
	{
		draw_text(64, 64, "YOU LOOSE!");
	}
	else if (playerSum < dealerSum)
	{
		draw_text(64, 64, "YOU WIN!");
	}
	else if (playerSum == dealerSum)
	{
		draw_text(64, 64, "BREAK EVEN!");
	}
}
	