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
	class Root_Strigoi_Anomaly
	{
		addonRootClass = "Root_Anomalies";
		requiredAddons[] = {"A3_Modules_F_Curator","cba_main","Root_Anomalies"};
		requiredVersion = 0.1;
		units[] = {"Strigoi_Module"};
		weapons[] = {};
	};
};


class CfgSounds
{
	class casp_voice
	{
		name = "casp_voice";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\casp_voice.ogg", db+5, 1};
		titles[] = {};
	};
	class 01_salt
	{
		name = "01_salt";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\01_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 02_salt
	{
		name = "2";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\02_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 03_salt
	{
		name = "03_salt";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\03_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 01_tip_casp
	{
		name = "01_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\01_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 02_tip_casp
	{
		name = "02_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\02_tip_casp.ogg", db+0.8, 1};
		titles[] = {};
	};
	class 03_tip_casp
	{
		name = "03_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\03_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 04_tip_casp
	{
		name = "04_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\04_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 05_tip_casp
	{
		name = "05_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\05_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 06_tip_casp
	{
		name = "06_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\06_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 07_tip_casp
	{
		name = "07_tip_casp";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\07_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};	
	class 01_tease
	{
		name = "01_tease";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\01_tease.ogg", db+1, 1};
		titles[] = {};
	};
	class 02_tease
	{
		name = "02_tease";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\02_tease.ogg", db+0.9, 1};
		titles[] = {};
	};
	class 03_tease
	{
		name = "03_tease";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\03_tease.ogg", db+1, 1};
		titles[] = {};
	};
	class 04_tease
	{
		name = "04_tease";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\04_tease.ogg", db+1, 1};
		titles[] = {};
	};	
	class NoSound 
	{
		name = "NoSound";
		sound[] = {"", 0, 1};
		titles[] = {0, ""};
	};	
	class 01_atk_bg
	{
		name = "01_atk_bg";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\01_atk_bg.ogg", db+1, 1};
		titles[] = {};
	};
	class 02_atk
	{
		name = "02_atk";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\02_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class 03_atk
	{
		name = "03_atk";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\03_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class 04_atk
	{
		name = "04_atk";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\04_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class tiuit
	{
		name = "tiuit";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\tiuit.ogg", db+0.2, 1.0};
		titles[] = {0, ""};	
	};
	class puls
	{
		name = "puls";
		sound[] = {"\Root_Anomalies\Root_Strigoi\sound\puls.ogg", db+10, 1};
		titles[] = {};
	};	
};


class CfgFunctions
{
	class Root
	{
		class RootStrigoiCategory
		{
			class Strigoi {file = "\Root_Anomalies\Root_Strigoi\AL_strigoi\init_strigoi.sqf";};
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
	class Strigoi_Module: zen_modules_moduleBase
	{
		author = "Root";
		_generalMacro = "Strigoi_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Strigoi";
		displayName = "Strigoi Anomaly";
	};
};





