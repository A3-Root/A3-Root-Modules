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
	class Root_Burper_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Burper_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class bones_drop
	{
		name = "bones_drop";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\bones_drop.ogg", db+30, 1};
		titles[] = {};
	};
	class blood_splash
	{
		name = "blood_splash";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\blood_splash.ogg", db+35, 1};
		titles[] = {};
	};
	class zoomin
	{
		name = "zoomin";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\zoomin.ogg", db+25, 1};
		titles[] = {};
	};	
	class 01_blast
	{
		name = "01_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\01_blast.ogg", db+30, 1};
		titles[] = {};
	};
	class 02_blast
	{
		name = "02_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\02_blast.ogg", db+30, 1};
		titles[] = {};
	};
	class 03_blast
	{
		name = "03_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\03_blast.ogg", db+30, 1};
		titles[] = {};
	};
	
// mediu
	class 01_blast_mediu
	{
		name = "01_blast_mediu";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\01_blast.ogg", db+40, 1};
		titles[] = {};
	};
	class 02_blast_mediu
	{
		name = "02_blast_mediu";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\02_blast.ogg", db+40, 1};
		titles[] = {};
	};
	class 03_blast_mediu
	{
		name = "03_blast_mediu";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\03_blast.ogg", db+40, 1};
		titles[] = {};
	};
	
	class 01_far_blast
	{
		name = "01_far_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\01_far_blast.ogg", db+15, 1};
		titles[] = {};
	};	
	class 02_far_blast
	{
		name = "02_far_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\02_far_blast.ogg", db+20, 1};
		titles[] = {};
	};	
	class 03_far_blast
	{
		name = "03_far_blast";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\03_far_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class vortex
	{
		name = "vortex";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\vortex.ogg", db+40, 1};
		titles[] = {};
	};
	class strigat_1
	{
		name = "strigat_1";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_1.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_2
	{
		name = "strigat_2";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_2.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_3
	{
		name = "strigat_3";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_3.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_4
	{
		name = "strigat_4";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_4.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_5
	{
		name = "strigat_5";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_5.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_6
	{
		name = "strigat_6";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_6.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_7
	{
		name = "strigat_7";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_7.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_8
	{
		name = "strigat_8";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_8.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_9
	{
		name = "strigat_9";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_9.ogg",db+20, 1};
		titles[] = {};
	};
	class strigat_91
	{
		name = "strigat_91";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_91.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_92
	{
		name = "strigat_92";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\strigat_92.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_metal_3
	{
		name = "bodyfall_metal_3";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\bodyfall_metal_3.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_1
	{
		name = "bodyfall_wood_1";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\bodyfall_wood_1.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_2
	{
		name = "bodyfall_wood_2";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\bodyfall_wood_2.ogg", db+20, 1};
		titles[] = {};
	};	
	class bodyfall_wood_3
	{
		name = "bodyfall_wood_3";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\bodyfall_wood_3.ogg", db+20, 1};
		titles[] = {};
	};
	class device_puls
	{
		name = "device_puls";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\device_puls.ogg",1, 1};
		titles[] = {};
	};
	class puls_bass
	{
		name = "puls_bass";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\puls_bass.ogg", db+10, 1};
		titles[] = {};
	};
	class charge_b
	{
		name = "charge_b";
		sound[] = {"\Root_Anomalies\Root_Burper\sounds\charge_b.ogg", db+5, 1};
		titles[] = {};
	};
};


class CfgFunctions
{
	class Root
	{
		class RootBurperCategory
		{
			class Burper {file = "\Root_Anomalies\Root_Burper\AL_burper\init_burper.sqf";};
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
	class Burper_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Burper";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Burper";
		displayName = "Burper Anomaly";
	};
};