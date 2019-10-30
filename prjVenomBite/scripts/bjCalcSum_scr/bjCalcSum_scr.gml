card = argument0;
playerSum = 0;

if (card == "J" || card == "Q" || card == "K")
{
    playerSum += 10;
}
else if (card == "A" && playerSum > 9)
{
    playerSum = 21;
}
else if (card == "A" && playerSum <= 9)
{
    playerSum += 11;
}
else
{
    playerSum += card;
}

return playerSum;