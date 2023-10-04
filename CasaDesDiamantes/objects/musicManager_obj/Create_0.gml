act1MusicOn = false;
act1MusicStarted = false;

act2MusicOn = false;
act2MusicStarted = false;

act3MusicOn = false;
act3MusicStarted = false;

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

// Low-pass route
usedFilter = false;
musicEmitter = audio_emitter_create();
musicBus = audio_bus_create();

audio_emitter_bus(musicEmitter, musicBus);

// Low-pass effect
_lp_effect = audio_effect_create(AudioEffectType.LPF2);
_lp_effect.cutoff = 200;