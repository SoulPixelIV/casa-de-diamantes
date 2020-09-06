if (screen == 1)
{
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
			screen = 0;
		}
		else if (dealerSum > 21 || playerSum > dealerSum)
		{
			//WIN
			draw_text(50, 50, "YOU WIN!");
			if (!finished)
			{
				global.money += moneypool * 2;
				moneypool = 0;
				screen = 0;
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
				screen = 0;
			}
		}
	}
}
else
{
}

draw_text(250, 250, "POT: " + string(moneypool));