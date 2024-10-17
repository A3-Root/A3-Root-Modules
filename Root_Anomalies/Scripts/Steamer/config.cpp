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
	class Root_Steamer_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Steamer_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	class explozie_3
	{
		name = "explozie_3";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\explozie_3.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
	class explozie_2
	{
		name = "explozie_2";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\explozie_2.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
	class explozie_1
	{
		name = "explozie_1";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\explozie_1.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
	class gheizer_4
	{
		name = "gheizer_4";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\gheizer_4.ogg", db+5, 1};
		titles[] = {1, ""};
	};	
	class gheizer_3
	{
		name = "gheizer_3";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\gheizer_3.ogg", db+5, 1};
		titles[] = {1, ""};
	};		
	class gheizer_2
	{
		name = "gheizer_2";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\gheizer_2.ogg", db+5, 1};
		titles[] = {1, ""};
	};		
	class gheizer_1
	{
		name = "gheizer_1";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\gheizer_1.ogg", db+5, 1};
		titles[] = {1, ""};
	};
	class al_boil
	{
		name = "al_boil";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\al_boil.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class boil_mic
	{
		name = "boil_mic";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\boil_mic.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class vapori_01
	{
		name = "vapori_01";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\vapori_01.ogg",0.3, 1};
		titles[] = {1, ""};
	};
	class vapori_02
	{
		name = "vapori_02";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\vapori_02.ogg",0.5, 1};
		titles[] = {1, ""};
	};
	class vapori_03
	{
		name = "vapori_03";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\vapori_03.ogg",0.2, 1};
		titles[] = {1, ""};
	};
	class drops_01
	{
		name = "drops_01";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\drops_01.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class drops_02
	{
		name = "drops_02";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\drops_02.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class drops_03
	{
		name = "drops_03";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\drops_03.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class debris
	{
		name = "debris";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\debris.ogg",0.3, 1};
		titles[] = {1, ""};
	};
	class steamer_01
	{
		name = "steamer_01";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\steamer_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class steamer_02
	{
		name = "steamer_02";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\steamer_02.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_01
	{
		name = "tip_01";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_02
	{
		name = "tip_02";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_02.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_03
	{
		name = "tip_03";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_03.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_04
	{
		name = "tip_04";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_04.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_05
	{
		name = "tip_05";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_05.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_06
	{
		name = "tip_06";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\tip_06.ogg",1, 1};
		titles[] = {1, ""};
	};
	class eko_01
	{
		name = "eko_01";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\eko_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class eko_02
	{
		name = "eko_02";
		sound[] = {"\Root_Anomalies\Root_Steamer\Sound\eko_02.ogg",1, 1};
		titles[] = {1, ""};
	};

};


class CfgFunctions
{
	class Root
	{
		class RootSteamerCategory
		{
			class Steamer {file = "\Root_Anomalies\Root_Steamer\AL_steamer\init_steamer.sqf";};
		};
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
	class Steamer_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Steamer_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Steamer";
		displayName = "Steamer Anomaly";
	};
};


