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
	class Root_Ambient_Effect
	{
		addonRootClass = "Root_Effects";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Effects","zen_custom_modules"};
		requiredVersion = 0.1;
		units[] = {"Fireflies_Module", "Aurora_Module", "Rupture_Module", "Sparks_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	class spark1
	{
		name = "spark1";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark1.ogg", db+5, 1};
		titles[] = {};
	};
	class spark11
	{
		name = "spark11";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark11.ogg", db+5, 1};
		titles[] = {};
	};
	class spark2
	{
		name = "spark2";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark2.ogg", db+5, 1};
		titles[] = {};
	};		
	class spark22
	{
		name = "spark22";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark22.ogg", db+5, 1};
		titles[] = {};
	};	
	class spark3	
	{
		name = "spark3";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark3.ogg", db+5, 1};
		titles[] = {};
	};
	class spark4	
	{
		name = "spark4";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark4.ogg", db+5, 1};
		titles[] = {};
	};
	class spark5	
	{
		name = "spark5";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\spark5.ogg", db+5, 1};
		titles[] = {};
	};
	class broasca_3
	{
		name = "broasca_3";
		sound[] = {"\Root_Effects\Root_AmbientSFX\sound\broasca_3.ogg", 1, 1};
		titles[] = {1, ""};
	};
};


class CfgFunctions
{
	class Root
	{
		class RootAmbientCategory
		{
			class Fireflies {file = "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\init_ambient_fireflies.sqf";};
			class Aurora {file = "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\init_ambient_aurora.sqf";};
			class Rupture {file = "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\init_ambient_rupture.sqf";};
			class Sparks {file = "\Root_Effects\Root_AmbientSFX\AL_ambient_SFX\init_ambient_sparks.sqf";};
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
	class Fireflies_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Fireflies_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Fireflies";
		displayName = "Ambient Fireflies";
	};
	class Aurora_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Aurora_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Aurora";
		displayName = "Aurora Borealis";
	};
	class Rupture_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Rupture_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Rupture";
		displayName = "Spacetime Rupture";
	};
	class Sparks_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Sparks_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Sparks";
		displayName = "Ambient Sparks";
	};
};
