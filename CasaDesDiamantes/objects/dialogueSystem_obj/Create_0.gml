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
scene5High = 41;
scene6Low = 42;
scene6High = 44;
scene7Low = 45;
scene7High = 46;
scene8Low = 47;
scene8High = 52;
scene9Low = 53;
scene9High = 60;
scene10Low = 61;
scene10High = 69;

//Dialogue Text
//!!!ALWAYS 1 FREE SPACE BETWEEN SCENES
// # = Steph
// @ = 
// $ = Cindy
// * = Cindy2
// % = Cutie-Plus
// ] = Bartender
// [ = Bunnygirl
// ^ = VIP
// <= VIP2
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
scene4Timer = 6200;
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
scene5Timer = 8200;
scene5TimerSave = scene5Timer;

dialogue[29] = "^Evening.";
dialogue[30] = "#I'm looking for a contract.";
dialogue[31] = "^Well, let's get to business then.";
dialogue[32] = "^I need you to eliminate a target for me.";
dialogue[33] = "^A plant creature to be quite specific.";
dialogue[34] = "#What's the pay?";
dialogue[35] = "^2000 chips upfront, 6000 on completion.";
dialogue[36] = "#Sounds like a deal to me.";
dialogue[37] = "^The target is located in the Senzela Forest.";
dialogue[38] = "^Oh and do not inhale its fumes..";
dialogue[39] = "#Alright.";
dialogue[40] = "^Now get going.";
dialogue[41] = "";

//Scene 6 Cindy Upgrade Menu
startScene6Timer = false;
scene6Timer = 900;
scene6TimerSave = scene6Timer;

dialogue[42] = "*Please take a look..";
dialogue[43] = "W2";
dialogue[44] = "";

//Scene 7 VIP During Mission Talk
startScene7Timer = false;
scene7Timer = 450;
scene7TimerSave = scene7Timer;

dialogue[45] = "^...";
dialogue[46] = "";

//Scene 8 First Time Entering Casino
startScene8Timer = false;
scene8Timer = 4340;
scene8TimerSave = scene8Timer;
startScene8BlackTimer = false;
scene8BlackTimer = 300;
scene8BlackTimerSave = scene8Timer;

dialogue[47] = "<Welcome to my jewel, the Casa De Diamantes, stranger!";
dialogue[48] = "<Where strangers become friends and friends become strangers!";
dialogue[49] = "<Please, enjoy your stay.";
dialogue[50] = "<You're a pretty heavy sleeper, huh?";
dialogue[51] = "<Girl's managed to empty 6 clips until you finally woke up.";
dialogue[52] = "";

//Scene 9 First Time Entering Casino
startScene9Timer = false;
scene9Timer = 4700;
scene9TimerSave = scene9Timer;
startScene9BlackTimer = false;
scene9BlackTimer = 500;
scene9BlackTimerSave = scene9Timer;

dialogue[53] = "$They're magazines, not clips.";
dialogue[54] = "<...";
dialogue[55] = "<I'm glad you made it here alive!";
dialogue[56] = "<I'm also getting a call right now..";
dialogue[57] = "<Meet me in my office on the second floor when you get the chance.";
dialogue[58] = "<For now, enjoy our games and entertainment!";
dialogue[59] = "<See ya.";
dialogue[60] = "";

//Scene 10 First Time Entering Casino
startScene10Timer = false;
scene10Timer = 6000;
scene10TimerSave = scene10Timer;
startScene10BlackTimer = false;
scene10BlackTimer = 400;
scene10BlackTimerSave = scene10Timer;

dialogue[61] = "$Steph!!";
dialogue[62] = "#Cindy!!";
dialogue[63] = "$I'm so glad you're finally here! Are you well? Was the trip okay?";
dialogue[64] = "$I set up a room here already, come on you gotta get some rest.";
dialogue[65] = "$We got a lot of work before us.";
dialogue[66] = "#I won't answer questions you don't even remember asking..";
dialogue[67] = "#..but sure, lead the way!";
dialogue[68] = "$Come on, you'll love what i did to the place!";
dialogue[69] = "";