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
	class Root_Farmer_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Farmer_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class explozie_3
	{
		name = "explozie_3";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\explozie_3.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class eko
	{
		name = "eko";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\eko.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class pietre
	{
		name = "pietre";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\pietre.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_1
	{
		name = "punch_1";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_1.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_2
	{
		name = "punch_2";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_2.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_3
	{
		name = "punch_3";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_3.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_4
	{
		name = "punch_4";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_4.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_5
	{
		name = "punch_5";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_5.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_6
	{
		name = "punch_6";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_6.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_7
	{
		name = "punch_7";
		sound[] = {"\Root_Anomalies\Root_Farmer\sound\punch_7.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};

};



class CfgFunctions
{
	class Root
	{
		class RootFarmerCategory
		{
			class Farmer {file = "\Root_Anomalies\Root_Farmer\AL_farmer\init_farmer.sqf";};
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
	class Farmer_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Farmer_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Farmer";
		displayName = "Farmer Anomaly";
	};
};





