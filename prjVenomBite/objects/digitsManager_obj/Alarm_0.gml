currMoney = value[0]+value[1]*10+value[2]*100+value[3]*1000+value[4]*10000+value[5]*1000000+value[6]*10000000+value[7]*100000000;

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
