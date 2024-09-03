//Player draws card
if (drawCard)
{
	var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
	var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	while (chosenDeck[chosenCard] == -2)
	{
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
	}

	switch (chosenDeck) {
	    case heartDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "H";
	        break;
		case diamondDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "D";
	        break;
		case clubDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "C";
	        break;
		case spadeDeck:
	        playerDeck[playerSlot] = string(chosenDeck[chosenCard]) + "S";
	        break;
	}
	playerInstances[playerSlot].image_index = blackjackSpriteConverter_scr(playerDeck[playerSlot]);
	playerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
	
	//Check if card is ace
	if (blackjackConverter_scr(chosenDeck[chosenCard]) == 11)
	{
		numberofAces++;
	}
	
	chosenDeck[chosenCard] = -2;
	
	playerSlot++;
	drawCard = false;
	if (playerSum >= 21 + (10 * numberofAces))
	{
		screen = 4;
	}
}

//Dealer draws card
if (dealerDraws)
{
	while (dealerSum < 17 - (10 * numberofAcesDealer))
	{
		var chosenDeck = choose(heartDeck, diamondDeck, clubDeck, spadeDeck);
		var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		while (chosenDeck[chosenCard] == -2)
		{
			var chosenCard = choose(0,1,2,3,4,5,6,7,8,9,10,11,12);
		}

		switch (chosenDeck) {
		    case heartDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "H";
		        break;
			case diamondDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "D";
		        break;
			case clubDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "C";
		        break;
			case spadeDeck:
		        dealerDeck[dealerSlot] = string(chosenDeck[chosenCard]) + "S";
		        break;
		}
		dealerInstances[dealerSlot].image_index = blackjackSpriteConverter_scr(dealerDeck[dealerSlot]);
		dealerSum += blackjackConverter_scr(chosenDeck[chosenCard]);
		
		//Check if card is ace
		if (blackjackConverter_scr(chosenDeck[chosenCard]) == 11)
		{
			numberofAcesDealer++;
		}

		chosenDeck[chosenCard] = -2;
		dealerSlot++;
	}
	dealerDraws = false;
	screen = 4;
}

//Check Score
if (screen == 4 && !transactionComplete)
{
	if (playerSum > (21 + (10 * numberofAces)))
	{
		//LOOSE
		if (!playedSound) {
			audio_play_sound(blackjackLose_snd, 1, false);
			playedSound = true;
		}
	}
	else if (dealerSum > (21 + (10 * numberofAcesDealer)))
	{
		//WIN NORMAL
		global.money += moneypool * 2;
		if (!playedSound) {
			audio_play_sound(blackjackWin_snd, 1, false);
			playedSound = true;
		}
		
	}
	else if (playerSum == 21)
	{	
		//DRAW
		if (dealerSum == 21)
		{
			global.money += moneypool;
		}
		//WIN BLACKJACK
		else
		{			
			global.money += moneypool * 3;
		}
		if (!playedSound) {
			audio_play_sound(blackjackWin_snd, 1, false);
			playedSound = true;
		}
	}
	else if ((playerSum - (10 * numberofAces)) > (dealerSum - (10 * numberofAcesDealer)))
	{
		//WIN NORMAL
		global.money += moneypool * 2;
		if (!playedSound) {
			audio_play_sound(blackjackWin_snd, 1, false);
			playedSound = true;
		}
	}
	else if ((playerSum - (10 * numberofAces)) == (dealerSum - (10 * numberofAcesDealer)))
	{
		//DRAW
		global.money += moneypool;
		if (!playedSound) {
			audio_play_sound(blackjackWin_snd, 1, false);
			playedSound = true;
		}
	}
	else if ((playerSum - (10 * numberofAces)) < (dealerSum - (10 * numberofAcesDealer)))
	{
		//LOOSE
		if (!playedSound) {
			audio_play_sound(blackjackLose_snd, 1, false);
			playedSound = true;
		}
	}
	transactionComplete = true;
}

//Create Cards
if (screen == 3 && !spawnedCards)
{
	for (i = 0; i < 7; i++)
	{
		playerInstances[i] = instance_create_layer(cameraBlackjack_obj.xScreenSize / 2, -50, "Instances", playingCards_obj);
		playerInstances[i].image_index = blackjackSpriteConverter_scr(playerDeck[i]);
	}
	for (i = 0; i < 7; i++)
	{
		dealerInstances[i] = instance_create_layer(cameraBlackjack_obj.xScreenSize / 2, -50, "Instances", playingCards_obj);
		dealerInstances[i].image_index = blackjackSpriteConverter_scr(dealerDeck[i]);
	}
	spawnedCards = true;
}

//Move Cards when used
if (screen == 3 || screen == 4)
{
	for (i = 0; i < 7; i++)
	{
		if (playerDeck[i] != -1 && instance_exists(playerInstances[i]))
		{
			if ((playerInstances[i].x > (cardTargetX + i * 37 + 2) + 4 || playerInstances[i].x < (cardTargetX + i * 37 + 2) - 4) || (playerInstances[i].y > cardTargetY + 4 || playerInstances[i].y < cardTargetY - 4))
			{
				playerInstances[i].currentNumber = i;
				with (playerInstances[i])
				{
					if (!target)
					{
						move_towards_point(blackJackCalc_obj.cardTargetX + currentNumber * 37 + 2, blackJackCalc_obj.cardTargetY, global.dt * 2);
					}
				}
			}
			else
			{
				with (playerInstances[i])
				{
					speed = 0;
				}
			}
		}
		if (dealerDeck[i] != -1 && instance_exists(dealerInstances[i]))
		{
			if ((dealerInstances[i].x > (cardTargetX + i * 37 + 2) + 4 || dealerInstances[i].x < (cardTargetX + i * 37 + 2) - 4) || (dealerInstances[i].y > cardTargetDealerY + 4 || dealerInstances[i].y < cardTargetDealerY - 4))
			{
				dealerInstances[i].currentNumber = i;
				with (dealerInstances[i])
				{
					if (!target)
					{
						move_towards_point(blackJackCalc_obj.cardTargetX + currentNumber * 37 + 2, blackJackCalc_obj.cardTargetDealerY, global.dt * 2);
					}
				}
			}
			else
			{
				with (dealerInstances[i])
				{
					speed = 0;
				}
			}
		}
	}
}

//Escape
if (keyboard_check(vk_escape) || gamepad_button_check_pressed(4, gp_select) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2))
{
	if (global.pushDelay < 0) {
		audio_play_sound(typewriterPush_snd, 1, false);
		if (screen == 2) {
			global.pushDelay = global.pushDelaySave;
			playedSound = false;
			screen = 1;
		} else {
			global.spawn = 1;
			global.pushDelay = global.pushDelaySave;
			playedSound = false;
			room_goto(level_Casino);
		}
	}
}






