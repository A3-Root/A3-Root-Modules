// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

[] spawn {
	waitUntil {!isNil "insecticid"};
    player addEventHandler ["Fired",
	{
		private ["_al_throwable"];
		_al_throwable = _this select 6;
		_shooter = _this select 0;
		[_al_throwable] execvm "\Root_Anomalies\Root_Swarmer\AL_swarmer\swarmer_smoke_detect.sqf";
	}];
};

