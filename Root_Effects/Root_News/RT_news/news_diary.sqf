// CREATED BY ROOT
// Only run on server
if (!isServer) exitwith {};
// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};

params  ["_title", "_editor", "_new_date", "_timezone", "_subhead", "_main_img", "_main_img_desc", "_body", "_body_locked", "_lock_msg", "_editor_img", "_editor_info", "_sides", "_groups", "_players", "_diary_title"];

{
	_x createDiaryRecord
	[
		"diary",
		[
			_diary_title,
			format ["<execute expression='
			[] spawn 
			{
				disableSerialization;
				[
					[
						[""title"", ""%1""], 
						[""meta"",[""%2"",""%3"",""%4""]],
						[""textbold"",""%5""],
						[""image"",[""%6"",""%7""]],
						[""text"",""%8""],
						[""textlocked"",[""%9"",""%10""]],
						[""author"",[""%11"",""%12""]]
					],findDisplay 46,true
				] call bis_fnc_showAANArticle;
			}
			'>""AAN Article""</execute>", _title, _editor, _new_date, _timezone, _subhead, _main_img, _main_img_desc, _body, _body_locked, _lock_msg, _editor_img, _editor_info]
		]
	];
} forEach ((call CBA_fnc_players) select {(side _x) in _sides || {(group _x) in _groups} || {_x in _players}});
