inCutscene = false;

//Scenes
scene1 = false;
scene2 = false;
scene3 = false;
scene4 = false;
scene5 = false;

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

//Dialogue Text
//!!!ALWAYS 1 FREE SPACE BETWEEN SCENES
// # = Steph
// @ = 
// $ = Cindy
// % = Cutie-Plus
// ] = Bartender
// [ = Bunnygirl
// ^ = VIP
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

//Scene 4
startScene4Timer = false;
scene4Timer = 8200;
scene4TimerSave = scene4Timer;

dialogue[20] = "$Steph I have a present for you.";
dialogue[21] = "$I developed a mechanism which allows..";
dialogue[22] = "$..the user to endure more damage.";
dialogue[23] = "$It uses these syringes to revive you..";
dialogue[24] = "$..when you are in critical condition.";
dialogue[25] = "$But that's not all!";
dialogue[26] = "$I also worked on a prototype companion!";
dialogue[27] = "$See for yourself..";
dialogue[28] = ""; 

//Scene 5 VIP First Mission
dialogue[29] = "^Evening.";
dialogue[30] = "#I'm looking for a contract.";
dialogue[31] = "^Well, let's get to business then.";
dialogue[32] = "^I need you to eliminate a target for me.";
dialogue[33] = "^No talking. No evidences. No mistakes.";
dialogue[34] = "#What's the pay?";
dialogue[35] = "^2000 chips upfront, 6000 on completion.";
dialogue[36] = "#Sounds like a deal to me.";
dialogue[37] = "^The target is located somewhere deep in the Senzela Forest.";
dialogue[38] = "^He is also armed so prepare yourself.";
dialogue[39] = "#Alright.";
dialogue[40] = "^Now get going.";
dialogue[41] = "";