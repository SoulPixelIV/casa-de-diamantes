chosenCard = argument0;
chosenChar = string_char_at(chosenCard, 1);

if (chosenChar == "B" || chosenChar == "Q" || chosenChar == "K")
{
	return 10;
}
else if (chosenChar == "A")
{
	return 11;
}
else if (chosenChar == "-1")
{
	return 0;
}
else
{
	return (real(chosenChar));
}