


_timer1 = 0;
_timer2 = 0;
_timer3 = 0;
_animThread = nil;
_lightThread = nil;

while {true} do {
	sleep 1; // 1 ticks per second system

	_player = player;

	//--- Burpers (run effect every 3 seconds)
	if (_timer1 == 3) then {
		_timer1 = 0;
		{		
			_burper = _x;

			if (!alive _burper) then {continue};
			_animObject = _burper getVariable ["animator",objNull];

			//--- Animate burper and create SFX
			if (_player distance _burper < 1500) then {
				
				if (isNull _animObject) then {
					_animObject = "Sign_Sphere25cm_F" createVehicleLocal [getposATL _burper select 0,getposATL _burper select 1,1];
					_animObject setObjectMaterial [0,"A3\Structures_F\Data\Windows\window_set.rvmat"];	
					_animObject setObjectTextureglobal [0, "\Root_Anomalies\Root_Burper\AL_burper\01_burper.jpg"];
					_burper setVariable ["animator",_animObject];
				};

				if (ROOT_var_burperProtectorNeeded && player call ROOT_fnc_hasBurperDetector) then {}; // TODO

				if (isNil "_animThread") then { _animThread = [_burper,_animObject] spawn _fnc_anim_burp; };
				if (!isNil "_lightThread") then {_lightThread = [_burper,_animObject] spawn _fnc_sfx_light; };

				[_burper,_animObject] call _fnc_sfx_burp;
			} else {
				_burper setVariable ["animator",objNull];
				deleteVehicle _animObject;
			};
		} foreach ROOT_var_burperObjects;
	};
	_timer1 = _timer1 + 1;

	//--- Play Burper Vortex Effect every 8 seconds
	if (_timer3 == 8) then {_animObject say3D ["vortex", 50]; _timer3 = 0;};

};


_max = 0;
_chance = 0;
_fnc_sfx_burp = {
	params["_burper","_animObject"];
	
	// Sleep for min 6 + random 3 seconds
	_timer2 = _timer2 + 1;
	_max = _max + 1;
	_chance = _chance + 1;
	if (_timer2 < 6 && random 3 > 1 && _max != 3) then {continue};
	_timer2 = 0;
	_max = 0;
	_chance = 0;

	// Sounds
	if ((player distance _animObject) < 100) then {
		_sound = selectRandom ["01_blast","02_blast","03_blast"];
		enableCamShake true;
		addCamShake [1,4,13+(random 33)];
		_animObject say3D [_sunet_blast, 100];
	};
	if ((player distance _animObject) > 100) then {
		_sound = selectRandom ["01_far_blast","02_far_blast","03_far_blast"];
		_animObject say3D [_sound, 500];
	};

	//--- PARTICLE EFFECTS
	private _blast_blurp = "#particlesource" createVehicleLocal (getPosATL _animObject);
	_blast_blurp setParticleCircle [5, [-3, -3, 0]];
	_blast_blurp setParticleRandom [2, [6, 6, 0], [-7, -7, 0], 5, 1, [0, 0, 0, 1], 1, 1];
	_blast_blurp setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [2, 2, 2], 0, 12, 7.9, 0.075, [2, 2, 2], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_sfx_sec];
	_blast_blurp setDropInterval 0.005;	

	private _blast_dust = "#particlesource" createVehicleLocal (getPosATL _animObject);
	_blast_dust setParticleCircle [3, [-3, -3, 0]];
	_blast_dust setParticleRandom [2, [2, 2, 0], [-7, -7, 0], 5, 1, [0, 0, 0, 1], 1, 1];
	_blast_dust setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.1], 0, 10, 7.9, 0.075, [1, 3, 5], [[0.3, 0.27, 0.15, 0.1], [0.3, 0.27, 0.15, 0.01], [0.3, 0.27, 0.15, 0]], [0.08], 1, 0, "", "", _obj_sfx_sec];
	_blast_dust setDropInterval 0.01;
	
	private _effect_sp_dist = "#particlesource" createVehicleLocal (getPosATL _animObject);
	_effect_sp_dist setParticleCircle [0, [0, 0, 0]];
	_effect_sp_dist setParticleRandom [0, [0,0, 0], [0,0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	_effect_sp_dist setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1.5, [0, 0, 0], [0, 0, 0], 7, 10, 7.9, 0.007, [2, 2, 30, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_sfx_sec];
	_effect_sp_dist setDropInterval 0.4;

	private _dust_eff = "#particlesource" createVehicleLocal (getPosATL _animObject);
	_dust_eff setParticleCircle [0, [0, 0, 0]];
	_dust_eff setParticleRandom [0, [0,0, 0], [0,0, 0], 0,0, [0, 0, 0, 0], 0, 0];
	_dust_eff setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.75], 15, 10, 7.9, 0.001, [5, 10, 1], [[1, 1, 1, 0.01], [1, 1, 1, 0.05], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _obj_sfx_sec];
	_dust_eff setDropInterval 0.5;

	// Remove Effect
	[_blast_blurp,_blast_dust,_effect_sp_dist,_dust_eff] spawn {
		params["_blast_blurp","_blast_dust","_effect_sp_dist","_dust_eff"];
		sleep 0.5 + (random 1);
		deleteVehicle _blast_dust;
		deleteVehicle _blast_blurp;
		deleteVehicle _effect_sp_dist;
		deleteVehicle _dust_eff;
	}

};

_fnc_sfx_light = {
	params["_burper","_animObject"];

	private _source_burp = "#particlesource" createVehicleLocal (getPosATL _animObject);
	_source_burp setParticleCircle [0, [0, 0, 0]];
	_source_burp setParticleRandom [0, [0.25, 0.25, 0], [5, 5, 5], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_source_burp setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.3, [0, 0, 2], [0, 0, 0], 17, 10, 7.9, 0.007, [4,0.5], [[0, 0, 0, 1],[0, 0, 0, 1]], [0.08], 1, 0, "", "", _obj_sfx_princ];
	_source_burp setDropInterval 0.01;

	private _spotLit = "#lightpoint" createVehicleLocal (getPosATL _animObject); 
	_spotLit lightAttachObject [_animObject, [0.1,0.1,3]];
	_spotLit setLightUseFlare false;
	_spotLit setLightFlareSize 1;
	_spotLit setLightFlareMaxDistance 1500;
	_spotLit setLightAttenuation [0,0,50,1000,1,50];

	while {!isNull _animObject && {(player distance _animObject) < 1500}} do {
		_r_col_burp = random 1;
		_g_col_burp = random 1;
		_b_col_burp = random 1;
		_brit_burp = 10 + random 30;
		_spotLit setLightColor [_r_col_burp,_g_col_burp,_b_col_burp];
		_spotLit setLightAmbient [_r_col_burp,_g_col_burp,_b_col_burp];
		_spotLit setLightDayLight true;
		sleep 0.5;
		_spotLit setLightBrightness _brit_burp;
		sleep 0.5;

		while {_brit_burp>8} do {
			_spotLit setLightBrightness _brit_burp;
			_brit_burp = _brit_burp - 0.5;
			sleep 0.1;
		};
		sleep 1+ random 5;
	};
	deleteVehicle _source_burp;
	deleteVehicle _spotLit;
};





_fnc_anim_burp = {
	params ["_burper","_animObject"];

	private _dir = 0;
	private _bounceAmount = 0;
	private _up = false;

	while {!isNull _animObject && {(player distance _animObject) < 1500 && (_burper getVariable "BurperActive")}} do {
		if ((_bounceAmount < 0.61) && !_up) then {_bounceAmount = _bounceAmount + 0.01};
		if (_bounceAmount > 0.61) then {_up = true};
		if (_up && (_bounceAmount > 0.2)) then {_bounceAmount = _bounceAmount - 0.01};
		if (_bounceAmount < 0.2) then {_up = false};
		_dir = _dir + 2;
		_animObject setdir _dir;
		_animObject setPosATL [getPosATL _animObject select 0, getPosATL _animObject select 1, _bounceAmount];
		sleep 0.02 + ([0,0.5] select (player distance _animObject) > 400); // Higher update rate when near
	};
};