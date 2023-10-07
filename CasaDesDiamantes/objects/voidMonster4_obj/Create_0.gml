movspeed = 0;
movspeedMax = -0.51;

voidEmitter = part_emitter_create(global.partSystem);

part_emitter_stream(global.partSystem, voidEmitter, global.voidPart, 1);

eyesEmitter = part_emitter_create(global.partSystem);

part_emitter_stream(global.partSystem, eyesEmitter, global.eyesPart, -30);


