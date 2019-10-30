dealerPhase = 2;
playerPhase = 2;
dealerVisible = false;

playerSum = 0;
dealerSum = 0;

for (i = 0; i < 5; i++)
{
	playerDeck[i] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
	dealerDeck[i] = choose(2,3,4,5,6,7,8,9,10,"J","Q","K","A");
}

//CHANGE TO DO 2X
for (i = 0; i < 2; i++)
{
	playerSum += bjCalcSum(playerDeck[i]);
	dealerSum += bjCalcSum(dealerDeck[i]);
}

