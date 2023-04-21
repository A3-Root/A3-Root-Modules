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
	class Root_UFO_Effects
	{
		addonRootClass = "Root_Effects";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Effects", "zen_custom_modules"};
		requiredVersion = 0.1;
		units[] = {"UFO_Module", "Seeker_Module", "Cropcircle_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class final_boom
	{
		name = "final_boom";
		sound[] = {"\Root_Effects\Root_UFO\sound\final_boom.ogg",1,1};
		titles[] = {1, ""};
	};
	class charge_complete
	{
		name = "charge_complete";
		sound[] = {"\Root_Effects\Root_UFO\sound\charge_complete.ogg",1,1};
		titles[] = {1, ""};
	};
	class static
	{
		name = "static";
		sound[] = {"\Root_Effects\Root_UFO\sound\static.ogg",0.05,1};
		titles[] = {1, ""};
	};
	class charge_1
	{
		name = "charge_1";
		sound[] = {"\Root_Effects\Root_UFO\sound\charge_1.ogg",1,1};
		titles[] = {1, ""};
	};
	class charge_2
	{
		name = "charge_2";
		sound[] = {"\Root_Effects\Root_UFO\sound\charge_2.ogg",1,1};
		titles[] = {1, ""};
	};
	class ufo_cross
	{
		name = "ufo_cross";
		sound[] = {"\Root_Effects\Root_UFO\sound\ufo_cross.ogg",1,1};
		titles[] = {1, ""};
	};
	class crop_me
	{
		name = "crop_me";
		sound[] = {"\Root_Effects\Root_UFO\sound\crop_me.ogg",1,1};
		titles[] = {1, ""};
	};
	class aterizat
	{
		name = "aterizat";
		sound[] = {"\Root_Effects\Root_UFO\sound\aterizat.ogg",1,1};
		titles[] = {1, ""};
	};
	class cutremur
	{
		name = "cutremur";
		sound[] = {"\Root_Effects\Root_UFO\sound\cutremur.ogg",1,1};
		titles[] = {1, ""};
	};

};



class CfgFunctions
{
	class Root
	{
		class RootUFOCategory
		{
			class UFO {file = "\Root_Effects\Root_UFO\AL_ufo\init_ufo.sqf";};
			class Seeker {file = "\Root_Effects\Root_UFO\AL_ufo\init_seeker.sqf";};
			class Cropcircle {file = "\Root_Effects\Root_UFO\AL_ufo\init_cropcircle.sqf";};
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
	class UFO_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "UFO_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_UFO";		
		displayName = "UFO";
	};
	class Seeker_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Seeker_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Seeker";		
		displayName = "UFO Seeker";
	};
	class Cropcircle_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Cropcircle_Module";
		category = "ROOT_EFFECTS";
		function = "Root_fnc_Cropcircle";		
		displayName = "UFO Cropcircle";
	};
};