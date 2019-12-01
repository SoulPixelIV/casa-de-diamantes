currMoney = value[0]+value[1]+value[2]+value[3]+value[4]+value[5]+value[6]+value[7];

while (currMoney < global.money)
{
	value[0]++;
	currMoney++;
}

for (i = 0; i < array_length_1d(value)-1; i++)
{
	if (value[i] > 9)
	{
		value[i+1]++;
		for (j = i; j > -1; j--)
		{
			value[j] = 0;
		}
	}
}

alarm[0] = 1;
