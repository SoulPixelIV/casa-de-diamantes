inCutscene = false;

//Scenes
scene1 = false;
scene2 = false;
scene3 = false;
scene4 = false;
scene5 = false;
scene6 = false;
scene7 = false;
scene8 = false;
scene9 = false;
scene10 = false;
scene11 = false;
scene12 = false;
scene13 = false;
scene14 = false;
scene15 = false;
scene16 = false;
scene17 = false;
scene18 = false;
scene19 = false;
scene20 = false;
scene21 = false;
scene22 = false;
scene23 = false;
scene24 = false;
scene25 = false;
scene26 = false;
scene27 = false;
scene28 = false;
scene29 = false;
scene30 = false;
scene31 = false;
scene32 = false;
scene33 = false;
scene34 = false;
scene35 = false;
scene36 = false;
scene37 = false;
scene38 = false;
scene39 = false;
scene40 = false;
scene41 = false;
scene42 = false;
scene43 = false;

//Dialogue Markers
scene1Low = 0;
scene1High = 13;
scene2Low = 14;
scene2High = 16;
scene3Low = 17;
scene3High = 19;
scene4Low = 20;
scene4High = 26;
scene5Low = 27;
scene5High = 39;
scene6Low = 40;
scene6High = 42;
scene7Low = 43;
scene7High = 44;
scene8Low = 45;
scene8High = 50;
scene9Low = 51;
scene9High = 57;
scene10Low = 58;
scene10High = 65;
scene11Low = 66;
scene11High = 68;
scene12Low = 69;
scene12High = 73;
scene13Low = 74;
scene13High = 75;
scene14Low = 76;
scene14High = 77;
scene15Low = 78;
scene15High = 80;
scene16Low = 81;
scene16High = 82;
scene17Low = 83;
scene17High = 87;
scene18Low = 88;
scene18High = 104;
scene19Low = 105;
scene19High = 125;
scene20Low = 126;
scene20High = 146;
scene21Low = 147;
scene21High = 165;
scene22Low = 166;
scene22High = 211;
scene23Low = 166;
scene23High = 211;
scene24Low = 212;
scene24High = 214;
scene25Low = 215;
scene25High = 219;
scene26Low = 220;
scene26High = 223;
scene27Low = 224;
scene27High = 226;
scene28Low = 227;
scene28High = 232;
scene29Low = 233;
scene29High = 253;
scene30Low = 254;
scene30High = 256;
scene31Low = 257;
scene31High = 259;
scene32Low = 260;
scene32High = 263;
scene33Low = 264;
scene33High = 267;
scene34Low = 268;
scene34High = 271;
scene35Low = 272;
scene35High = 275;
scene36Low = 276;
scene36High = 280;
scene37Low = 281;
scene37High = 291;
scene38Low = 292;
scene38High = 297;
scene39Low = 298;
scene39High = 301;
scene40Low = 302;
scene40High = 305;
scene41Low = 306;
scene41High = 309;
scene42Low = 310;
scene42High = 313;
scene43Low = 314;
scene43High = 322;

//Dialogue Text
//!!!ALWAYS 1 EMPTY SPACE & 1 FREE SPACE BETWEEN SCENES
// # = Steph
// @ = 
// $ = Cindy
// * = Cindy2
// § = Cindy3
// > = Komo
// ; = Tristram
// _ = Komo+Tristram
// } = Steph+Cindy
// { = Steph+Tristram
// % = Cutie-Plus
// ] = Bartender
// [ = Bunnygirl
// ^ = VIP
// < = VIP2
// ´ = CustomTarget
// W[Number] = Open specific window menu

//Scene 1 UNUSED
startScene1Timer = false;
scene1Timer = 9400;
scene1TimerSave = scene1Timer;
startScene1BlackTimer = false;
scene1BlackTimer = 500;
scene1BlackTimerSave = scene1Timer;

dialogue[0] = "$Well, if it isn't our girl Steph.";
dialogue[1] = "#Long time no see.";
dialogue[2] = "#Oh and thank you..";
dialogue[3] = "$You know I always have an eye on you.";
dialogue[4] = "$Anyway, you know the drill.";
dialogue[5] = "$You should talk to the manager and get a new assignment.";
dialogue[6] = "#You could atleast buy me a drink before that.";
dialogue[7] = "$We can do that after the job is done.";
dialogue[8] = "$Don't forget to visit me after you talked to the manager.";
dialogue[9] = "$I have something for you.";
dialogue[10] = "#Doesn't that sound great..";
dialogue[11] = "$You will find me on the VIP floor."; 
dialogue[12] = "$See ya."; 
dialogue[13] = ""; 

//Scene 2
startScene2Timer = false;
scene2Timer = 1600;
scene2TimerSave = scene2Timer;

dialogue[14] = "]Good evening and welcome to the Casa De Diamantes!";
dialogue[15] = "]How can I be of service today?";
dialogue[16] = "";

//Scene 3
dialogue[17] = "[Good evening!";
dialogue[18] = "G1";
dialogue[19] = "";

//Scene 4 Cindy Intro Upgrade Dialogue
startScene4Timer = false;
scene4Timer = 5830;
scene4TimerSave = scene4Timer;

dialogue[20] = "*Steph I have a present for you.";
dialogue[21] = "*I developed these syringes to revive you, ..";
dialogue[22] = "*..when you're in critical condition.";
dialogue[23] = "*I also worked on a prototype companion!";
dialogue[24] = "*See for yourself..";
dialogue[25] = "                                                                                                             ";
dialogue[26] = ""; 

//Scene 5 VIP First Mission
startScene5Timer = false;
scene5Timer = 12100;
scene5TimerSave = scene5Timer;

dialogue[27] = "^Steph. I have a contract for you.";
dialogue[28] = "^The situation seems to be getting a bit out of control.";
dialogue[29] = "^Overwhelming, rather...interested?";
dialogue[30] = "#Shoot me the details.";
dialogue[31] = "^Straight to the point!";
dialogue[32] = "^We need you to investigate the Senzela Forest."
dialogue[33] = "^We have found a high concentration of spore cells there.";
dialogue[34] = "^This phenomenon started appearing a few days ago.";
dialogue[35] = "^Investigate the situation and find the cause for the uprise.";
dialogue[36] = "^You will be compensated for your work.";
dialogue[37] = "#I'll be on my way then.";
dialogue[38] = "                                                                                                             ";
dialogue[39] = "";

//Scene 6 Cindy Upgrade Menu
startScene6Timer = false;

dialogue[40] = "*Please take a look..";
dialogue[41] = "W2";
dialogue[42] = "";

//Scene 7 VIP During Mission Talk
startScene7Timer = false;
scene7Timer = 450;
scene7TimerSave = scene7Timer;

dialogue[43] = "^...";
dialogue[44] = "";

//Scene 8 First Time Entering Casino
startScene8Timer = false;
scene8Timer = 4340;
scene8TimerSave = scene8Timer;
startScene8BlackTimer = false;
scene8BlackTimer = 300;
scene8BlackTimerSave = scene8Timer;

dialogue[45] = "<Welcome to my jewel, the Casa De Diamantes.";
dialogue[46] = "<Where strangers become friends! Please, enjoy your stay.";
dialogue[47] = "<I heard you've had some trouble on the way here.";
dialogue[48] = "<Girl's managed to empty 6 clips until you finally woke up.";
dialogue[49] = "                                                                                                             ";
dialogue[50] = "";

//Scene 9 First Time Entering Casino
startScene9Timer = false;
scene9Timer = 4700;
scene9TimerSave = scene9Timer;
startScene9BlackTimer = false;
scene9BlackTimer = 500;
scene9BlackTimerSave = scene9Timer;

dialogue[51] = "$They're magazines, not clips.";
dialogue[52] = "<...I'm glad you made it out alive Steph.";
dialogue[53] = "<Meet me in my office on the VIP floor.";
dialogue[54] = "<For now, enjoy our games and entertainment!";
dialogue[55] = "<Until then.";
dialogue[56] = "                                                                                                             ";
dialogue[57] = "";

//Scene 10 First Time Entering Casino
startScene10Timer = false;
scene10Timer = 6000;
scene10TimerSave = scene10Timer;
startScene10BlackTimer = false;
scene10BlackTimer = 400;
scene10BlackTimerSave = scene10Timer;

dialogue[58] = "$Steph!";
dialogue[59] = "#Cindy.";
dialogue[60] = "$I'm so glad you're finally here.";
dialogue[61] = "$I set up a room here already, come on you gotta get some rest.";
dialogue[62] = "$We got a lot of work before us.";
dialogue[63] = "$Come on, you'll love what I did to the place!";
dialogue[44] = "                                                                                                             ";
dialogue[65] = "";

//Scene 11 VIP Out Of Room Interaction
startScene11Timer = false;
scene11Timer = 800;
scene11TimerSave = scene11Timer;

dialogue[66] = "´...";
dialogue[67] = "´cocky.";
dialogue[68] = "";

//Scene 12 CuPy Dialogue 1
startScene12Timer = false;
scene12Timer = 3600;
scene12TimerSave = scene12Timer;

dialogue[69] = "%*bzzzzrr*";
dialogue[70] = "%Steph, It's me Cindy!";
dialogue[71] = "%I can collect data and comunicate with you through CuPy.";
dialogue[72] = "%I will try my best to support you on your mission!";
dialogue[73] = "";

//Scene 13 CuPy Dialogue 2
startScene13Timer = false;
scene13Timer = 600;
scene13TimerSave = scene13Timer;

dialogue[74] = "%Nice! The red keycard!";
dialogue[75] = "";

//Scene 14 CuPy Dialogue 3
startScene14Timer = false;
scene14Timer = 800;
scene14TimerSave = scene14Timer;

dialogue[76] = "%Huh, we could try to find the key.";
dialogue[77] = "";

//Scene 15 CuPy Dialogue 4
startScene15Timer = false;
scene15Timer = 1200;
scene15TimerSave = scene15Timer;

dialogue[78] = "%Oh, this looks like a maze..";
dialogue[79] = "%Let's try to find the red keycard.";
dialogue[80] = "";

//Scene 16 CuPy Dialogue 5
startScene16Timer = false;
scene16Timer = 400;
scene16TimerSave = scene16Timer;

dialogue[81] = "%Oh nice!";
dialogue[82] = "";

//Scene 17 CuPy Dialogue 6
startScene17Timer = false;
scene17Timer = 3200;
scene17TimerSave = scene17Timer;

dialogue[83] = "#Cindy, it's done but I don't think I'm heading back yet.";
dialogue[84] = "%I know..saw it from up here. You'll definitely want to see it.";
dialogue[85] = "%Keep going east, theres an overlook next your rendezvous point.";
dialogue[86] = "#On it.";
dialogue[87] = "";

//Scene 18 Team Meetup VIP Room
startScene18BlackTimer = false;
scene18BlackTimer = 400;
startScene18Timer = false;

dialogue[88] = "_Steph!";
dialogue[89] = "#Guys! So happy to see you again! How was the trip?";
dialogue[90] = ";We were not able to find the mother plant.";
dialogue[91] = ">Ah the weather was wonderful!";
dialogue[92] = "#I'm glad you were able to make it here.";
dialogue[93] = "#How was the flight?";
dialogue[94] = ";Never jumping again.";
dialogue[95] = ">Incredible.";
dialogue[96] = "}Typical.";
dialogue[97] = "§Next time we'll order an airship.";
dialogue[98] = ";You better be!";
dialogue[99] = "§Anyway, the manager wants to meet you Steph.";
dialogue[100] = "§And we're all invited tonight!";
dialogue[101] = "§So let's meet at the diner.";
dialogue[102] = "§Hope you brought an empty belly!";
dialogue[103] = "                                                                                                             ";
dialogue[104] = "";

//Scene 19 Dining Hall
startScene19BlackTimer = false;
scene19BlackTimer = 400;
startScene19Timer = false;

dialogue[105] = "$Wow, that is some great duck! Props to the chef!";
dialogue[106] = "^I'm glad you like it.";
dialogue[107] = "$But Steph, how long have you been eating meat again?";
dialogue[108] = "$I thought you can't handle that stuff.";
dialogue[109] = "#...";
dialogue[110] = "#I haven't really thought about it...";
dialogue[111] = "$No pressure, just wondering.";
dialogue[112] = "^Steph, your payment is waiting for you.";
dialogue[113] = "^You can talk to one of the staff members.";
dialogue[114] = "#Appreciated.";
dialogue[115] = ";Komo, could you please consume your food like a normal human being.";
dialogue[116] = ">*chomp* Whats your problem??";
dialogue[117] = "$Guys please..";
dialogue[118] = "#Cindy, how do we proceed?";
dialogue[119] = "$I have analyzed your findings.";
dialogue[120] = "$I have found some disturbing evidence for my hypothesis..";
dialogue[121] = "$We will talk about it later in our room.";
dialogue[122] = "$But for now let us enjoy the evening.";
dialogue[123] = ">I hope you all have a wonderful stay!";
dialogue[124] = "                                                                                                             ";
dialogue[125] = "";

//Scene 20 Komo Basement
startScene20BlackTimer = false;
scene20BlackTimer = 400;
startScene20Timer = false;

dialogue[126] = "#Hey Ko-";
dialogue[127] = ">STEPH! Stop sneaking like that!!";
dialogue[128] = "#I wasn't!";
dialogue[129] = "#You couldn't hear my loud stomping because of your punching.";
dialogue[130] = "#You need to get in some delayed hooks more often, keeps your opponent guessing.";
dialogue[131] = ">You're right, there's still a lot on my mind.";
dialogue[132] = ">So give me a while to get back in my flow.";
dialogue[133] = ">Punching's the one thing i'm good at and-";
dialogue[134] = "#You don't have to.";
dialogue[135] = ">I do, I do have to punch. It's why I'm here.";
dialogue[136] = "#...";
dialogue[137] = ">...Steph, do you also feel these sensations?";
dialogue[138] = "#Yes, I know what you mean.";
dialogue[139] = ">I don't feel like myself anymore.";
dialogue[140] = ">There's something else.";
dialogue[141] = "#Komo, we will find the cause.";
dialogue[142] = "#I promise you that..";
dialogue[143] = ">I think I'll stay in my room for tonight.";
dialogue[144] = ">I'll see you in Cindys room.";
dialogue[145] = "                                                                                                             ";
dialogue[146] = "";

//Scene 21 Tristram Shirtless Dialogue
startScene21BlackTimer = false;
scene21BlackTimer = 600;
startScene21Timer = false;
phase2 = false;

dialogue[147] = "#A bit aggressive aren't we tonight?";
dialogue[148] = "                   ";
dialogue[149] = ";...";
dialogue[150] = ";What do you mean, you're all my favorite people.";
dialogue[151] = "#Please be careful around Komo.";
dialogue[152] = "#She doesn't feel like herself anymore.";
dialogue[153] = ";Is she talking about the weird memories again?";
dialogue[154] = ";She should just take a-";
dialogue[155] = "#I saw it.";
dialogue[156] = "#In the Senzela Forest.";
dialogue[157] = "#There is something going on and it will not end well.";
dialogue[158] = "#..for all of us.";
dialogue[159] = ";A bit pessimistic, don't you think?";
dialogue[160] = "#Maybe, but I can kinda understand Komo no-";
dialogue[161] = ";You're also starting to think like her?";
dialogue[162] = "#You know what, I'll see you later.";
dialogue[163] = "{...";
dialogue[164] = "                                                                                                             ";
dialogue[165] = "";

//Scene 22 FREE
startScene22BlackTimer = false;
scene22BlackTimer = 400;
startScene22Timer = false;


//Scene 23 2.Meeting
startScene23BlackTimer = false;
scene23BlackTimer = 400;
startScene23Timer = false;

dialogue[166] = "$Ah, Steph! Quickly, come in!";
dialogue[167] = "#A classic Cindy live presentation, oh how i've missed them!";
dialogue[168] = ">Come on!";
dialogue[169] = "$Now that we're all assembled...todays agenda!";
dialogue[170] = "$1. Previous findings. 2. Knowing your enemy. 3. Newest intel.";
dialogue[171] = "$...and finally, how do we proceed.";
dialogue[172] = "$Previous findings! Not much yet.";
dialogue[173] = "$There's a gigantic laser, for one.";
dialogue[174] = "$What does it do? We don't know yet.";
dialogue[175] = "#It got harder to breathe whenever it appeared.";
dialogue[176] = "#Should look into that maybe, can't just be a coincidence, can it?";
dialogue[177] = "$Next, knowing your enemy!";
dialogue[178] = "$All aggressive beings we met so far seem to be..";
dialogue[179] = "$..at least partially surrounded with plantmatter.";
dialogue[180] = "$Which seems to coincide with the information..";
dialogue[181] = "$..we gathered prior to our arrival here.";
dialogue[182] = "$My guess is, this was caused my some kind of infection.";
dialogue[183] = "$This brings us to my next point,..";
dialogue[184] = "$..for which Tristram prepared something for us.";
dialogue[185] = ";In our search through southeast asia,..";
dialogue[186] = ";..we have confirmed the rumours of the existence of a flower..";
dialogue[187] = ";..capable of growing exclusively out of animal carcasses.";
dialogue[188] = ";Tests have shown to survive, if grafted to living specimen..";
dialogue[189] = ";..even if it lost its ability to grow.";
dialogue[190] = "$My theory suggests it must have fundamentally..";
dialogue[191] = "$..changed it's entire lifecycle and behaviour.";
dialogue[192] = "$I just don't know in what way yet.";
dialogue[193] = ";If there is a link between the species we found in Indonesia..";
dialogue[194] = ";..and the one we're dealing with here, it can only mean one thing.";
dialogue[195] = ";Someone is purposefully spreading this species.";
dialogue[196] = ";Only that this scale seems far too big for a group small enough..";
dialogue[197] = ";..to have eluded us this far.";
dialogue[198] = "$Thank you Tristram.";
dialogue[199] = "$Now, what do we do with all this?";
dialogue[200] = "$Well, Tristram and Komo had an idea already.";
dialogue[201] = "$On the plane they saw some kind of powerplant..";
dialogue[202] = "$..that seemed to melt and collapse in on itself.";
dialogue[203] = ">It's as if its walls were burnt away..";
dialogue[204] = ">..with some quickly spreading acid.";
dialogue[205] = ">We're thinking that our evildoers might have abused this facility..";
dialogue[206] = ">..to somehow spread this infection to the masses.";
dialogue[207] = "$Steph, we'll send you over there.";
dialogue[208] = "$See what you can find out.";
dialogue[209] = "$For tonight, you're dismissed! Good night.";
dialogue[210] = "                                                                                                             ";
dialogue[211] = "";

//Scene 24 CuPy Dialogue 1 Endless Depths
startScene24BlackTimer = false;
scene24BlackTimer = 600;
startScene24Timer = false;

dialogue[212] = "%*bzzzrt* Steph wha-..";
dialogue[213] = "                                                                                                             ";
dialogue[214] = "";

//Scene 25 CuPy Dialogue 2 Endless Depths
startScene25BlackTimer = false;
scene25BlackTimer = 600;
startScene25Timer = false;

dialogue[215] = "%Steph, do you copy?";
dialogue[216] = "%The connection should be back online.";
dialogue[217] = "%The airship sho- *bzzrt*";
dialogue[218] = "                                                                                                             ";
dialogue[219] = "";


//Scene 26 CuPy Dialogue 3 Endless Depths
startScene26BlackTimer = false;
scene26BlackTimer = 600;
startScene26Timer = false;

dialogue[220] = "%The airship is repaired.";
dialogue[221] = "%Steph, I'm sending you the coordinates.";
dialogue[222] = "                                                                                                             ";
dialogue[223] = "";

//Scene 27 CuPy Dialogue 4 Endless Depths
startScene27BlackTimer = false;
scene27BlackTimer = 600;
startScene27Timer = false;

dialogue[224] = "%Please be safe...";
dialogue[225] = "                                                                                                             ";
dialogue[226] = "";

//Scene 28 Komo Blackjack
startScene28Timer = false;

dialogue[227] = "#Komo, you will not believe what just happened to me...";
dialogue[228] = ">Not now Steph! I'm on a winning streak.";
dialogue[229] = ">Come on...atleast let me be good at one thing...";
dialogue[230] = ">...Damnit.";
dialogue[231] = "                                                                                                             ";
dialogue[232] = "";

//Scene 29 Tristram+Cindy
startScene29BlackTimer = false;
scene29BlackTimer = 600;
startScene29Timer = false;

dialogue[233] = "*Steph!";
dialogue[234] = ";I was worried about you.";
dialogue[235] = "#Thank you, I'm alright.";
dialogue[236] = "*The airship is fully functional and ready for liftoff.";
dialogue[237] = ";A mistake like this is unforgiveable!";
dialogue[238] = ";Cindy, you were responsible for the calculations!";
dialogue[239] = "*It wasn't a mistake...";
dialogue[240] = ";What?";
dialogue[241] = "*The airship has been shot!";
dialogue[242] = "#How is this possible?";
dialogue[243] = "*Someone knew about our coordinates.";
dialogue[244] = "*But we are the only ones with this information.";
dialogue[245] = ";I was with Komo the whole time.";
dialogue[246] = ";Komo is very talkative I know that.";
dialogue[247] = ";But I had an eye on her the whole time!";
dialogue[248] = "#Could it be that we-";
dialogue[249] = "*you sHould invEstigate the eden powerplant.";
dialogue[250] = ";You shouLd investigate the eden powerPlant.";
dialogue[251] = "#i shXould investiXXgate tXhe edenX powXXerplXant.";
dialogue[252] = "                                                                                                             ";
dialogue[253] = "";

//Scene 30 CuPy Dialogue 1 Powerplant
startScene30Timer = false;

dialogue[254] = "%We need to find the entrance to the alpha-level.";
dialogue[255] = "                                                                                                             ";
dialogue[256] = "";

//Scene 31 CuPy Dialogue 2 Powerplant
startScene31Timer = false;

dialogue[257] = "%Good job, Steph!";
dialogue[258] = "                                                                                                             ";
dialogue[259] = "";

//Scene 32 CuPy Dialogue 3 Powerplant
startScene32Timer = false;

dialogue[260] = "%I'm detecting a huge increase in gamma rays.";
dialogue[261] = "%Steph, the radiation levels are off the charts!";
dialogue[262] = "                                                                                                             ";
dialogue[263] = "";

//Scene 33 CuPy Dialogue 4 Powerplant
startScene33Timer = false;

dialogue[264] = "%That's it, the research facility!";
dialogue[265] = "%The overflowing radiation is its power source!";
dialogue[266] = "                                                                                                             ";
dialogue[267] = "";

//Scene 34 CuPy Dialogue 5 Powerplant
startScene34Timer = false;

dialogue[268] = "%The facility seems to be inaccessible.";
dialogue[269] = "%The radiation would kill us all in an instant.";
dialogue[270] = "                                                                                                             ";
dialogue[271] = "";

//Scene 35 CuPy Dialogue 6 Powerplant
startScene35Timer = false;

dialogue[272] = "%Steph! I have gathered all the information we need.";
dialogue[273] = "%Head for the exit on the top floor!";
dialogue[274] = "                                                                                                             ";
dialogue[275] = "";

//Scene 36 VIP Crazy
startScene36BlackTimer = false;
scene36BlackTimer = 600;
startScene36Timer = false;

dialogue[276] = "^T..Th...The";
dialogue[277] = "^ThX End is nXar";
dialogue[278] = "#...";
dialogue[279] = "                                                                                                             ";
dialogue[280] = "";

//Scene 37 Komo Scared
startScene37BlackTimer = false;
scene37BlackTimer = 600;
startScene37Timer = false;

dialogue[281] = ">I told you something was up!";
dialogue[282] = "#What happened?";
dialogue[283] = ">The manager, Steph...He is gone.";
dialogue[284] = ">He was talking gibberish and now his office is empty...";
dialogue[285] = "#I will talk to the others about this.";
dialogue[286] = ">Steph.";
dialogue[287] = ">You promised me that everything is gonna be fine...";
dialogue[288] = "#EverXthiXg iX gonna be fiXe";
dialogue[289] = ">...steph?";
dialogue[290] = "                                                                                                             ";
dialogue[291] = "";

//Scene 38 CuPy Dialogue Strato 1
startScene38Timer = false;
scene38Timer = 600;
scene38TimerSave = scene38Timer;

dialogue[292] = "%Steph, can you hear me?";
dialogue[293] = "%We are ready to infiltrate the research lab.";
dialogue[294] = "%WX arX ready to Xnfiltrate the rXsearch lXb.";
dialogue[295] = "%*static noise*";
dialogue[296] = "                                                                                                             ";
dialogue[297] = "";

//Scene 39 CuPy Dialogue Strato 2
startScene39Timer = false;
scene39Timer = 600;
scene39TimerSave = scene39Timer;

dialogue[298] = "%What Xs the purpose of lXfe, Steph?";
dialogue[299] = "%I don't wXnt to be nutrXtion for a god...";
dialogue[300] = "                                                                                                             ";
dialogue[301] = "";

//Scene 40 CuPy Dialogue Strato 3
startScene40Timer = false;
scene40Timer = 600;
scene40TimerSave = scene40Timer;

dialogue[302] = "%I wXll miss our timX together.";
dialogue[303] = "%We do not dXserve thXs.";
dialogue[304] = "                                                                                                             ";
dialogue[305] = "";

//Scene 41 CuPy Dialogue Strato 4
startScene41Timer = false;
scene41Timer = 600;
scene41TimerSave = scene41Timer;

dialogue[306] = "%It Xs time tX comX home, StXph.";
dialogue[307] = "%YoX cannot OXtrun fatX!";
dialogue[308] = "                                                                                                             ";
dialogue[309] = "";

//Scene 42 CuPy Dialogue Strato 5
startScene42Timer = false;
scene42Timer = 600;
scene42TimerSave = scene42Timer;

dialogue[310] = "%LXt us go, mX child.";
dialogue[311] = "%Your mXssion is nXw over.";
dialogue[312] = "                                                                                                             ";
dialogue[313] = "";

//Scene 43 Komo Tristram Consumed
startScene43BlackTimer = false;
scene43BlackTimer = 600;
startScene43Timer = false;

dialogue[314] = ";I'm glXd yoX could jXin us.";
dialogue[315] = ">Thanks to yoX I have lXcated the vXrgin plant.";
dialogue[316] = ";YoX were alwXys my favourite chXld.";
dialogue[317] = ">TXnight will be a special occXsion!";
dialogue[318] = ";A new AgX...for Xll of us.";
dialogue[319] = ">Now if yoX don't mXnd...";
dialogue[320] = ";PleasX come to mX.";
dialogue[321] = "                                                                                                             ";
dialogue[322] = "";