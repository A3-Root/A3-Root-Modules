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
	class Root_Volcano_Effect
	{
		addonRootClass = "Root_Effects";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Effects","zen_custom_modules"};
		requiredVersion = 0.1;
		units[] = {"Volcano_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	// Definition for each sound
	class murmur_8
	{
		name = "murmur_8"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\murmur_8.ogg", db+10, 1.0};
		titles[] = {0, ""};	
	};		
	class eruptie_1
	{
		name = "eruptie_1";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_1.ogg", db+20, 1};
		titles[] = {};
	};		
	class eruptie_2
	{
		name = "eruptie_2";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_2.ogg", db+20, 1};
		titles[] = {};
	};	
	class eruptie_3
	{
		name = "eruptie_3";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_3.ogg", db+20, 1};
		titles[] = {};
	};
	class 05_far
	{
		name = "05_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\05_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};	
	class 06_far
	{
		name = "06_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\06_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};	
	class 08_far
	{
		name = "08_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\08_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};	
	class 14_far
	{
		name = "14_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\14_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};	
	class 21_far
	{
		name = "21_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\21_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};	
	class 26_far
	{
		name = "26_far"; // Name for mission editor
		sound[] = {"\Root_Effects\Root_Volcano\Sound\26_far.ogg", 1, 1.0};
		titles[] = {0, ""};
	};
	class eruptie_1_eko
	{
		name = "eruptie_1_eko";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_1_eko.ogg",0.5,1};
		titles[] = {};
	};
	class eruptie_2_eko
	{
		name = "eruptie_2_eko";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_2_eko.ogg",0.1,1};
		titles[] = {};
	};
	class eruptie_3_eko
	{
		name = "eruptie_3_eko";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\eruptie_3_eko.ogg",0.2,1};
		titles[] = {};
	};
	class earthquake_03
	{
		name = "earthquake_03";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\earthquake_03.ogg", 0.5, 1};
		titles[] = {1, ""};
	};
	class earthquake_02
	{
		name = "earthquake_02";
		sound[] = {"\Root_Effects\Root_Volcano\Sound\earthquake_02.ogg", 0.5, 1};
		titles[] = {1, ""};
	};
};


class CfgFunctions
{
	class Root
	{
		class RootVolcanoCategory
		{
			class Volcano {file = "\Root_Effects\Root_Volcano\AL_volcano\init_volcano.sqf";};
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

class CfgVehicles {
    class zen_modules_moduleBase;
	class Volcano_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Volcano_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Volcano";
		displayName = "Volcanic Eruption";
	};
};