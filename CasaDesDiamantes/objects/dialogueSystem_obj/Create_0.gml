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
dialogue[60] = "<Meet me in my office on the second floor when you get the chance.";
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