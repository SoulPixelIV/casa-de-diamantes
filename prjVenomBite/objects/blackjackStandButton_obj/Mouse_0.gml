blackJackCalc_obj.dealerVisible = true;
if (blackJackCalc_obj.dealerSum < 17 && !picked)
{
	blackJackCalc_obj.dealerPhase++;
	picked = true;
	alarm[0] = buffer;
}
