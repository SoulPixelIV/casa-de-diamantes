chosenCard = argument0;

if (chosenCard == -1)
{
	return 52;
}
else
{
	chosenNumber = string_char_at(chosenCard, 1);
	chosenColor = string_char_at(chosenCard, 2);

	switch (chosenNumber) {
		case "X":
	        chosenNumber = 10;
	        break;
	    case "B":
	        chosenNumber = 11;
	        break;
		case "Q":
	        chosenNumber = 12;
	        break;
		case "K":
	        chosenNumber = 13;
	        break;
		case "A":
	        chosenNumber = 14;
	        break;
	}
	switch (chosenColor) {
	    case "H":
	        chosenColor = 0;
	        break;
		case "D":
	        chosenColor = 1;
	        break;
		case "C":
	        chosenColor = 2;
	        break;
		case "S":
	        chosenColor = 3;
	        break;
	}

	return (((chosenNumber - 2) * 4) + chosenColor);
}
