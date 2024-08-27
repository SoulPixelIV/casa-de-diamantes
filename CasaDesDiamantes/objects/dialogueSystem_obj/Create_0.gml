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

//Dialogue Markers
scene1Low = 0;
scene1High = 13;
scene2Low = 14;
scene2High = 16;
scene3Low = 17;
scene3High = 19;
scene4Low = 20;
scene4High = 28;
scene5Low = 29;
scene5High = 44;
scene6Low = 45;
scene6High = 47;
scene7Low = 48;
scene7High = 49;
scene8Low = 50;
scene8High = 55;
scene9Low = 56;
scene9High = 63;
scene10Low = 64;
scene10High = 72;
scene11Low = 73;
scene11High = 75;
scene12Low = 76;
scene12High = 80;
scene13Low = 81;
scene13High = 82;
scene14Low = 83;
scene14High = 84;
scene15Low = 85;
scene15High = 87;
scene16Low = 88;
scene16High = 89;
scene17Low = 90;
scene17High = 94;
scene18Low = 95;
scene18High = 112;
scene19Low = 113;
scene19High = 138;
scene20Low = 139;
scene20High = 166;
scene21Low = 167;
scene21High = 169;
scene22Low = 170;
scene22High = 195;
scene23Low = 196;
scene23High = 197;

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

//Scene 1
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
dialogue[21] = "*I developed a mechanism which allows..";
dialogue[22] = "*..the user to endure more damage.";
dialogue[23] = "*It uses these syringes to revive you..";
dialogue[24] = "*..when you are in critical condition.";
dialogue[25] = "*But that's not all!";
dialogue[26] = "*I also worked on a prototype companion!";
dialogue[27] = "*See for yourself..";
dialogue[28] = ""; 

//Scene 5 VIP First Mission
startScene5Timer = false;
scene5Timer = 12100;
scene5TimerSave = scene5Timer;

dialogue[29] = "^Stranger!";
dialogue[30] = "^So, I'm guessing you're one of those mercenaries.."
dialogue[31] = "^..that keep showing up on my doorstep?";
dialogue[32] = "^Not that I mind, this situation seems to be getting a bit out of control.";
dialogue[33] = "^Overwhelming, rather.";
dialogue[34] = "^You see I've got a job for someone with your kinds of skills.";
dialogue[35] = "^While more of a hit, than an assault, it's not like you have any luck..";
dialogue[36] = "^..finding other employment around here right now..";
dialogue[37] = "^Are you up for it?";
dialogue[38] = "#Shoot me the details.";
dialogue[39] = "^Straight to the point!";
dialogue[40] = "^We don't know what the target looks like by now,..";
dialogue[41] = "^..but we do know it ran into the woods a day ago, never to be seen again.";
dialogue[42] = "^You'd best start looking there.";
dialogue[43] = "#Alright, see you in an hour.";
dialogue[44] = "";

//Scene 6 Cindy Upgrade Menu
startScene6Timer = false;
scene6Timer = 900;
scene6TimerSave = scene6Timer;

dialogue[45] = "*Please take a look..";
dialogue[46] = "W2";
dialogue[47] = "";

//Scene 7 VIP During Mission Talk
startScene7Timer = false;
scene7Timer = 450;
scene7TimerSave = scene7Timer;

dialogue[48] = "^...";
dialogue[49] = "";

//Scene 8 First Time Entering Casino
startScene8Timer = false;
scene8Timer = 4340;
scene8TimerSave = scene8Timer;
startScene8BlackTimer = false;
scene8BlackTimer = 300;
scene8BlackTimerSave = scene8Timer;

dialogue[50] = "<Welcome to my jewel, the Casa De Diamantes, stranger!";
dialogue[51] = "<Where strangers become friends and friends become strangers!";
dialogue[52] = "<Please, enjoy your stay.";
dialogue[53] = "<You're a pretty heavy sleeper, huh?";
dialogue[54] = "<Girl's managed to empty 6 clips until you finally woke up.";
dialogue[55] = "";

//Scene 9 First Time Entering Casino
startScene9Timer = false;
scene9Timer = 4700;
scene9TimerSave = scene9Timer;
startScene9BlackTimer = false;
scene9BlackTimer = 500;
scene9BlackTimerSave = scene9Timer;

dialogue[56] = "$They're magazines, not clips.";
dialogue[57] = "<...";
dialogue[58] = "<I'm glad you made it here alive!";
dialogue[59] = "<I'm also getting a call right now..";
dialogue[60] = "<Meet me in my office on the VIP floor when you get the chance.";
dialogue[61] = "<For now, enjoy our games and entertainment!";
dialogue[62] = "<See ya.";
dialogue[63] = "";

//Scene 10 First Time Entering Casino
startScene10Timer = false;
scene10Timer = 6000;
scene10TimerSave = scene10Timer;
startScene10BlackTimer = false;
scene10BlackTimer = 400;
scene10BlackTimerSave = scene10Timer;

dialogue[64] = "$Steph!!";
dialogue[65] = "#Cindy!!";
dialogue[66] = "$I'm so glad you're finally here! Are you well? Was the trip okay?";
dialogue[67] = "$I set up a room here already, come on you gotta get some rest.";
dialogue[68] = "$We got a lot of work before us.";
dialogue[69] = "#I won't answer questions you don't even remember asking..";
dialogue[70] = "#..but sure, lead the way!";
dialogue[71] = "$Come on, you'll love what i did to the place!";
dialogue[72] = "";

//Scene 11 VIP Out Of Room Interaction
startScene11Timer = false;
scene11Timer = 800;
scene11TimerSave = scene11Timer;

dialogue[73] = "´...";
dialogue[74] = "´cocky.";
dialogue[75] = "";

//Scene 12 CuPy Dialogue 1
startScene12Timer = false;
scene12Timer = 2400;
scene12TimerSave = scene12Timer;

dialogue[76] = "%*bzzzzrr*";
dialogue[77] = "%Steph, It's me Cindy!";
dialogue[78] = "%I can collect data and comunicate with you through CuPy.";
dialogue[79] = "%I will try my best to support you on your mission!";
dialogue[80] = "";

//Scene 13 CuPy Dialogue 2
startScene13Timer = false;
scene13Timer = 600;
scene13TimerSave = scene13Timer;

dialogue[81] = "%Nice! The red keycard!";
dialogue[82] = "";

//Scene 14 CuPy Dialogue 3
startScene14Timer = false;
scene14Timer = 800;
scene14TimerSave = scene14Timer;

dialogue[83] = "%Huh, we could try to find the key.";
dialogue[84] = "";

//Scene 15 CuPy Dialogue 4
startScene15Timer = false;
scene15Timer = 1200;
scene15TimerSave = scene15Timer;

dialogue[85] = "%Oh, this looks like a maze..";
dialogue[86] = "%Let's try to find the red keycard.";
dialogue[87] = "";

//Scene 16 CuPy Dialogue 5
startScene16Timer = false;
scene16Timer = 400;
scene16TimerSave = scene16Timer;

dialogue[88] = "%Oh nice!";
dialogue[89] = "";

//Scene 17 CuPy Dialogue 6
startScene17Timer = false;
scene17Timer = 3200;
scene17TimerSave = scene17Timer;

dialogue[90] = "#Cindy, it's done but I don't think I'm heading back yet.";
dialogue[91] = "%I know..saw it from up here. You'll definitely want to see it.";
dialogue[92] = "%Keep going east, theres an overlook next your rendezvous point.";
dialogue[93] = "#On it.";
dialogue[94] = "";

//Scene 18 Team Meetup VIP Room
startScene18BlackTimer = false;
scene18BlackTimer = 400;
startScene18Timer = false;

dialogue[95] = "_Steph!";
dialogue[96] = "#Guys! So happy to see you again! How was Singapore?";
dialogue[97] = ";Oh we left for Indonesia pretty much a few days in because-";
dialogue[98] = ">the strand we were looking for wasn't anywhere to be found.";
dialogue[99] = "#Shame, you to were looking forward to it...";
dialogue[100] = "#nonetheless, I'm glad you were able to make it here.";
dialogue[101] = "#How was the flight?";
dialogue[102] = ";Never jumping again.";
dialogue[103] = ">Incredible.";
dialogue[104] = "}I guessed as much.";
dialogue[105] = "§Next time we'll order an airship.";
dialogue[106] = ";You better be!";
dialogue[107] = "§Anyway, the manager organzied a little something tonight...";
dialogue[108] = "§...and we're all invited!";
dialogue[109] = "§You don't have to come but...";
dialogue[110] = "§...hope you brought an empty belly!";
dialogue[111] = "                                                                                                             ";
dialogue[112] = "";

//Scene 19 Dining Hall
startScene19BlackTimer = false;
scene19BlackTimer = 400;
startScene19Timer = false;

dialogue[113] = "$Wow, that is some great duck! Props to the chef!";
dialogue[114] = "^Passing it on!";
dialogue[115] = "$But Steph, how long have you been eating meat again?";
dialogue[116] = "$I thought you can't handle that stuff.";
dialogue[117] = "#...";
dialogue[118] = "#I haven't really thought about it...";
dialogue[119] = "$No pressure, just wondering.";
dialogue[120] = "$I've always been ordering vegan with you for your sake.";
dialogue[121] = "$I take it that you don't mind me indulging like that?";
dialogue[122] = "#I guess I don't.";
dialogue[123] = ">I've always been weak but she never seemed to care.";
dialogue[124] = ">Where's the problem.";
dialogue[125] = ";Komo, you barely ever eat anything that isn't pure meat.";
dialogue[126] = ";It's hard for the average brain to even process...";
dialogue[127] = ";...that this is supposed to be food fit for human consumption.";
dialogue[128] = ";Let alone that it's made of real animals.";
dialogue[129] = ">Hey! You're not even making sense!";
dialogue[130] = "#You'll take any chance to pick on her for trivial things like that, eh?";
dialogue[131] = ";I'm just a poor and innocent little court jester, pay me no mind.";
dialogue[132] = "$Ehem. Well, Komo, there's an unwritten contract between Steph and me.";
dialogue[133] = "$I'm just surprised she broke it first, considering she... unwrote it.";
dialogue[134] = ">*chomp* ...a contract? And you left me out of it?!";
dialogue[135] = "$We hoped to keep it's integrity for longer than three days.";
dialogue[136] = "_...fair";
dialogue[137] = "                                                                                                             ";
dialogue[138] = "";

//Scene 20 Komo Basement
startScene20BlackTimer = false;
scene20BlackTimer = 400;
startScene20Timer = false;

dialogue[139] = "#Hey Ko-";
dialogue[140] = ">STEPH! Stop sneaking like that!!";
dialogue[141] = "#I wasn't!";
dialogue[142] = "#You couldn't hear my loud stomping because of your punching.";
dialogue[143] = "#You always jab in the same rhythm as your walk.";
dialogue[144] = "#And we have the same walking speed.";
dialogue[145] = "#You need to get in some delayed hooks more often, keeps your opponent guessing.";
dialogue[146] = ">You're right, there's still a lot on my mind.";
dialogue[147] = ">So give me a while to get back in my flow.";
dialogue[148] = ">Punching's the one thing i'm good at and-";
dialogue[149] = "#You don't have to.";
dialogue[150] = ">I do, I do have to punch. It's why I'm here.";
dialogue[151] = "#Prove it, I mean.";
dialogue[152] = "#Your worth, we know it.";
dialogue[153] = "#And you're more than that.";
dialogue[154] = ">Steph. I would never think you guys would leave me or anything like that.";
dialogue[155] = ">There's something else.";
dialogue[156] = "#I think SHE is thinking of abandoning us.";
dialogue[157] = "#It's the chemicals.";
dialogue[158] = "#We are HER children, and HER best.";
dialogue[159] = "#I haven't a clue what you mean but you probably misinterpreted something.";
dialogue[160] = "#It's a fragile way of communication after all.";
dialogue[161] = ">You're right. Still, I've got much work to do.";
dialogue[162] = ">I'll have to set up this whole basement and I gotta get to it soon.";
dialogue[163] = ">We'll talk later if that's fine.";
dialogue[164] = "#That's fine. See ya!";
dialogue[165] = "                                                                                                             ";
dialogue[166] = "";

//Scene 21 Tristram Shirtless Dialogue
startScene21BlackTimer = false;
scene21BlackTimer = 400;
startScene21Timer = false;

dialogue[167] = "#New ink? Didn't know you liked lizards that much.";
dialogue[168] = "                                                                                                             ";
dialogue[169] = "";

//Scene 22 Tristram Dialogue
startScene22BlackTimer = false;
scene22BlackTimer = 400;
startScene22Timer = false;

dialogue[170] = ";...";
dialogue[171] = ";What do you mean, you're all my favorite people.";
dialogue[172] = ";Your cold blood hasn't deterred me.";
dialogue[173] = "#That's low.";
dialogue[174] = ";No ill intent here.";
dialogue[175] = ";I guess our condition is hard on you?";
dialogue[176] = "#Feels weird is all.";
dialogue[177] = "#What's with that tattoo though?";
dialogue[178] = ";It's a dragon.";
dialogue[179] = "#Doesn't look much like one.";
dialogue[180] = ";A komodo dragon. Designed it myself.";
dialogue[181] = "#What a coincidence.";
dialogue[182] = ";It's not. I designed it for her originally.";
dialogue[183] = "#But-";
dialogue[184] = ";She wanted that tat but you know how our komo is, scared of needles and all.";
dialogue[185] = ";Chickened out in the end.";
dialogue[186] = "#You got it in her place...";
dialogue[187] = ";A lot of effort went into it-";
dialogue[188] = "#And a lot of blood, sweat and tears.";
dialogue[189] = ";...";
dialogue[190] = "#I like it. She would too. Show it to her.";
dialogue[191] = ";How did you-";
dialogue[192] = "#She would have told me before.";
dialogue[193] = "{haha";
dialogue[194] = "                                                                                                             ";
dialogue[195] = "";

//Scene 23 2.Meeting
startScene23BlackTimer = false;
scene23BlackTimer = 400;
startScene23Timer = false;

dialogue[196] = "$Ah, Steph! Quickly, come in!";
dialogue[197] = "#A classic Cindy live presentation, oh how i've missed them!";
dialogue[198] = ">Come on!";
dialogue[199] = "$Now that we're all assembled: todays agenda!";
dialogue[200] = "$1. Previous findings. 2. Knowing your enemy. 3. Newest intel.";
dialogue[201] = "$...and finally, how do we proceed.";
dialogue[202] = "$Previous findings! Not much yet.";
dialogue[203] = "$There's a gigantic laser, for one.";
dialogue[204] = "$What does it do? We don't know yet.";
dialogue[205] = "#It got harder to breathe whenever it appeared.";
dialogue[206] = "#Should look into that maybe, can't just be a coincidence, can it?";
dialogue[207] = "$Next, knowing your enemy!";
dialogue[208] = "$All aggressive beings we met so far seem to be at least partially surrounded with plantmatter.";
dialogue[209] = "$Which seems to coincide with the information we gathered prior to our arrival here.";
dialogue[210] = "$My guess is, this was caused my some kind of infection.";
dialogue[211] = "$This brings us to my next point, for which Tristram prepared something for us.";
dialogue[212] = ";In our search through southeast asia, we have confirmed the rumours of the existence of a flower...";
dialogue[213] = ";...capable of growing exclusively out of animal carcasses.";
dialogue[214] = ";Tests have shown to survive, if grafted to living specimen...";
dialogue[215] = ";...even if it lost its ability to grow.";
dialogue[216] = "$My theory suggests it must have fundamentally changed it's entire lifecycle and behaviour.";
dialogue[217] = "$I just don't know in what way yet.";
dialogue[218] = ";If there is a link between the species we found in indonesia...";
dialogue[219] = ";...and the one we're dealing with here, it can only mean one thing.";
dialogue[220] = ";Someone is purposefully spreading this species.";
dialogue[221] = ";Only that this scale seems far too big for a group small enough...";
dialogue[222] = ";...to have eluded us this far.";
dialogue[223] = "$Thank you tristram.";
dialogue[224] = "$Now, what do we do with all this?";
dialogue[225] = "$Well, Tristram and Komo had an idea already.";
dialogue[226] = "$On the plane they saw some kind of powerplant...";
dialogue[227] = "$...that seemed to melt and collapse in on itself.";
dialogue[228] = ">It's as if its walls were burnt away with some kind of quickly spreading acid.";
dialogue[229] = ">We're thinking that our evildoers might have abused this facility...";
dialogue[230] = ">...to somehow spread this infection to the masses.";
dialogue[231] = "$Steph, we'll send you and Tristram over there.";
dialogue[232] = "$See what you two can find out!";
dialogue[233] = "$For tonight, you're dismissed! Good night.";
dialogue[234] = "                                                                                                             ";
dialogue[235] = "";
