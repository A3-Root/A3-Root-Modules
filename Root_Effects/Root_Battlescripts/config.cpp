#include "BIS_AddonInfo.hpp"

#define _ARMA_

//(13 Enums)
enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};

class CfgPatches
{
	class Root_Battle_Effect
	{
		addonRootClass = "Root_Effects";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Effects","zen_custom_modules"};
		requiredVersion = 0.1;
		units[] = {"AAA_Module", "Missiles_Module", "Ground_Module", "Tracers_Module", "Search_Module"};
		weapons[] = {};
	};
};

class CfgSounds
{
	// Definition for each sound
	class bariera_1
	{
		name = "bariera_1"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\bariera_1.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};	
	class bariera_2
	{
		name = "bariera_2"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\bariera_2.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};	
	class bariera_3
	{
		name = "bariera_3"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\bariera_3.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};	
	class bariera_4
	{
		name = "bariera_4"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\bariera_4.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};	
	class bariera_5
	{
		name = "bariera_5"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\bariera_5.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};	
	class ground_air
	{
		name = "ground_air"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\ground_air.ogg", db+15, 1.0};
		titles[] = {0, ""};	
	};
	class roc_1
	{
		name = "roc_1"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\roc_1.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};	
	class roc_2
	{
		name = "roc_2"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\roc_2.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};		
	class roc_3
	{
		name = "roc_3"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\roc_3.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};		
	class roc_4
	{
		name = "roc_4"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\roc_4.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class alarma_aeriana_scurt
	{
		name = "alarma_aeriana_scurt"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\alarma_aeriana_scurt.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};		
	class test_1
	{
		name = "test_1"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\test_1.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class test_2
	{
		name = "test_2"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\test_2.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class test_3
	{
		name = "test_3"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\test_3.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class flak_ground
	{
		name = "flak_ground"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\flak_ground.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class explosion_1
	{
		name = "explosion_1"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\explosion_1.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class explosion_2
	{
		name = "explosion_2"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\explosion_2.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class explosion_3
	{
		name = "explosion_3"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\explosion_3.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
	class explosion_4
	{
		name = "explosion_4"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Battlescripts\sound\explosion_4.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};
};

class CfgFunctions
{
	class Root
	{
		class RootBattleCategory
		{
			class AAA {file = "\Root_Effects\Root_Battlescripts\ALambientbattle\init_ambient_aaa.sqf";};
			class Ground {file = "\Root_Effects\Root_Battlescripts\ALambientbattle\init_ambient_ground.sqf";};
			class Missiles {file = "\Root_Effects\Root_Battlescripts\ALambientbattle\init_ambient_missiles.sqf";};
			class Search {file = "\Root_Effects\Root_Battlescripts\ALambientbattle\init_ambient_search.sqf";};
			class Tracers {file = "\Root_Effects\Root_Battlescripts\ALambientbattle\init_ambient_tracers.sqf";};
		};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class ROOT_EFFECTS : NO_CATEGORY {
		displayName = "Root's Effects";
	};
};

class CfgVehicles
{
	class zen_modules_moduleBase;
	class AAA_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "AAA_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_AAA";
		displayName = "Anti Air (AA) Barrage";
	};
	class Ground_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Ground_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Ground";
		displayName = "Artillery Barrage";
	};
	class Missiles_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Missiles_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Missiles";
		displayName = "Missile Launcher";
	};
	class Search_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Search_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Search";
		displayName = "Searchlights";
	};
	class Tracers_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Tracers_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Tracers";
		displayName = "Tracers";
	};
};
