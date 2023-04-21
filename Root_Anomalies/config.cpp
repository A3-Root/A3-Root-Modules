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
	class Root_Anomalies
	{
		name = "Root's Anomalies";
		author = "Root";
		requiredAddons[] = {"A3_Modules_F_Curator", "cba_main", "zen_custom_modules"};
		requiredVersion = 0.1;
		units[] = {"Farmer_Module","Flamer_Module","Smuggler_Module","Steamer_Module","Strigoi_Module","Swarmer_Module","Worm_Module","Burper_Module","Twins_Module","Screamer_Module"};
		weapons[] = {};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class ROOT_ANOMALIES : NO_CATEGORY {
		displayName = "Root's Anomalies";
	};
};