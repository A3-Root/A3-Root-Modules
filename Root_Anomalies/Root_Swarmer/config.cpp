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
	class Root_Swarmer_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Swarmer_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	class roi_02
	{
		name = "roi_02";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\roi_02.ogg",1,1};
		titles[] = {};
	};
	class roi_atk_01
	{
		name = "roi_atk_01";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\roi_atk_01.ogg",1,1};
		titles[] = {};
	};
	class roi_mort
	{
		name = "roi_mort";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\roi_mort.ogg",1,1};
		titles[] = {};
	};
	class eating
	{
		name = "eating";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\eating.ogg",1,1};
		titles[] = {};
	};
	class strigat_92
	{
		name = "strigat_92";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\strigat_92.ogg", db+10, 1};
		titles[] = {};
	};
	class insect_03
	{
		name = "insect_03";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_03.ogg",1,1};
		titles[] = {};
	};
	class insect_01
	{
		name = "insect_01";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_01.ogg",1,1};
		titles[] = {};
	};
	class insect_04
	{
		name = "insect_04";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_04.ogg",1,1};
		titles[] = {};
	};
	class insect_05
	{
		name = "insect_05";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_05.ogg",1,1};
		titles[] = {};
	};
	class insect_07
	{
		name = "insect_07";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_07.ogg",1,1};
		titles[] = {};
	};
	class insect_08
	{
		name = "insect_08";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\insect_08.ogg",1,1};
		titles[] = {};
	};
	class hive_queen_01
	{
		name = "hive_queen_01";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\hive_queen_01.ogg",1,1};
		titles[] = {};
	};
	class hive_queen_02
	{
		name = "hive_queen_02";
		sound[] = {"\Root_Anomalies\Root_Swarmer\sounds\hive_queen_02.ogg",1,1};
		titles[] = {};
	};
};


class CfgFunctions
{
	class Root
	{
		class RootSwarmerCategory
		{
			class Swarmer {file = "\Root_Anomalies\Root_Swarmer\AL_swarmer\init_swarmer.sqf";};
		};
	};
};


class Extended_PostInit_EventHandlers
{
	class RootPostInitSwarmer
	{
		init = "call compile preprocessFileLineNumbers '\Root_Anomalies\Root_Swarmer\AL_swarmer\postinit_swarmer.sqf'";
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
	class Swarmer_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Swarmer_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Swarmer";
		displayName = "Swarmer Anomaly";
	};
};
