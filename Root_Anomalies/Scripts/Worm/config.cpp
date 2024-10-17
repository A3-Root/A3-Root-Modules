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
	class Root_Worm_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Worm_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	class idle_01
	{
		name = "idle_01";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\idle_01.ogg", db+5, 1};
		titles[] = {};
	};
	class idle_02
	{
		name = "idle_02";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\idle_02.ogg", db+10, 1};
		titles[] = {};
	};	
	class post_impact_01
	{
		name = "post_impact_01";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\post_impact_01.ogg", 1, 1};
		titles[] = {};
	};
	class post_impact_02
	{
		name = "post_impact_02";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\post_impact_02.ogg", 1, 1};
		titles[] = {};
	};		
	class post_impact_03
	{
		name = "post_impact_03";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\post_impact_03.ogg", 1, 1};
		titles[] = {};
	};	
	class post_impact_04
	{
		name = "post_impact_04";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\post_impact_04.ogg", 1, 1};
		titles[] = {};
	};
	class impact_30	
	{
		name = "impact_30";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\impact_30.ogg",db+30, 1};
		titles[] = {};
	};	
	class impact_27
	{
		name = "impact_27";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\impact_27.ogg",db+30, 1};
		titles[] = {};
	};
	class salt_05
	{
		name = "salt_05";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\salt_05.ogg",db+20, 1};
		titles[] = {};
	};
	class salt_08
	{
		name = "salt_08";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\salt_08.ogg",db+20, 1};
		titles[] = {};
	};
	class move_01
	{
		name = "move_01";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_01.ogg",1, 1};
		titles[] = {};
	};
	class move_02
	{
		name = "move_02";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_02.ogg",1, 1};
		titles[] = {};
	};
	class move_03
	{
		name = "move_03";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_03.ogg",1, 1};
		titles[] = {};
	};
	class move_04
	{
		name = "move_04";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_04.ogg",1, 1};
		titles[] = {};
	};
	class move_05
	{
		name = "move_05";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_05.ogg",1, 1};
		titles[] = {};
	};
	class move_06
	{
		name = "move_06";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_06.ogg",1, 1};
		titles[] = {};
	};
	class move_07
	{
		name = "move_07";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_07.ogg",1, 1};
		titles[] = {};
	};
	class move_08
	{
		name = "move_08";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_08.ogg",1, 1};
		titles[] = {};
	};
	class move_09
	{
		name = "move_09";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_09.ogg",1, 1};
		titles[] = {};
	};
	class move_10
	{
		name = "move_10";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_10.ogg",1, 1};
		titles[] = {};
	};
	class move_11
	{
		name = "move_11";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_11.ogg",1, 1};
		titles[] = {};
	};
	class move_12
	{
		name = "move_12";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_12.ogg",1, 1};
		titles[] = {};
	};
	class move_13
	{
		name = "move_13";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_13.ogg",1, 1};
		titles[] = {};
	};
	class move_14
	{
		name = "move_14";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_14.ogg",1, 1};
		titles[] = {};
	};
	class move_15
	{
		name = "move_15";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\move_15.ogg",1, 1};
		titles[] = {};
	};
	class bump
	{
		name = "bump";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\bump.ogg",db+20, 1};
		titles[] = {};
	};
	class strigat
	{
		name = "strigat";
		sound[] = {"\Root_Anomalies\Root_Worm\sound\strigat.ogg",db+20, 1};
		titles[] = {};
	};	
};


class CfgFunctions
{
	class Root
	{
		class RootWormCategory
		{
			class Worm {file = "\Root_Anomalies\Root_Worm\AL_worm\init_worm.sqf";};
		};
	};
};

class Extended_PostInit_EventHandlers
{
	class RootPostInitWorm
	{
		init = "call compile preprocessFileLineNumbers '\Root_Anomalies\Root_Worm\AL_worm\postinit_worm.sqf'";
		disableModuload = 1;
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class ROOT_ANOMALIES : NO_CATEGORY {
		displayName = "Root's Anomalies";
	};
};


class CfgVehicles
{
	class zen_modules_moduleBase;
	class Worm_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Worm_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Worm";
		displayName = "Worm Anomaly";
	};
};
