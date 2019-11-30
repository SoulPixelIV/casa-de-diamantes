if (money > 0)
{
	value[0]++;
	money--;
}

for (i = 0; i < array_length_1d(value); i++)
{
	if (value[i] > 9)
	{
		value[i+1]++
		value[i] = 0;
	}
}

alarm[0] = 1;
