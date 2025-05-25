act1MusicOn = false;
act1MusicStarted = false;

act2MusicOn = false;
act2MusicStarted = false;

act3MusicOn = false;
act3MusicStarted = false;

act4MusicOn = false;
act4MusicStarted = false;

act5MusicOn = false;
act5MusicStarted = false;

act6MusicOn = false;
act6MusicStarted = false;

casinoTheme = casinoTheme_msc;
casinoThemeLowPass = casinoThemeLowpass_msc;

dressedToKillL1 = dressedToKillL1_msc;
dressedToKillL2 = dressedToKillL2_msc;
dressedToKillL3 = dressedToKillL3_msc;
dressedToKillSTEM = dressedToKillSTEM_msc

birchL1 = birchL1_msc;
birchL2 = birchL2_msc;
birchL3 = birchL3_msc;

caveAmbience1 = caveAmbience1_amb;
caveAmbience2 = caveAmbience2_amb;
caveAmbience3 = caveAmbience3_amb;
caveAmbience4 = caveAmbience4_amb;

nuclidesL1 = nuclidesL1_msc;
nuclidesL2 = nuclidesL2_msc;
nuclidesL3 = nuclidesL3_msc;

feastL1 = feastL1_msc;
feastL2 = feastL2_msc;

sliceL1 = sliceL1_msc;
sliceL2 = sliceL2_msc;
sliceL3 = sliceL3_msc;
sliceL4 = sliceL4_msc;

faceL1 = faceL1_msc;
consumedL1 = consumed_msc;

// Low-pass route
usedFilter = false;
musicEmitter = audio_emitter_create();
musicBus = audio_bus_create();

audio_emitter_bus(musicEmitter, musicBus);

// Low-pass effect
_lp_effect = audio_effect_create(AudioEffectType.LPF2);
_lp_effect.cutoff = 200;