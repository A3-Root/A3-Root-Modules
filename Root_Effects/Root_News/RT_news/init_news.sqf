// CREATED BY ROOT
// Only run on player machines
if (!hasinterface) exitwith {};
// If ZEN is not loaded, do not start script
if !(isClass (configFile >> "CfgPatches" >> "zen_custom_modules")) exitwith
{
    diag_log "******CBA and/or ZEN not detected. They are required for this mod.";
};
params ["_logic"];
private _logicpos = getPosATL _logic;
if (isNil "NEWS_markerIndex") then { NEWS_markerIndex = 0 };
NEWS_markerIndex = NEWS_markerIndex + 1;
deleteVehicle _logic;
["AAN News Article Settings", [
	["EDIT", ["Article Title", "Title of the article."], ["ARMA 3 - The Frontier of Armaverse"]],
	["EDIT", ["Article Editor", "Author/Editor of the article."], ["Root"]],
	["EDIT", ["Article Date", "Date of the article separated by '/'. Format: YYYY/M/DD HH:MM"], ["2035/2/24 11:38"]],
	["EDIT", ["Article Timezone", "Timezone of the article."], ["CET"]],
	["EDIT", ["Article Sub-headline", "Sub-heading of the article in bold."], ["A look into the universe of ARMA and how it came to be!"]],
	["EDIT", ["Article Main Image", "Path to the image file to be used in the article. Use "" for no image."], ["\a3\Missions_F_Orange\Data\Img\orange_overview_ca.paa"]],
	["EDIT", ["Article Main Image Description", "Description of the main image used in the article."], ["ARMA 3 Cover Image by Bohemia Interactive"]],
	["EDIT:MULTI", ["Article Body", "The body of the article. Insert your text here."], ["Arma 3 (stylized as ArmA III) is an open world realism-based military tactical shooter video game developed and published by Bohemia Interactive exclusively through the Steam distribution platform. It is the third main entry in the Arma series, and the eighth installment overall. Arma 3 was released for Microsoft Windows on September 12, 2013, and for macOS and Linux on August 31, 2015. Arma 3 was released to generally favorable reception, with praise toward the visuals and immersive realism, but criticism toward the difficulty for new players and the lack of singleplayer content on release. Arma 3 has been actively maintained and expanded by Bohemia Interactive and publishing partners, with almost twenty significant updates and downloadable content (DLC) releases since 2014. Almost a decade since its release, Arma 3 maintains a substantial playerbase and an active modding community.", {}, 7]],
	["EDIT:MULTI", ["Article Body (Subscription)", "The content present here will be gradually hidden behind an article 'subscription' screen."], ["Arma 3 primarily takes place in the mid-2030s, on the fictional islands of Altis and Stratis in the South Mediterranean Sea. The game's expansions are set on the South Pacific island of Tanoa; the Mediterranean island of Malden; the European country of Livonia; the Western Saharan country of Argana; and several real-life locations, including parts of Mainland Southeast Asia, Germany, and Eastern Europe. The game's maps feature photorealistic terrain and water environments. The game features multiple singleplayer and co-op campaigns, most of which follow various perspectives before, during, and after a conflict fought in the fictional Republic of Altis and Stratis.", {}, 7]],
	["EDIT", ["Article Editor Image", "Path to the image file to be used as the editor of the article. Use "" for no image."], ["\a3\Missions_F_Orange\Data\Img\avatar_journalist_ca.paa"]],
	["EDIT:MULTI", ["Article Editor Info", "Description of the editor/author of the article."], ["Root is our Senior Reporter on Military and Politics. Currently, he is touring various conflict zones with the 77th JSOC as part of the UNSC War Report project. You can learn more about it at https://77th-jsoc.com", {}, 3]],
	["CHECKBOX", ["Fade to Article", "If checked, creates a 'Black' fade with custom text."], false],
	["EDIT", ["Fade Title", "Text to be used during fade."], ["Fade Title"]],
	["CHECKBOX", ["Enable Diary Entry", "If checked, a corresponding diary entry will be created."], false],
	["EDIT", ["Diary Tab", "Will store the article under this tab in the diary. If none exists, a new one will be created."], ["AAN Reports"]],
	["CHECKBOX", ["Display Article upon Exit", "If checked, will display the Artile when exiting this menu post confirmation."], false],
	["OWNERS", ["Select Units", "Select the Side(s) / Group(s) / Unit(s) you want display the article."], [[], [], [], 0], true]
	], {
		params ["_articleresults"];
		_articleresults params ["_title", "_editor", "_date", "_timezone", "_subhead", "_main_img", "_main_img_desc", "_body", "_body_locked", "_editor_img", "_editor_info", "_enable_fade", "_fade_title", "_enable_diary", "_diary_title", "_display_now", "_selected"];
		_selected params ["_sides", "_groups", "_players"];
		private _new_date = _date splitString ",-/. :";
		private _tempvar = false;
		private _lock_msg = format ["%1%2%3%4%5", "You have reached your Monthly Free Access Limit", "<br/>", "---------------------------------------------------------------", "<br/>", "Subscribe to continue reading."];
		if (_diary_title == "") then { _diary_title = "AAN Reports" };
		if (!_tempvar && {_sides isEqualTo []} && {_groups isEqualTo []} && {_players isEqualTo []}) exitWith {
				["ERROR - Select a side/group/unit"] call zen_common_fnc_showMessage;
			};
		// forEach ((call CBA_fnc_players) select {(side _x) in _sides || {(group _x) in _groups} || {_x in _players}})
		{
			if (_display_now) then 
			{
				if (_enable_fade) then 
				{
					[_fade_title] spawn 
					{
						[0,"BLACK",4,0] spawn BIS_fnc_fadeEffect;
						[
							[
								["%1","<t align = 'center' shadow = '1' size = '1.2' font='PuristaBold'>%1</t>"]
							]
						] spawn BIS_fnc_typeText;
						[1,"BLACK",0.1,0] spawn BIS_fnc_fadeEffect;
					}
				};			
				
				[_title, _editor, _new_date, _timezone, _subhead, _main_img, _main_img_desc, _body, _body_locked, _lock_msg, _editor_img, _editor_info] spawn
				{
					disableSerialization;
					[
						[
							["title", _this select 0], 
							["meta",[_this select 1,_this select 2,_this select 3]],
							["textbold",_this select 4],
							["image",[_this select 5,_this select 6]],
							["text",_this select 7],
							["textlocked",[_this select 8,_this select 9]],
							["author",[_this select 10,_this select 11]]
						],findDisplay 46,true
					] call bis_fnc_showAANArticle;
				};
			};
		} forEach ((call CBA_fnc_players) select {(side _x) in _sides || {(group _x) in _groups} || {_x in _players}});
		if (_enable_diary) then 
		{
			[[_title, _editor, _new_date, _timezone, _subhead, _main_img, _main_img_desc, _body, _body_locked, _lock_msg, _editor_img, _editor_info, _sides, _groups, _players, _diary_title], "\Root_Effects\Root_News\RT_news\news_diary.sqf"] remoteExec ["BIS_fnc_execVM", 0];
		};
		["News Article Created"] call zen_common_fnc_showMessage;
	}, 
	{
		["Aborted"] call zen_common_fnc_showMessage;
		playSound "FD_Start_F";
	}
] call zen_dialog_fnc_create;


