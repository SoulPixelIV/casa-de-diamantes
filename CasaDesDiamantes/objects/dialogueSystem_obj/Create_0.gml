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
scene18High = 111;
scene19Low = 112;
scene19High = 136;

//Dialogue Text
//!!!ALWAYS 1 FREE SPACE BETWEEN SCENES
// # = Steph
// @ = 
// $ = Cindy
// * = Cindy2
// § = Cindy3
// > = Komo
// ; = Tristram
// _ = Komo+Tristram
// } = Steph+Cindy
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
scene18BlackTimer = 300;
startScene18Timer = false;
scene18Timer = 11600;
scene18TimerSave = scene18Timer;

dialogue[95] = "_Steph!";
dialogue[96] = "#Guys! So happy to see you again! How was singapore?";
dialogue[97] = ";Oh we left for indonesia pretty much a few days in because";
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
dialogue[111] = "";

//Scene 19 Dining Hall
startScene19BlackTimer = false;
scene19BlackTimer = 300;
startScene19Timer = false;
scene19Timer = 20000;
scene19TimerSave = scene19Timer;

dialogue[112] = "$Wow, that is some great duck! Props to the chef!";
dialogue[113] = "^Passing it on!";
dialogue[114] = "$But Steph, how long have you been eating meat again?";
dialogue[115] = "$I thought you can't handle that stuff.";
dialogue[116] = "#...";
dialogue[117] = "#I haven't really thought about it...";
dialogue[118] = "$No pressure, just wondering.";
dialogue[119] = "$I've always been ordering vegan with you for your sake.";
dialogue[120] = "$I take it that you don't mind me indulging like that?";
dialogue[121] = "#I guess I don't.";
dialogue[122] = ">I've always been weak but she never seemed to care.";
dialogue[123] = ">Where's the problem.";
dialogue[124] = ";Komo, you barely ever eat anything that isn't pure meat.";
dialogue[125] = ";It's hard for the average brain to even process...";
dialogue[126] = ";...that this is supposed to be food fit for human consumption.";
dialogue[127] = ";Let alone that it's made of real animals.";
dialogue[128] = ">Hey! You're not even making sense!";
dialogue[129] = "#You'll take any chance to pick on her for trivial things like that, eh?";
dialogue[130] = ";I'm just a poor and innocent little court jester, pay me no mind.";
dialogue[131] = "$Ehem. Well, Komo, there's an unwritten contract between Steph and me.";
dialogue[132] = "$I'm just surprised she broke it first, considering she... unwrote it.";
dialogue[133] = ">*chomp* ...a contract? And you left me out of it?!";
dialogue[134] = "$We hoped to keep it's integrity for longer than three days.";
dialogue[135] = "_...fair";
dialogue[136] = "";
