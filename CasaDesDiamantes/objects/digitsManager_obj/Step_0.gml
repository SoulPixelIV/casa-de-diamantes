currMoney = value[0]+value[1]*10+value[2]*100+value[3]*1000+value[4]*10000+value[5]*1000000+value[6]*10000000+value[7]*100000000;

if (currMoney < global.money)
{
	if (currMoney < global.money / 4 && currMoney > global.money / 2)
	{
		value[0] += 9;
		currMoney += 9;
	}
	else if (currMoney < global.money / 1.2 && currMoney + 30 < global.money)
	{
		value[0] += 5;
		currMoney += 5;
	}
	else
	{
		value[0] += 1;
		currMoney += 1;
	}	
}
if (currMoney > global.money)
{
	if (currMoney > global.money * 4 && currMoney < global.money * 2)
	{
		value[0] -= 9;
		currMoney -= 9;
	}
	else if (currMoney > global.money * 1.2 && currMoney - 30 > global.money)
	{
		value[0] -= 5;
		currMoney -= 5;
	}
	else
	{
		value[0] -= 1;
		currMoney -= 1;
	}	
}

//Increase
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
//Decrease
for (i = 0; i < array_length_1d(value)-1; i++)
{
	if (value[i] < 0)
	{
		value[i+1]--;
		for (j = i; j > -1; j--)
		{
			value[j] = 0;
		}
	}
}