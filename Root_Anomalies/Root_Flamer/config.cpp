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
	class Root_Flamer_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Flamer_Module"};
		weapons[] = {};
	};
};



class CfgSounds
{
	class flamer_voice
	{
		name = "flamer_voice";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\flamer_voice.ogg", db+5, 1};
		titles[] = {};
	};
	class 01_blast
	{
		name = "01_blast";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\01_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class 02_blast
	{
		name = "2";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\02_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class 03_blast
	{
		name = "03_blast";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\03_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class furnal
	{
		name = "furnal";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\furnal.ogg",1, 1};
		titles[] = {1, ""};
	};
	class burned
	{
		name = "burned";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\burned.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class close_bomb
	{
		name = "close_bomb";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\close_bomb.ogg",db+30, 1};
		titles[] = {};
	};
	class eko_sharp
	{
		name = "eko_sharp";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\eko_sharp.ogg",1, 1};
		titles[] = {};
	};
	class eko_bomb
	{
		name = "eko_bomb";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\eko_bomb.ogg",1, 1};
		titles[] = {};
	};
	class foc_initial
	{
		name = "foc_initial";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\foc_initial.ogg",1, 1};
		titles[] = {};
	};
	class NoSound 
	{
		name = "NoSound";
		sound[] = {"", 0, 1};
		titles[] = {0, ""};
	};	
	class 02
	{
		name = "02";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\02.ogg",1, 1};
		titles[] = {1, ""};
	};	
	class 04
	{
		name = "04";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\04.ogg",1, 1};
		titles[] = {1, ""};
	};
	class 03
	{
		name = "03";
		sound[] = {"\Root_Anomalies\Root_Flamer\sound\03.ogg",1, 1};
		titles[] = {1, ""};
	};
};



class CfgFunctions
{
	class Root
	{
		class RootFlamerCategory
		{
			class Flamer {file = "\Root_Anomalies\Root_Flamer\AL_flamer\init_flamer.sqf";};
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
	class Flamer_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Flamer_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Flamer";
		displayName = "Flamer Anomaly";
	};
};
