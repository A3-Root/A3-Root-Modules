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
	class Root_Twins_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Twins_Module"};
		weapons[] = {};
	};
};

class CfgSounds
{
	class spark1
	{
		name = "spark1";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark1.ogg", db+30, 1};
		titles[] = {};
	};
	class spark11
	{
		name = "spark11";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark11.ogg", db+30, 1};
		titles[] = {};
	};
	class spark2
	{
		name = "spark2";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark2.ogg", db+30, 1};
		titles[] = {};
	};		
	class spark22
	{
		name = "spark22";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark22.ogg", db+30, 1};
		titles[] = {};
	};	
	class spark3	
	{
		name = "spark3";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark3.ogg", db+30, 1};
		titles[] = {};
	};
	class spark4	
	{
		name = "spark4";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark4.ogg", db+30, 1};
		titles[] = {};
	};
	class spark5	
	{
		name = "spark5";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\spark5.ogg", db+30, 1};
		titles[] = {};
	};	
	class metalic1	
	{
		name = "metalic1";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic1.ogg", db+25, 1};
		titles[] = {};
	};
	class metalic2	
	{
		name = "metalic2";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic2.ogg", db+25, 1};
		titles[] = {};
	};
	class metalic3	
	{
		name = "metalic3";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic3.ogg", db+35, 1};
		titles[] = {};
	};
	class metalic4	
	{
		name = "metalic4";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic4.ogg", db+35, 1};
		titles[] = {};
	};
	class metalic5	
	{
		name = "metalic5";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic5.ogg", db+20, 1};
		titles[] = {};
	};
	class metalic6
	{
		name = "metalic6";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic6.ogg", db+30, 1};
		titles[] = {};
	};
	class metalic7
	{
		name = "metalic7";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\metalic7.ogg", db+30, 1};
		titles[] = {};
	};
	class sound_twin
	{
		name = "sound_twin";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\sound_twin.ogg", 1, 1};
		titles[] = {};
	};
	class murmur
	{
		name = "murmur"; // Name for mission editor
		sound[] = {"\Root_Anomalies\Root_Twins\Sound\murmur.ogg", 0.8, 1.0};
		titles[] = {0, ""};
	};
	class geiger
	{
		name = "geiger"; // Name for mission editor
		sound[] = {"\Root_Anomalies\Root_Twins\Sound\geiger.ogg", .7, 1.0};
		titles[] = {0, ""};
	};
	class earthquake_02
	{
		name = "earthquake_02";
		sound[] = {"\Root_Anomalies\Root_Twins\sound\earthquake_02.ogg",0.7, 1};
		titles[] = {1, ""};
	};	
	class tiuit
	{
		name = "tiuit"; // Name for mission editor
		sound[] = {"\Root_Anomalies\Root_Twins\Sound\tiuit.ogg", 0.2, 1.0};
		titles[] = {0, ""};	
	};
};








class CfgFunctions
{
	class Root
	{
		class RootTwinsCategory
		{
			class Twins {file = "\Root_Anomalies\Root_Twins\AL_twins\init_twins.sqf";};
		};
	};
};




class CfgVehicles
{
	class zen_modules_moduleBase;
	class Twins_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Twins";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Twins";
		displayName = "Twins Anomaly";
	};
};