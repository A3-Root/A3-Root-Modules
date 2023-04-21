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
	class Root_Screamer_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Screamer_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class miscare_screamer
	{
		name = "miscare_screamer";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\miscare_screamer.ogg", db+20, 1};
		titles[] = {};
	};
	class scream
	{
		name = "scream";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\scream.ogg", db+20, 1};
		titles[] = {};
	};
	class ecou
	{
		name = "ecou";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\ecou.ogg", db+20, 1};
		titles[] = {};
	};		
	class stones_scream
	{
		name = "stones_scream";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\stones_scream.ogg", db+20, 1};
		titles[] = {};
	};	
	class teleport_screamer	
	{
		name = "teleport_screamer";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\teleport_screamer.ogg", db+10, 1};
		titles[] = {};
	};
	class earthquakes	
	{
		name = "earthquakes";
		sound[] = {"\Root_Anomalies\Root_Screamer\sound\earthquakes.ogg", 1, 1};
		titles[] = {};
	};		

};


class CfgFunctions
{
	class Root
	{
		class RootScreamerCategory
		{
			class Screamer {file = "\Root_Anomalies\Root_Screamer\AL_screamer\init_screamer.sqf";};
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
	class Screamer_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Screamer";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Screamer";
		displayName = "Screamer Anomaly";
	};
};