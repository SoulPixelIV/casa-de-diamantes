chosenCard = argument0;

if (chosenCard == "B" || chosenCard == "Q" || chosenCard == "K")
{
	return 10;
}
else if (chosenCard == "A")
{
	return 11;
}
else
{
	return chosenCard;
}