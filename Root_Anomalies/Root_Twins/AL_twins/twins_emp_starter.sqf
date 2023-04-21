// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

params ["_spark_move", "_isseisore", "_tracking_p"];
private ["_hndl", "_range_lit", "_brit", "_light_emp", "_ripple", "_blast", "_bangsound", "_isseisore", "_spark_move", "_vehicle", "_vichitpoints", "_tracking_p", "_AOE"];


_AOE = _tracking_p;

_bangsound= "#particlesource" createVehicleLocal getposatl _spark_move;
_bangsound say3d ["earthquake_02",3500];



_blast = "#particlesource" createVehicleLocal getposatl _spark_move;
_blast setParticleCircle [0, [0, 0, 0]];
_blast setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_blast setParticleParams [["\A3\data_f\koule", 1, 0, 1], "", "SpaceObject", 1,0.5,[0,0,0],[0,0,1],3,10,7.9,0,[0,225],[[0.1, 0.1, 0.1, 0.1], [0.1,0.1, 0.1, 0]], [1], 1, 0, "", "", _spark_move];
_blast setDropInterval 50;

_ripple = "#particlesource" createVehicleLocal getposatl _spark_move;
_ripple setParticleCircle [0,[0,0,0]];
_ripple setParticleRandom [0,[0.25,0.25,0],[0.175,0.175,0],0,0.25,[0,0,0,0.1],0,0];
//_ripple setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0],0,10,7.9,0, [30,1000,1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _obj_emp];
_ripple setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0],0,10,7.9,0, [5,0,250,500], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.05], 1, 0, "", "", _spark_move];
_ripple setDropInterval 0.25;

_light_emp = "#lightpoint" createVehiclelocal getposatl _spark_move; 
_light_emp lightAttachObject [_spark_move, [0,0,3]];
_light_emp setLightAmbient [0.1,0.1,1];  
_light_emp setLightColor [0.1,0.1,1];
_light_emp setLightBrightness 10;
_light_emp setLightUseFlare true; _light_emp setLightFlareSize 10; _light_emp setLightFlareMaxDistance 2000;
_light_emp setLightDayLight true;
_light_emp setLightAttenuation [10,10,50,0,50,2000];

sleep 0.1;
if !(_isseisore) then 
{
	_hndl = ppEffectCreate ["ColorInversion", 1501]; 
	_hndl ppEffectEnable true; 
	_hndl ppEffectAdjust [0.75,0.75,0.75];
	_hndl ppEffectCommit 0.5;

	sleep 0.5;

	_hndl = ppEffectCreate ["ColorInversion", 1501]; 
	_hndl ppEffectEnable true; 
	_hndl ppEffectAdjust [0,0,0];
	_hndl ppEffectCommit 1.5;


	_range_lit=0;
	_brit =0;

	while {_brit < 100} do 
	{
		_light_emp setLightBrightness _brit;
		_brit = _brit+2;
		sleep 0.01;
	};
};

sleep 0.5;
deleteVehicle _blast;

deleteVehicle _light_emp;
deleteVehicle _ripple;


/*
_vehicle = _x;
_vichitpoints = getAllHitPointsDamage _vehicle; _vichitpoints = _vichitpoints select 0;
{
	_vehicle setHitPointDamage [_x, 1];
} foreach _vichitpoints;
*/
{
_x setHitPointDamage ["hitturret",1]; 
_x setHitPointDamage ["hitcomturret",1]; 
_x setHitPointDamage ["hitcomgun",1];
_x setHitPointDamage ["HitBatteries",1]; 
_x setHitPointDamage ["HitLight",1]; 
_x setHitPointDamage ["#light_l",1];
_x setHitPointDamage ["#light_r",1];
_x setHitPointDamage ["#light_l_flare",1];
_x setHitPointDamage ["#light_r_flare",1];
_x setHitPointDamage ["light_l",1]; 
_x setHitPointDamage ["light_r",1]; 
_x setHitPointDamage ["light_l2",1]; 
_x setHitPointDamage ["light_r2",1]; 
_x setHitPointDamage ["hitEngine",1]; 
_x setHitPointDamage ["HitEngine2",1]; 
_x setHitPointDamage ["HitAvionics",1];
_x disableTIEquipment true; 
_x disableNVGEquipment true;
_x setVariable ["A3TI_Disable", true];
_x disableAI "LIGHTS"; 
_x setPilotLight false;  
_x setCollisionLight false;
} forEach (nearestObjects [_spark_move, [
"Car",
"Motorcycle",
"UAV",
"Tank",
"Air",
"Ship",
"Autonomous",
"Armored",
"B_static_AA_F", 
"B_static_AT_F",
"B_T_Static_AA_F",
"B_T_Static_AT_F",
"B_T_GMG_01_F",
"B_T_HMG_01_F",
"B_T_Mortar_01_F",
"B_HMG_01_high_F",
"B_HMG_01_A_F",
"B_GMG_01_F",
"B_GMG_01_high_F",
"B_GMG_01_A_F",
"B_Mortar_01_F",
"B_G_Mortar_01_F",
"B_Static_Designator_01_F",
"B_AAA_System_01_F",
"B_SAM_System_01_F",
"B_SAM_System_02_F",
"O_HMG_01_F",
"O_HMG_01_high_F",
"O_HMG_01_A_F",
"O_GMG_01_F",
"O_GMG_01_high_F",
"O_GMG_01_A_F",
"O_Mortar_01_F",
"O_G_Mortar_01_F",
"O_static_AA_F",
"O_static_AT_F",
"O_Static_Designator_02_F",
"I_HMG_01_F",
"I_HMG_01_high_F",
"I_HMG_01_A_F",
"I_GMG_01_F",
"I_GMG_01_high_F",
"I_GMG_01_A_F",
"I_Mortar_01_F",
"I_G_Mortar_01_F",
"I_static_AA_F",
"I_static_AT_F"
], _AOE]); 



{
_spark_sound = ["spark1","spark11","spark2","spark22"] call BIS_fnc_selectRandom;
_x say3D _spark_sound;
_e_static = "#particlesource" createVehicleLocal (getPosATL _x);
_e_static setParticleFire [0.5,3,60];
_e_static setParticleCircle [1.5, [0, 0, 0]];
_e_static setParticleRandom [0.2, [3.5,3.5,0], [0.175, 0.175, 0], 0, 0.2, [0, 0, 0, 1], 1, 0];
_e_static setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.05, [0, 0, 0], [0, 0, 0], 0, 10, 7.9,0, [0.003, 0.003], [[1, 1, 0.1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _x];
_e_static setDropInterval 0.025;
sleep 0.5;
deleteVehicle _e_static;
} forEach (nearestObjects [_spark_move, [
"Car",
"Motorcycle",
"UAV",
"Tank",
"Air",
"Ship",
"Autonomous",
"Armored",
"B_static_AA_F", 
"B_static_AT_F",
"B_T_Static_AA_F",
"B_T_Static_AT_F",
"B_T_GMG_01_F",
"B_T_HMG_01_F",
"B_T_Mortar_01_F",
"B_HMG_01_high_F",
"B_HMG_01_A_F",
"B_GMG_01_F",
"B_GMG_01_high_F",
"B_GMG_01_A_F",
"B_Mortar_01_F",
"B_G_Mortar_01_F",
"B_Static_Designator_01_F",
"B_AAA_System_01_F",
"B_SAM_System_01_F",
"B_SAM_System_02_F",
"O_HMG_01_F",
"O_HMG_01_high_F",
"O_HMG_01_A_F",
"O_GMG_01_F",
"O_GMG_01_high_F",
"O_GMG_01_A_F",
"O_Mortar_01_F",
"O_G_Mortar_01_F",
"O_static_AA_F",
"O_static_AT_F",
"O_Static_Designator_02_F",
"I_HMG_01_F",
"I_HMG_01_high_F",
"I_HMG_01_A_F",
"I_GMG_01_F",
"I_GMG_01_high_F",
"I_GMG_01_A_F",
"I_Mortar_01_F",
"I_G_Mortar_01_F",
"I_static_AA_F",
"I_static_AT_F"
], _AOE]); 




{
_x setHit ["light_1_hitpoint", 0.97]; //all possible light hitpoints
_x setHit ["light_2_hitpoint", 0.97]; //no lights escape this
_x setHit ["light_3_hitpoint", 0.97];
_x setHit ["light_4_hitpoint", 0.97];
_bbr = boundingBoxReal vehicle _x;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

//_spark_poz_rel = [getPos _lamp select 0,getPos _lamp select 1,_maxHeight-0.5];
_spark_poz_rel = (_maxHeight/2)-0.45;

_spark_type = ["white","orange"] call BIS_fnc_selectRandom;
_spark_sound = ["spark1","spark11","spark2","spark22"] call BIS_fnc_selectRandom;
_drop = 0.001+(random 0.05);
_scantei_spark = "#particlesource" createVehicleLocal (getPosATL _x);

if (_spark_type=="orange") then 
{
	_scantei_spark setParticleCircle [0, [0, 0, 0]];
	_scantei_spark setParticleRandom [1, [0.1, 0.1, 0.1], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
	_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0,_spark_poz_rel], [0, 0, 0], 0, 15, 7.9, 0, [0.5,0.5,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _x,0,true,0.3,[[0,0,0,0]]];
	_scantei_spark setDropInterval _drop;
} else
{
	//hint "alb";
	_scantei_spark setParticleCircle [0, [0, 0, 0]];
	_scantei_spark setParticleRandom [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
	_scantei_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0,_spark_poz_rel], [0, 0, 0], 0, 20, 7.9, 0, [0.5,0.5,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _x,0,true,0.3,[[0,0,0,0]]];
	_scantei_spark setDropInterval 0.001;
};
_scantei_spark say3D _spark_sound;
sleep 0.4 + (random 0.7);
deleteVehicle _scantei_spark;
} forEach (nearestObjects [_spark_move, [
"Lamps_base_F", //These are all the lights' base classes
"PowerLines_base_F",
"PowerLines_Small_base_F"
], _AOE]);



_gear = [
	'itemcTab',
	'itemMicroDAGR',
	'itemAndroid',
	'ItemRadio',
	'I_E_UavTerminal',
	'I_UavTerminal',
	'O_UavTerminal',
	'B_UavTerminal',
	'C_UavTerminal',
	'ItemGPS',
	'TFAR_anprc148jem',
	'TFAR_anprc152',
	'TFAR_anprc154',
	'TFAR_fadak',
	'TFAR_pnr1000a',
	'TFAR_rf7800str'
];



_nvgsw = [
	'NVGoggles',
	'Integrated_NVG_F',
	'NVGoggles_tna_F',
	'O_NVGoggles_grn_F',
	'O_NVGoggles_ghex_F',
	'O_NVGoggles_urb_F',
	'O_NVGoggles_hex_F',
	'NVGoggles_INDEP',
	'NVGoggles_OPFOR',
	'NVGoggles_mas_aus_h',
	'NVGoggles_mas_aus_hv',
	'UK3CB_PVS5A',
	'UK3CB_ANPVS7',
	'rhsusf_ANPVS15',
	'rhsusf_ANPVS14',
	'rhs_1PN138',
	'Integrated_NVG_TI_1_F',
	'Integrated_NVG_TI_0_F',
	'NVGogglesB_blk_F',
	'NVGogglesB_grn_F',
	'NVGogglesB_gry_F',
	'JAS_GPNVG18_Full_Tan_TI',
	'JAS_GPNVG18_Full_blk_TI',
	'JAS_GPNVG18_Tan_TI',
	'JAS_GPNVG18_blk_TI',
	'JAS_GPNVG18_Tan',
	'NVGoggles_mas_aus_hr',
	'ACE_NVG_Gen4',
	'ACE_NVG_Wide',
	'ACE_NVG_Gen1',
	'ACE_NVG_Gen2',
	'CUP_NVG_HMNVS',
	'CUP_NVG_PVS14',
	'CUP_NVG_GPNVG_black',
	'CUP_NVG_GPNVG_tan',
	'CUP_NVG_GPNVG_green',
	'CUP_NVG_GPNVG_winter',
	'CUP_NVG_PVS15_black',
	'CUP_NVG_PVS15_tan',
	'CUP_NVG_PVS15_green',
	'CUP_NVG_PVS15_winter',
	'LM_OPCAN_CAM',
	'LM_OPCAN_CAMSNI',
	'LM_OPCAN_CAMUA',
	'LM_OPCAN_COMM',
	'LM_OPCAN_CAMUA2',
	'LM_OPCAN_COMMCAM',
	'LM_OPCAN_COMMCAMSNI',
	'LM_OPCAN_COMMCAMUA2',
	'LM_OPCAN_COMMCAMUA',
	'LM_OPCAN_COMMUA',
	'LM_OPCAN_COMSNI',
	'LM_OPCAN_COMMUA2',
	'LM_OPCAN_FLA',
	'LM_OPCAN_FLACAMSNI',
	'LM_OPCAN_FLACAM',
	'LM_OPCAN_FLACAMUA',
	'LM_OPCAN_FLACAMUA2',
	'LM_OPCAN_FLASNI',
	'LM_OPCAN_FLAUA',
	'LM_OPCAN_SNI',
	'LM_OPCAN_FLAUA2',
	'LM_OPCAN_UA2',
	'LM_OPCAN_UA',
	'A3_TVG_S_F',
	'A3_TVG_S_F_CNM',
	'A3_TVG_S_F_HUL',
	'A3_TVG_S_F_HURS_CNM',
	'A3_TVG_S_F_HURS',
	'A3_TVG_S_F_MVI',
	'A3_TVG_S_F_HURS_HUL',
	'A3_TVG_S_F_MVI_CNM',
	'A3_TVG_S_F_MVI_HUL',
	'A3_TVG_S_F_MVI_UL',
	'A3_TVG_S_F_MVI_UL_CNM',
	'A3_TVG_S_F_MVI_UL_HUL',
	'A3_TVG_S_F_UA',
	'A3_TVG_S_F_UA_HUL',
	'A3_TVG_S_F_UA_CNM',
	'A3_TVG_S_F_UA_HURS',
	'A3_TVG_S_F_UA_HURS_CNM',
	'A3_TVG_S_F_UA_HURS_HUL',
	'A3_TVG_S_F_UA_UL',
	'A3_TVG_S_F_UAB',
	'A3_TVG_S_F_UA_UL_CNM',
	'A3_TVG_S_F_UAB_CNM',
	'A3_TVG_S_F_UAB_HUL',
	'A3_TVG_S_F_UAB_UL',
	'A3_TVG_S_F_UAB_UL_CNM',
	'A3_TVG_S_F_UAB_UL_HUL',
	'A3_TVG_S_F_UL',
	'A3_TVG_S_F_UL_CNM',
	'A3_TVG_S_F2',
	'A3_TVG_S_F_UL_HUL',
	'A3_TVG_S_F2_CNM',
	'A3_TVG_S_F2_HUL',
	'A3_TVG_S_F2_HURS',
	'A3_TVG_S_F2_HURS_HUL',
	'A3_TVG_S_F2_MVI',
	'A3_TVG_S_F2_MVI_CNM',
	'A3_TVG_S_F2_HURS_CNM',
	'A3_TVG_S_F2_MVI_HUL',
	'A3_TVG_S_F2_MVI_UL',
	'A3_TVG_S_F2_MVI_UL_HUL',
	'A3_TVG_S_F2_UA',
	'A3_TVG_S_F2_MVI_UL_CNM',
	'A3_TVG_S_F2_UA_HUL',
	'A3_TVG_S_F2_UA_CNM',
	'A3_TVG_S_F2_UA_HURS_HUL',
	'A3_TVG_S_F2_UA_HURS',
	'A3_TVG_S_F2_UA_HURS_CNM',
	'A3_TVG_S_F2_UA_UL',
	'A3_TVG_S_F2_UA_UL_CNM',
	'A3_TVG_S_F2_UAB',
	'A3_TVG_S_F2_UAB_CNM',
	'A3_TVG_S_F2_UAB_HUL',
	'A3_TVG_S_F2_UAB_UL',
	'A3_TVG_S_F2_UAB_UL_CNM',
	'A3_TVG_S_F2_UAB_UL_HUL',
	'A3_TVG_S_F2_UL',
	'A3_TVG_S_F2_UL_HUL',
	'A3_TVG_S_F2_UL_CNM',
	'A3_TVG_S_F3',
	'A3_TVG_S_F3_CNM',
	'A3_TVG_S_F3_HUL',
	'A3_TVG_S_F3_HURS',
	'A3_TVG_S_F3_HURS_CNM',
	'A3_TVG_S_F3_HURS_HUL',
	'A3_TVG_S_F3_MVI',
	'A3_TVG_S_F3_MVI_CNM',
	'A3_TVG_S_F3_MVI_HUL',
	'A3_TVG_S_F3_MVI_UL',
	'A3_TVG_S_F3_MVI_UL_HUL',
	'A3_TVG_S_F3_MVI_UL_CNM',
	'A3_TVG_S_F3_UA_CNM',
	'A3_TVG_S_F3_UA',
	'A3_TVG_S_F3_UA_HUL',
	'A3_TVG_S_F3_UA_HURS',
	'A3_TVG_S_F3_UA_HURS_CNM',
	'A3_TVG_S_F3_UA_HURS_HUL',
	'A3_TVG_S_F3_UA_UL',
	'A3_TVG_S_F3_UA_UL_CNM',
	'A3_TVG_S_F3_UAB',
	'A3_TVG_S_F3_UAB_HUL',
	'A3_TVG_S_F3_UAB_CNM',
	'A3_TVG_S_F3_UAB_UL',
	'A3_TVG_S_F3_UAB_UL_HUL',
	'A3_TVG_S_F3_UAB_UL_CNM',
	'A3_TVG_S_F3_UL',
	'A3_TVG_S_F3_UL_HUL',
	'A3_TVG_S_F3_UL_CNM',
	'A3_TVG_S_F45',
	'A3_TVG_S_F45_CNM',
	'A3_TVG_S_F45_HUL',
	'A3_TVG_S_F45_HURS',
	'A3_TVG_S_F45_HURS_CNM',
	'A3_TVG_S_F45_HURS_HUL',
	'A3_TVG_S_F45_MVI_CNM',
	'A3_TVG_S_F45_MVI',
	'A3_TVG_S_F45_MVI_HUL',
	'A3_TVG_S_F45_MVI_UL_CNM',
	'A3_TVG_S_F45_MVI_UL',
	'A3_TVG_S_F45_MVI_UL_HUL',
	'A3_TVG_S_F45_UA',
	'A3_TVG_S_F45_UA_CNM',
	'A3_TVG_S_F45_UA_HUL',
	'A3_TVG_S_F45_UA_HURS',
	'A3_TVG_S_F45_UA_HURS_CNM',
	'A3_TVG_S_F45_UA_HURS_HUL',
	'A3_TVG_S_F45_UA_UL',
	'A3_TVG_S_F45_UA_UL_CNM',
	'A3_TVG_S_F45_UAB',
	'A3_TVG_S_F45_UAB_CNM',
	'A3_TVG_S_F45_UAB_HUL',
	'A3_TVG_S_F45_UAB_UL',
	'A3_TVG_S_F45_UAB_UL_CNM',
	'A3_TVG_S_F45_UAB_UL_HUL',
	'A3_TVG_S_F45_UL_CNM',
	'A3_TVG_S_F45_UL',
	'A3_TVG_S_F45_UL_HUL',
	'A3_TVG_S_F6',
	'A3_TVG_S_F6_CNM',
	'A3_TVG_S_F6_HUL',
	'A3_TVG_S_F6_HURS_CNM',
	'A3_TVG_S_F6_HURS',
	'A3_TVG_S_F6_MVI',
	'A3_TVG_S_F6_HURS_HUL',
	'A3_TVG_S_F6_MVI_CNM',
	'A3_TVG_S_F6_MVI_HUL',
	'A3_TVG_S_F6_MVI_UL',
	'A3_TVG_S_F6_MVI_UL_CNM',
	'A3_TVG_S_F6_MVI_UL_HUL',
	'A3_TVG_S_F6_UA',
	'A3_TVG_S_F6_UA_CNM',
	'A3_TVG_S_F6_UA_HUL',
	'A3_TVG_S_F6_UA_HURS_HUL',
	'A3_TVG_S_F6_UA_HURS_CNM',
	'A3_TVG_S_F6_UA_HURS',
	'A3_TVG_S_F6_UA_UL',
	'A3_TVG_S_F6_UAB',
	'A3_TVG_S_F6_UA_UL_CNM',
	'A3_TVG_S_F6_UAB_CNM',
	'A3_TVG_S_F6_UAB_HUL',
	'A3_TVG_S_F6_UAB_UL',
	'A3_TVG_S_F6_UAB_UL_CNM',
	'A3_TVG_S_F6_UAB_UL_HUL',
	'A3_TVG_S_F6_UL',
	'A3_TVG_S_F6_UL_CNM',
	'A3_TVG_S_F7',
	'A3_TVG_S_F6_UL_HUL',
	'A3_TVG_S_F7_HUL',
	'A3_TVG_S_F7_CNM',
	'A3_TVG_S_F7_HURS',
	'A3_TVG_S_F7_HURS_CNM',
	'A3_TVG_S_F7_HURS_HUL',
	'A3_TVG_S_F7_MVI',
	'A3_TVG_S_F7_MVI_CNM',
	'A3_TVG_S_F7_MVI_UL',
	'A3_TVG_S_F7_MVI_HUL',
	'A3_TVG_S_F7_MVI_UL_CNM',
	'A3_TVG_S_F7_MVI_UL_HUL',
	'A3_TVG_S_F7_UA',
	'A3_TVG_S_F7_UA_HUL',
	'A3_TVG_S_F7_UA_CNM',
	'A3_TVG_S_F7_UA_HURS',
	'A3_TVG_S_F7_UA_HURS_CNM',
	'A3_TVG_S_F7_UA_UL',
	'A3_TVG_S_F7_UA_HURS_HUL',
	'A3_TVG_S_F7_UA_UL_CNM',
	'A3_TVG_S_F7_UAB',
	'A3_TVG_S_F7_UAB_CNM',
	'A3_TVG_S_F7_UAB_HUL',
	'A3_TVG_S_F7_UAB_UL_CNM',
	'A3_TVG_S_F7_UAB_UL',
	'A3_TVG_S_F7_UAB_UL_HUL',
	'A3_TVG_S_F7_UL',
	'A3_TVG_S_F7_UL_CNM',
	'A3_TVG_S_F7_UL_HUL',
	'A3_TVG_S_F8',
	'A3_TVG_S_F8_CNM',
	'A3_TVG_S_F8_HUL',
	'A3_TVG_S_F8_HURS_CNM',
	'A3_TVG_S_F8_HURS',
	'A3_TVG_S_F8_HURS_HUL',
	'A3_TVG_S_F8_MVI',
	'A3_TVG_S_F8_MVI_CNM',
	'A3_TVG_S_F8_MVI_UL_CNM',
	'A3_TVG_S_F8_MVI_UL',
	'A3_TVG_S_F8_MVI_HUL',
	'A3_TVG_S_F8_MVI_UL_HUL',
	'A3_TVG_S_F8_UA',
	'A3_TVG_S_F8_UA_CNM',
	'A3_TVG_S_F8_UA_HUL',
	'A3_TVG_S_F8_UA_HURS',
	'A3_TVG_S_F8_UA_HURS_CNM',
	'A3_TVG_S_F8_UA_HURS_HUL',
	'A3_TVG_S_F8_UA_UL',
	'A3_TVG_S_F8_UAB',
	'A3_TVG_S_F8_UA_UL_CNM',
	'A3_TVG_S_F8_UAB_CNM',
	'A3_TVG_S_F8_UAB_UL',
	'A3_TVG_S_F8_UAB_UL_CNM',
	'A3_TVG_S_F8_UAB_HUL',
	'A3_TVG_S_F8_UAB_UL_HUL',
	'A3_TVG_S_F8_UL',
	'A3_TVG_S_F8_UL_CNM',
	'A3_TVG_S_F8_UL_HUL',
	'OPCOS_NV_C',
	'OPCOS_NV_CM',
	'OPCOS_NV_A',
	'OPCOS_NV_AC',
	'OPCOS_NV_ACM',
	'OPCOS_NV_AM',
	'OPTRE_NVG',
	'OPCOS_NV_M',
	'OPTRE_FC_NVG',
	'VES_NVG_CNM',
	'VES_NVG_UL',
	'VES_NVG_HUL',
	'VES_NVG_HURS',
	'VES_NVG_HURS_CNM',
	'VES_NVG_HURS_HUL',
	'VES_NVG_MVI',
	'VES_NVG_MVI_HUL',
	'VES_NVG_MVI_UL_CNM',
	'VES_NVG_MVI_UL',
	'VES_NVG_MVI_CNM',
	'VES_NVG_MVI_UL_HUL',
	'VES_NVG_UA_CNM',
	'VES_NVG_UA_HUL',
	'VES_NVG_UA_HURS',
	'VES_NVG_UA_HURS_CNM',
	'VES_NVG_UA_HURS_HUL',
	'VES_NVG_UA_UL',
	'VES_NVG_UA_UL_CNM',
	'VES_NVG_UAB_CNM',
	'VES_NVG_UAB_HUL',
	'VES_NVG_UAB_UL',
	'VES_NVG_UAB_UL_CNM',
	'VES_NVG_UAB_UL_HUL',
	'VES_NVG_UL_CNM',
	'VES_NVG_UL_HUL',
	'VES_NVG_Collar',
	'VES_NVG_UA',
	'VES_NVG_UAB',
	'VES_NVG_Collar_VAC'																									
];

_binos = [
	'Rangefinder',
	'Laserdesignator',
	'Laserdesignator_02_ghex_F',
	'Laserdesignator_02',
	'Laserdesignator_01_khk_F',
	'Laserdesignator_03',
	'rhsusf_bino_lerca_1200_black',
	'rhsusf_bino_lerca_1200_tan',
	'rhs_pdu4',
	'ACE_Vector',
	'ACE_VectorDay',
	'ACE_Yardage450',
	'ACE_MX2A',
	'CUP_Vector21Nite',
	'CUP_SOFLAM',
	'CUP_LRTV',
	'CUP_Binocular_Vector',
	'CUP_Laserdesignator',
	'CUP_LRTV_ACR',
	'OPTRE_Binoculars',
	'OPTRE_Smartfinder'		
];




{							
	if(alive _x) then {
				
		_itemsUnit = assignedItems _x;
		_commonItemsArray = ((_nvgsw + _binos + _gear) arrayIntersect _itemsUnit);
		_nvg = _commonItemsArray select 0;
		if(!isNil '_nvg') then {
			_x unassignItem _nvg;
			_x removeItem _nvg;
			_x removeWeapon _nvg;
		};
	};
} forEach (nearestObjects [_spark_move, ["CAManBase"], _AOE]); 

sleep 0.5;
{							
	if(alive _x) then {
				
		_itemsUnit = assignedItems _x;
		_commonItemsArray = ((_nvgsw + _binos + _gear) arrayIntersect _itemsUnit);
		_nvg = _commonItemsArray select 0;
		if(!isNil '_nvg') then {
			_x unassignItem _nvg;
			_x removeItem _nvg;
			_x removeWeapon _nvg;
		};
	};
} forEach (nearestObjects [_spark_move, ["CAManBase"], _AOE]); 

sleep 0.5;
{							
	if(alive _x) then {
				
		_itemsUnit = assignedItems _x;
		_commonItemsArray = ((_nvgsw + _binos + _gear) arrayIntersect _itemsUnit);
		_nvg = _commonItemsArray select 0;
		if(!isNil '_nvg') then {
			_x unassignItem _nvg;
			_x removeItem _nvg;
			_x removeWeapon _nvg;
		};
	};
} forEach (nearestObjects [_spark_move, ["CAManBase"], _AOE]); 


sleep 0.5;
{							
	if(alive _x) then {
				
		_itemsUnit = assignedItems _x;
		_commonItemsArray = ((_nvgsw + _binos + _gear) arrayIntersect _itemsUnit);
		_nvg = _commonItemsArray select 0;
		if(!isNil '_nvg') then {
			_x unassignItem _nvg;
			_x removeItem _nvg;
			_x removeWeapon _nvg;
		};
	};
} forEach (nearestObjects [_spark_move, ["CAManBase"], _AOE]); 







{
_x removePrimaryWeaponItem "rh_anpvs13cl";
_x removePrimaryWeaponItem "rh_anpvs13cmg";
_x removePrimaryWeaponItem "rh_anpvs13cm ";
_x removePrimaryWeaponItem "rh_anpvs13ch";
_x removePrimaryWeaponItem "rh_anpvs10";
_x removePrimaryWeaponItem "rh_anpvs4";
_x removePrimaryWeaponItem "optic_nightstalker";
_x removePrimaryWeaponItem "optic_nvs";
_x removePrimaryWeaponItem "optic_tws";
_x removePrimaryWeaponItem "optic_tws_mg";
_x removePrimaryWeaponItem "rhsusf_acc_anpvs27";
_x removePrimaryWeaponItem "rhsusf_acc_anpas13gv1";
_x removePrimaryWeaponItem "rh_peq2_top";
_x removePrimaryWeaponItem "rh_peq15b_top";
_x removePrimaryWeaponItem "rh_peq2";
_x removePrimaryWeaponItem "rh_peq15b";
_x removePrimaryWeaponItem "rh_peq15";
_x removePrimaryWeaponItem "ace_acc_pointer_green";
_x removePrimaryWeaponItem "sma_anpeq15_blk";
_x removePrimaryWeaponItem "sma_anpeq15_tan";
_x removePrimaryWeaponItem "rhs_acc_perst3";
_x removePrimaryWeaponItem "rhs_acc_perst1ik_ris";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq16a_light_top";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq16a_top";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq16a_light";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq16a";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15A";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_bk_light";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_light";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_bk_top";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_wmx_light";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_wmx";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15_top";
_x removePrimaryWeaponItem "rhsusf_acc_anpeq15side";
_x removePrimaryWeaponItem "acc_pointer_IR";
_x removePrimaryWeaponItem "CUP_optic_GOSHAWK";
_x removePrimaryWeaponItem "CUP_optic_GOSHAWK_RIS";
_x removePrimaryWeaponItem "CUP_optic_NSPU";
_x removePrimaryWeaponItem "CUP_optic_AN_PVS_4";
_x removePrimaryWeaponItem "CUP_optic_AN_PVS_4_M14";
_x removePrimaryWeaponItem "CUP_optic_AN_PVS_4_M16";
_x removePrimaryWeaponItem "CUP_optic_AN_PVS_10";
_x removePrimaryWeaponItem "CUP_optic_AN_PAS_13c1";
_x removePrimaryWeaponItem "CUP_optic_AN_PAS_13c2";
_x removePrimaryWeaponItem "CUP_optic_CWS";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Black";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_OD";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Tan_Top";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Black_Top";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_OD_Top";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_grey";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Black_Top";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_OD_Top";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Coyote_Top";
_x removePrimaryWeaponItem "CUP_acc_MLPLS_Laser";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_Black_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_Black_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_Coyote_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_Coyote_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_OD_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_2_Flashlight_OD_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_Tan_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_Tan_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_OD_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_OD_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_Black_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_Black_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_OD_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_OD_F";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L";
_x removePrimaryWeaponItem "CUP_acc_ANPEQ_15_Top_Flashlight_Black_F";
_x removePrimaryWeaponItem "OPTRE_M45_Flashlight";
_x removePrimaryWeaponItem "OPTRE_M12_Laser";
_x removePrimaryWeaponItem "OPTRE_M45_Flashlight_red";
_x removePrimaryWeaponItem "OPTRE_M6C_Laser";
_x removePrimaryWeaponItem "OPTRE_M6D_Flashlight";
_x removePrimaryWeaponItem "OPTRE_M6G_Flashlight";
_x removePrimaryWeaponItem "OPTRE_M7_Flashlight";
_x removePrimaryWeaponItem "OPTRE_M7_Laser";
_x removePrimaryWeaponItem "OPTRE_BMR_Laser";
_x removePrimaryWeaponItem "OPTRE_BMR_Flashlight";
_x removePrimaryWeaponItem "OPTRE_DMR_Light"																								
} forEach (nearestObjects [_spark_move, ["CAManBase"], _AOE]); 



sleep 1;

deleteVehicle _bangsound;
deleteVehicle _spark_move;


