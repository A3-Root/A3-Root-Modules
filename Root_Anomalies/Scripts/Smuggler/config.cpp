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
	class Root_Smuggler_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Smuggler_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class telep_01
	{
		name = "telep_01";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\telep_01.ogg", db+5, 1};
		titles[] = {};
	};
	class telep_02
	{
		name = "telep_02";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\telep_02.ogg", db+5, 1};
		titles[] = {};
	};	
	class telep_03
	{
		name = "telep_03";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\telep_03.ogg", db+5, 1};
		titles[] = {};
	};	
	class telep_04
	{
		name = "telep_04";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\telep_04.ogg", db+5, 1};
		titles[] = {};
	};
	class telep_05
	{
		name = "telep_05";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\telep_05.ogg", db+5, 1};
		titles[] = {};
	};		
	class tremor
	{
		name = "tremor";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\tremor.ogg", db+5, 1};
		titles[] = {};
	};		
	class rafala_smug_01
	{
		name = "rafala_smug_01";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\rafala_smug_01.ogg", 1, 1};
		titles[] = {};
	};
	class rafala_smug_02
	{
		name = "rafala_smug_02";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\rafala_smug_02.ogg", 1, 1};
		titles[] = {};
	};
	class rafala_smug_03
	{
		name = "rafala_smug_03";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\rafala_smug_03.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_01
	{
		name = "smugg_01";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\smugg_01.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_02
	{
		name = "smugg_02";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\smugg_02.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_03
	{
		name = "smugg_03";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\smugg_03.ogg", 1, 1};
		titles[] = {};
	};	
	class zoomin
	{
		name = "zoomin";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\zoomin.ogg", db+25, 1};
		titles[] = {};
	};	
	class strigat_1
	{
		name = "strigat_1";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_1.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_2
	{
		name = "strigat_2";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_2.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_3
	{
		name = "strigat_3";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_3.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_4
	{
		name = "strigat_4";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_4.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_5
	{
		name = "strigat_5";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_5.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_6
	{
		name = "strigat_6";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_6.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_7
	{
		name = "strigat_7";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_7.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_8
	{
		name = "strigat_8";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_8.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_9
	{
		name = "strigat_9";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_9.ogg",db+20, 1};
		titles[] = {};
	};
	class strigat_91
	{
		name = "strigat_91";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_91.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_92
	{
		name = "strigat_92";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\strigat_92.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_metal_3
	{
		name = "bodyfall_metal_3";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\bodyfall_metal_3.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_1
	{
		name = "bodyfall_wood_1";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\bodyfall_wood_1.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_2
	{
		name = "bodyfall_wood_2";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\bodyfall_wood_2.ogg", db+20, 1};
		titles[] = {};
	};	
	class bodyfall_wood_3
	{
		name = "bodyfall_wood_3";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\bodyfall_wood_3.ogg", db+20, 1};
		titles[] = {};
	};		
	class tele_message
	{
		name = "tele_message";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\tele_message.ogg", db+30, 1};
		titles[] = {};
	};	
	class puls
	{
		name = "puls";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\puls.ogg", db+10, 1};
		titles[] = {};
	};
	class halu_1
	{
		name = "halu_1";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_1.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_2
	{
		name = "halu_2";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_2.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_3
	{
		name = "halu_3";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_3.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_4
	{
		name = "halu_4";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_4.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_5
	{
		name = "halu_5";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_5.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_6
	{
		name = "halu_6";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_6.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_7
	{
		name = "halu_7";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_7.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_8
	{
		name = "halu_8";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_8.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_9
	{
		name = "halu_9";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_9.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_91
	{
		name = "halu_91";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_91.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_92
	{
		name = "halu_92";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_92.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_93
	{
		name = "halu_93";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_93.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_94
	{
		name = "halu_94";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_94.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_95
	{
		name = "halu_95";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_95.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_96
	{
		name = "halu_96";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_96.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_97
	{
		name = "halu_97";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_97.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_98
	{
		name = "halu_98";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_98.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_99
	{
		name = "halu_99";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_99.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_991
	{
		name = "halu_991";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_991.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_992
	{
		name = "halu_992";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_992.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_993
	{
		name = "halu_993";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_993.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_994
	{
		name = "halu_994";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_994.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_995
	{
		name = "halu_995";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_995.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_996
	{
		name = "halu_996";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_996.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_997
	{
		name = "halu_997";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_997.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_998
	{
		name = "halu_998";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_998.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_999
	{
		name = "halu_999";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_999.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_9999
	{
		name = "halu_9999";
		sound[] = {"\Root_Anomalies\Root_Smuggler\sounds\halu_9999.ogg", db+10, 1};
		titles[] = {};
	};	
};


class CfgFunctions
{
	class Root
	{
		class RootSmugglerCategory
		{
			class Smuggler {file = "\Root_Anomalies\Root_Smuggler\AL_smuggler\init_smuggler.sqf";};
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
	class Smuggler_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Smuggler_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Smuggler";
		displayName = "Smuggler Anomaly";
	};
};