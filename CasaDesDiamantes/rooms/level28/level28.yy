{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "level28",
  "creationCodeFile": "${project_dir}/rooms/level28/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_2A8B1492_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_56F2E88E_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_7A49DBDB_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_C112630_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_1239231A_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_339DA1F3_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_44D25701_1_1_1","path":"rooms/level28/level28.yy",},
    {"name":"inst_5D0C2748","path":"rooms/level28/level28.yy",},
    {"name":"inst_FB1A218","path":"rooms/level28/level28.yy",},
    {"name":"inst_528A3115","path":"rooms/level28/level28.yy",},
    {"name":"inst_7BB02BBA","path":"rooms/level28/level28.yy",},
    {"name":"inst_64931D18","path":"rooms/level28/level28.yy",},
    {"name":"inst_3E7770ED","path":"rooms/level28/level28.yy",},
    {"name":"inst_73778F43","path":"rooms/level28/level28.yy",},
    {"name":"inst_437F7C58","path":"rooms/level28/level28.yy",},
    {"name":"inst_7C2D3925","path":"rooms/level28/level28.yy",},
    {"name":"inst_3919D42D","path":"rooms/level28/level28.yy",},
    {"name":"inst_7FCC36B3","path":"rooms/level28/level28.yy",},
    {"name":"inst_6EC1FBF8","path":"rooms/level28/level28.yy",},
    {"name":"inst_78B6B439","path":"rooms/level28/level28.yy",},
    {"name":"inst_F120D17","path":"rooms/level28/level28.yy",},
    {"name":"inst_7EEB9628","path":"rooms/level28/level28.yy",},
    {"name":"inst_4B400A9D","path":"rooms/level28/level28.yy",},
    {"name":"inst_70285BFC","path":"rooms/level28/level28.yy",},
    {"name":"inst_747649E","path":"rooms/level28/level28.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Music","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_FB1A218","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"musicBoxBattle_obj","path":"objects/musicBoxBattle_obj/musicBoxBattle_obj.yy",},"properties":[],"rotation":0.0,"scaleX":45.5,"scaleY":31.0,"x":32.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Camera","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_339DA1F3_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"camera_obj","path":"objects/camera_obj/camera_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Particles","depth":200,"effectEnabled":true,"effectType":"_filter_large_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_44D25701_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"particleRadiationStillSpawner_obj","path":"objects/particleRadiationStillSpawner_obj/particleRadiationStillSpawner_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":192.0,"y":96.0,},
      ],"layers":[],"properties":[
        {"name":"g_Radius","type":0,"value":"0.5",},
        {"name":"g_NoiseTexture","type":2,"value":"_filter_large_blur_noise",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GameManagerLayer","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2A8B1492_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"particleSystem_obj","path":"objects/particleSystem_obj/particleSystem_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_56F2E88E_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_light_renderer","path":"objects/obj_light_renderer/obj_light_renderer.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7A49DBDB_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"dialogueSystem_obj","path":"objects/dialogueSystem_obj/dialogueSystem_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_747649E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"lightningSpawner_obj","path":"objects/lightningSpawner_obj/lightningSpawner_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":256.0,"y":32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"RedFilter","depth":400,"effectEnabled":true,"effectType":"_filter_colourise","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_Intensity","type":0,"value":"0.3",},
        {"name":"g_TintCol","type":1,"value":"#FF0000FF",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"DrunkFilter1","depth":500,"effectEnabled":true,"effectType":"_filter_heathaze","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_Distort1Speed","type":0,"value":"0.01",},
        {"name":"g_Distort2Speed","type":0,"value":"0.025",},
        {"name":"g_Distort1Scale","type":0,"value":"13.3",},
        {"name":"g_Distort1Scale","type":0,"value":"1.3",},
        {"name":"g_Distort2Scale","type":0,"value":"33.3",},
        {"name":"g_Distort2Scale","type":0,"value":"3.3",},
        {"name":"g_Distort1Amount","type":0,"value":"0",},
        {"name":"g_Distort2Amount","type":0,"value":"0",},
        {"name":"g_ChromaSpreadAmount","type":0,"value":"0.25",},
        {"name":"g_CamOffsetScale","type":0,"value":"1",},
        {"name":"g_DistortTexture","type":2,"value":"_filter_heathaze_noise_sprite",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"DrunkFilter2","depth":600,"effectEnabled":true,"effectType":"_filter_twist_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurIntensity","type":0,"value":"0",},
        {"name":"g_TwistBlurTexture","type":2,"value":"_filter_twist_blur_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GraphicsLayer","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_528A3115","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightYellow_obj","path":"objects/spotlightYellow_obj/spotlightYellow_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1376.0,"y":1088.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7BB02BBA","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightYellow_obj","path":"objects/spotlightYellow_obj/spotlightYellow_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1545.0,"y":1069.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_64931D18","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightYellow_obj","path":"objects/spotlightYellow_obj/spotlightYellow_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1687.0,"y":1107.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"TileCollider","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"FakeTiles","depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"FakeTilesOn","depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_C112630_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"fakeTileDisable_obj","path":"objects/fakeTileDisable_obj/fakeTileDisable_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":32.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"FakeVoidBackground","depth":1100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"voidBackground","path":"tilesets/voidBackground/voidBackground.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"FakeTilesOff","depth":1200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1239231A_1_1_1_1_1_2_2_2_1_1_1_1_1_1_1_1_1_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"fakeTileEnable_obj","path":"objects/fakeTileEnable_obj/fakeTileEnable_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
      ],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"VoidForeground","depth":1300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"voidBackground","path":"tilesets/voidBackground/voidBackground.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"ForegroundObjects","depth":1400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":1500,"effectEnabled":true,"effectType":"none","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5D0C2748","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"Spawn1_obj","path":"objects/Spawn1_obj/Spawn1_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1551.0,"y":1103.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3E7770ED","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"komo8_obj","path":"objects/komo8_obj/komo8_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1424.0,"y":1155.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_73778F43","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"tristram7_obj","path":"objects/tristram7_obj/tristram7_obj.yy",},"properties":[],"rotation":0.0,"scaleX":-1.0,"scaleY":1.0,"x":1717.0,"y":1162.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_437F7C58","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"cindy8_obj","path":"objects/cindy8_obj/cindy8_obj.yy",},"properties":[],"rotation":0.0,"scaleX":-1.0,"scaleY":1.0,"x":1676.0,"y":1168.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3919D42D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"stephFinalScene_obj","path":"objects/stephFinalScene_obj/stephFinalScene_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1502.0,"y":1139.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"MidgroundObjects","depth":1600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles","depth":1700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"caveTilesOld","path":"tilesets/caveTilesOld/caveTilesOld.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"VoidBackground","depth":1800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"voidBackground","path":"tilesets/voidBackground/voidBackground.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects","depth":1900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7C2D3925","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"consumedPlantFloor_obj","path":"objects/consumedPlantFloor_obj/consumedPlantFloor_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1551.0,"y":1216.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CasinoTiles","depth":2000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"casinoTiles","path":"tilesets/casinoTiles/casinoTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"StratoMainTiles","depth":2100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"stratoterminalTiles","path":"tilesets/stratoterminalTiles/stratoterminalTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"SewerTiles","depth":2200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"sewerTiles","path":"tilesets/sewerTiles/sewerTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundAssets","depth":2300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"DesaturationFilter3","depth":2400,"effectEnabled":true,"effectType":"_filter_greyscale","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_Intensity","type":0,"value":"0.3",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects2","depth":2500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6EC1FBF8","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"hexagonWindows_obj","path":"objects/hexagonWindows_obj/hexagonWindows_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1555.0,"y":1216.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects3","depth":2600,"effectEnabled":true,"effectType":"none","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects4","depth":2700,"effectEnabled":true,"effectType":"none","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_70285BFC","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"backgroundCasino_obj","path":"objects/backgroundCasino_obj/backgroundCasino_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1564.0,"y":1108.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects5","depth":2800,"effectEnabled":true,"effectType":"_filter_large_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_78B6B439","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"backgroundBuildings_obj","path":"objects/backgroundBuildings_obj/backgroundBuildings_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1408.0,"y":1088.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_F120D17","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"backgroundBuildings_obj","path":"objects/backgroundBuildings_obj/backgroundBuildings_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1428.0,"y":1088.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7EEB9628","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"backgroundBuildings_obj","path":"objects/backgroundBuildings_obj/backgroundBuildings_obj.yy",},"properties":[],"rotation":0.0,"scaleX":-1.0,"scaleY":1.0,"x":1698.0,"y":1088.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4B400A9D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"backgroundBuildings_obj","path":"objects/backgroundBuildings_obj/backgroundBuildings_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1792.0,"y":1088.0,},
      ],"layers":[],"properties":[
        {"name":"g_Radius","type":0,"value":"0.8",},
        {"name":"g_NoiseTexture","type":2,"value":"_filter_large_blur_noise",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CasinoTilesBackground","depth":2900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-464,-2147483648,-6,0,-88,-2147483648,-6,0,-71,-2147483648,-23,0,-57,-2147483648,-37,0,-57,-2147483648,-37,0,-57,-2147483648,-37,0,-44,-2147483648,-50,0,-33,-2147483648,-61,0,-33,-2147483648,-61,0,-20,-2147483648,-74,0,-20,-2147483648,-74,0,-20,-2147483648,-74,0,-5,-2147483648,-89,0,-5,-2147483648,-89,0,-5,-2147483648,-4225,0,],"TileDataFormat":1,},"tilesetId":{"name":"casinoTiles","path":"tilesets/casinoTiles/casinoTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"SewerBackgroundTiles","depth":3000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"sewerTiles","path":"tilesets/sewerTiles/sewerTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"PowerplantMainBackgroundTiles","depth":3100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"powerplantBackgroundTiles","path":"tilesets/powerplantBackgroundTiles/powerplantBackgroundTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"EDENPowerplantTiles","depth":3200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":63,"SerialiseWidth":94,"TileCompressedData":[
-5922,0,],"TileDataFormat":1,},"tilesetId":{"name":"EDENPowerplant","path":"tilesets/EDENPowerplant/EDENPowerplant.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"DesaturationFilter2","depth":3300,"effectEnabled":true,"effectType":"_filter_greyscale","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_Intensity","type":0,"value":"0.3",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Lightning","depth":3400,"effectEnabled":true,"effectType":"_filter_large_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[
        {"name":"g_Radius","type":0,"value":"0.8",},
        {"name":"g_NoiseTexture","type":2,"value":"_filter_large_blur_noise",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Background","depth":3500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Background2","depth":3600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7FCC36B3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"senzelaBackground_obj","path":"objects/senzelaBackground_obj/senzelaBackground_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1184.0,"y":928.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
  ],
  "parent": {
    "name": "ACT 6 (Mothers Womb)",
    "path": "folders/Levels/Main/ACT 6 (Mothers Womb).yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 0.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 2000,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 3000,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":720,"hspeed":1,"hview":270,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":1,"wport":1280,"wview":480,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}