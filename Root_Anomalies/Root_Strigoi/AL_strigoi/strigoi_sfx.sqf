// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

fnc_spectral = {
	_r = [];
	_comp_obj_casp = _this;
	_effectArrays = 
	[
		[
			[0.1,[0.1,0.1,0.5],[0,0,0.2],1,0.1,[0,0,0,0],1,0],
			{[["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,0.6,[0,0,0],[0,0,0.1],1,10.1,7.9,0.0001,[0.6,0.2,0.01],[[1,1,1,1],[1,1,1,0.5],[1,1,1,0]],[1],1,0,"","",_this]}
		],
		[
			[0.5,[0,0,0.25],[0.175,0.175,0.1],0,0.25,[0,0,0,0.1],0,0],
			{[["\A3\data_f\cl_feathers2",1,0,1],"","SpaceObject",1,0.5,[0,0,0],[0,0,0.1],3,10,7.9,0.0075,[15,15,15],[[1,1,1,0.5],[1,1,1,0.5],[1,1,1,0]],[1],1,0,"","",_this]}
		]
	];
	_arr = _effectArrays select sunOrMoon;
	{
		_part_gost = "#particlesource" createVehicleLocal (getPosATL _x);
		_part_gost setParticleCircle [0,[0,0,0]];
		_part_gost setParticleRandom (_arr # 0);
		_part_gost setParticleParams (_x call (_arr # 1));
		_part_gost setDropInterval 0.05;
		_r pushBackUnique _part_gost;
	} forEach _comp_obj_casp;

	[_r, _effectArrays, _comp_obj_casp] spawn 
	{
		_part_gost_array = _this # 0;
		_effectArrays = _this # 1;
		_comp_obj_casp = _this # 2;
		while {!((count _this) isEqualTo 0)} do 
		{
			sleep 3;
			_arr = _effectArrays select sunOrMoon;
			{
				_x setParticleRandom (_arr # 0);
				_x setParticleParams ((_comp_obj_casp select (_part_gost_array find _x)) call (_arr # 1));
			} forEach _part_gost_array;
		};
	};
	_r
};

private ["_part_gost","_part_gost_sec","_comp_obj_casp","_tease_voice","_strigoi","_final_strigoi", "_noseize"];
if (!hasInterface) exitWith {};

_strigoi = _this # 0;
_comp_obj_casp = [];

player setSpeaker "NoVoice";

waitUntil {sleep 5; player distance _strigoi <1000};
_strigoi spawn {while {alive _this} do {if (_this getVariable "vizibil") then {[_this,["casp_voice", 100]] remoteExec ["say3d"]}; sleep 20; /* sleep 30 + random 20*/}};

_pct_casper=["spine3","leftshoulder","leftforearmroll","leftleg","leftfoot","leftupleg","rightshoulder","rightforearmroll","rightupleg","rightleg","rightfoot","pelvis","neck","leftforearm", "rightforearm"];
{_part_surs = "Land_HelipadEmpty_F" createVehicle [0,0,0]; _comp_obj_casp pushBack _part_surs; _part_surs attachTo [_strigoi, [0,0,0],_x]} forEach _pct_casper;
[_comp_obj_casp,_strigoi] spawn {_guri = _this select 0; _tease_voice = _this select 1;	while {alive _tease_voice} do {_gura = selectRandom _guri; _tease_sound = selectRandom ["01_tease","02_tease","NoSound"]; _gura say3D [_tease_sound, 100]; sleep 20; /* sleep 30 + random 30 */}};

_part_gost_array = _comp_obj_casp call fnc_spectral;

_part_gost_sec = "#particlesource" createVehicleLocal (getPosATL _strigoi);
_part_gost_sec setParticleCircle [0,[0,0,0]];
_part_gost_sec setParticleRandom [0,[0.3,0.5,0.5],[0,0,0.1],0,0,[0,0,0,0],0,0];
_part_gost_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0.2],5,10.1,7.9,0,[3,2,5],[[1,1,1,1],[1,1,1,0.5],[1,1,1,0]],[1],0,0,"","",_strigoi];
_part_gost_sec setDropInterval 0.05;

waitUntil {sleep 2; !(_strigoi getVariable "vizibil")or(!alive _strigoi)};
deleteVehicle _part_gost_sec;
{deleteVehicle _x} forEach (_comp_obj_casp + _part_gost_array);

_part_gost = "#particlesource" createVehicleLocal (getPosATL _strigoi);
_part_gost setParticleCircle [0,[0,0,0]];
_part_gost setParticleRandom [0.1,[0.5,0.5,2],[0,0,0.3],0.1,0.1,[0,0,0,0],0,0];
_part_gost setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","SpaceObject",1,1,[0,0,2],[0,0,0],3,10.5,7.9,0,[0.5,0.3,0.01],[[1,1,1,1],[1,1,1,0.5],[1,1,1,0]],[1],1,0,"","",_strigoi];
_part_gost setDropInterval 0.05;

_part_gost_sec = "#particlesource" createVehicleLocal (getPosATL _strigoi);
_part_gost_sec setParticleCircle [0,[0,0,0]];
_part_gost_sec setParticleRandom [0,[0.5,0.5,2],[0,0,0.1],0,0,[0,0,0,0],0,0];
_part_gost_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,1,[0,0,2],[0,0,0.1],5,10.5,7.9,0,[3,2,5],[[1,1,1,0.5],[1,1,1,1],[1,1,1,0]],[1],1,0,"","",_strigoi];
_part_gost_sec setDropInterval 0.05;

sleep 3; deleteVehicle _part_gost; deleteVehicle _part_gost_sec;