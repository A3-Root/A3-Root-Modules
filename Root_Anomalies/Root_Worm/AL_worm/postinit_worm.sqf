// ORIGINALLY CREATED BY ALIAS
// MODIFIED BY ROOT 

[] spawn {
	waitUntil {!isNil "wormkiller"};
    player addEventHandler ["Fired",
	{
		private ["_worm_throwable", "_shooter"];
		_worm_throwable = _this select 6; 
		_shooter = _this select 0; 
		[_worm_throwable] execvm "\Root_Anomalies\Root_Worm\AL_worm\worm_kill_detect.sqf";
	}];
};

