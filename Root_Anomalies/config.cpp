class CfgPatches {
	class ROOT_Anomalies {
		name = "Root's Anomalies";
		author = "Root";
		units[] = {
			"Farmer_Module",
			"Flamer_Module",
			"Smuggler_Module",
			"Steamer_Module",
			"Strigoi_Module",
			"Swarmer_Module",
			"Worm_Module",
			"Burper_Module",
			"Twins_Module",
			"Screamer_Module"
		};
		requiredAddons[] = {
			"A3_Modules_F_Curator", 
			"cba_main", 
			"zen_custom_modules"
		};
		weapons[] = {};
	};
};

class CfgFactionClasses {
	class NO_CATEGORY;
	class ROOT_ANOMALIES : NO_CATEGORY {
		displayName = "Root's Anomalies";
	};
};

class CfgFunctions {
	class ROOT {
		tag="Root_Anomalies";
		class Anomalies {
			file="\Root_Anomalies\functions";	
			class burper{};
			class farmer{};
			class flamer{};
			class screamer{};
			class smuggler{};
			class steamer{};
			class strigoi{};
			class swarmer{};
			class twins{};
			class worm{};
		};
	};
};

class CfgVehicles {
	class zen_modules_moduleBase;
	class Burper_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Burper";
		scope = 1;
		scopeCurator = 2;
		displayName = "Burper Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Burper";
	};
	class Farmer_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Farmer";
		scope = 1;
		scopeCurator = 2;
		displayName = "Farmer Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Farmer";
	};
	class Flamer_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Flamer";
		scope = 1;
		scopeCurator = 2;
		displayName = "Flamer Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Flamer";
	};
	class Screamer_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Screamer";
		scope = 1;
		scopeCurator = 2;
		displayName = "Screamer Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Screamer";
	};
	class Smuggler_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Smuggler";
		scope = 1;
		scopeCurator = 2;
		displayName = "Smuggler Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Smuggler";
	};
	class Steamer_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Steamer";
		scope = 1;
		scopeCurator = 2;
		displayName = "Steamer Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Steamer";
	};
	class Strigoi_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Strigoi";
		scope = 1;
		scopeCurator = 2;
		displayName = "Strigoi Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Strigoi";
	};
	class Swarmer_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Swarmer";
		scope = 1;
		scopeCurator = 2;
		displayName = "Swarmer Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Swarmer";
	};
	class Twins_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Twins";
		scope = 1;
		scopeCurator = 2;
		displayName = "Twins Anomaly";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Twins";
	};
	class Worm_Module: zen_modules_moduleBase {
		author = "Root";
		_generalMacro = "Worm_Module";
		category = "ROOT_ANOMALIES";
		function = "Root_fnc_Worm";
		displayName = "Worm Anomaly";
	};
};

class Extended_PostInit_EventHandlers {
	class RootPostInitSwarmer 	{
		init = "call compile preprocessFileLineNumbers '\Root_Anomalies\scripts\Swarmer\postinit_swarmer.sqf'";
		disableModuload = 1;
	};
	class RootPostInitWorm 	{
		init = "call compile preprocessFileLineNumbers '\Root_Anomalies\scripts\Worm\postinit_worm.sqf'";
		disableModuload = 1;
	};
};

class CfgSounds {
	class bones_drop {
		name = "bones_drop";
		sound[] = {"\Root_Anomalies\sounds\bones_drop.ogg", db+30, 1};
		titles[] = {};
	};
	class blood_splash {
		name = "blood_splash";
		sound[] = {"\Root_Anomalies\sounds\blood_splash.ogg", db+35, 1};
		titles[] = {};
	};
	class 01_blast {
		name = "01_blast";
		sound[] = {"\Root_Anomalies\sounds\01_blast.ogg", db+30, 1};
		titles[] = {};
	};
	class 02_blast {
		name = "02_blast";
		sound[] = {"\Root_Anomalies\sounds\02_blast.ogg", db+30, 1};
		titles[] = {};
	};
	class 03_blast {
		name = "03_blast";
		sound[] = {"\Root_Anomalies\sounds\03_blast.ogg", db+30, 1};
		titles[] = {};
	};
	
	class 01_blast_mediu {
		name = "01_blast_mediu";
		sound[] = {"\Root_Anomalies\sounds\01_blast.ogg", db+40, 1};
		titles[] = {};
	};
	class 02_blast_mediu {
		name = "02_blast_mediu";
		sound[] = {"\Root_Anomalies\sounds\02_blast.ogg", db+40, 1};
		titles[] = {};
	};
	class 03_blast_mediu {
		name = "03_blast_mediu";
		sound[] = {"\Root_Anomalies\sounds\03_blast.ogg", db+40, 1};
		titles[] = {};
	};
	
	class 01_far_blast {
		name = "01_far_blast";
		sound[] = {"\Root_Anomalies\sounds\01_far_blast.ogg", db+15, 1};
		titles[] = {};
	};	
	class 02_far_blast {
		name = "02_far_blast";
		sound[] = {"\Root_Anomalies\sounds\02_far_blast.ogg", db+20, 1};
		titles[] = {};
	};	
	class 03_far_blast {
		name = "03_far_blast";
		sound[] = {"\Root_Anomalies\sounds\03_far_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class vortex {
		name = "vortex";
		sound[] = {"\Root_Anomalies\sounds\vortex.ogg", db+40, 1};
		titles[] = {};
	};
	class strigat_1 {
		name = "strigat_1";
		sound[] = {"\Root_Anomalies\sounds\strigat_1.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_2 {
		name = "strigat_2";
		sound[] = {"\Root_Anomalies\sounds\strigat_2.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_3 {
		name = "strigat_3";
		sound[] = {"\Root_Anomalies\sounds\strigat_3.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_4 {
		name = "strigat_4";
		sound[] = {"\Root_Anomalies\sounds\strigat_4.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_5 {
		name = "strigat_5";
		sound[] = {"\Root_Anomalies\sounds\strigat_5.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_6 {
		name = "strigat_6";
		sound[] = {"\Root_Anomalies\sounds\strigat_6.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_7 {
		name = "strigat_7";
		sound[] = {"\Root_Anomalies\sounds\strigat_7.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_8 {
		name = "strigat_8";
		sound[] = {"\Root_Anomalies\sounds\strigat_8.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_9 {
		name = "strigat_9";
		sound[] = {"\Root_Anomalies\sounds\strigat_9.ogg",db+20, 1};
		titles[] = {};
	};
	class strigat_91 {
		name = "strigat_91";
		sound[] = {"\Root_Anomalies\sounds\strigat_91.ogg", db+20, 1};
		titles[] = {};
	};
	class strigat_92 {
		name = "strigat_92";
		sound[] = {"\Root_Anomalies\sounds\strigat_92.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_metal_3 {
		name = "bodyfall_metal_3";
		sound[] = {"\Root_Anomalies\sounds\bodyfall_metal_3.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_1 {
		name = "bodyfall_wood_1";
		sound[] = {"\Root_Anomalies\sounds\bodyfall_wood_1.ogg", db+20, 1};
		titles[] = {};
	};
	class bodyfall_wood_2 {
		name = "bodyfall_wood_2";
		sound[] = {"\Root_Anomalies\sounds\bodyfall_wood_2.ogg", db+20, 1};
		titles[] = {};
	};	
	class bodyfall_wood_3 {
		name = "bodyfall_wood_3";
		sound[] = {"\Root_Anomalies\sounds\bodyfall_wood_3.ogg", db+20, 1};
		titles[] = {};
	};
	class device_puls {
		name = "device_puls";
		sound[] = {"\Root_Anomalies\sounds\device_puls.ogg",1, 1};
		titles[] = {};
	};
	class puls_bass {
		name = "puls_bass";
		sound[] = {"\Root_Anomalies\sounds\puls_bass.ogg", db+10, 1};
		titles[] = {};
	};
	class charge_b {
		name = "charge_b";
		sound[] = {"\Root_Anomalies\sounds\charge_b.ogg", db+5, 1};
		titles[] = {};
	};
	class explozie_3 {
		name = "explozie_3";
		sound[] = {"\Root_Anomalies\sounds\explozie_3.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class eko {
		name = "eko";
		sound[] = {"\Root_Anomalies\sounds\eko.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class pietre {
		name = "pietre";
		sound[] = {"\Root_Anomalies\sounds\pietre.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_1 {
		name = "punch_1";
		sound[] = {"\Root_Anomalies\sounds\punch_1.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_2 {
		name = "punch_2";
		sound[] = {"\Root_Anomalies\sounds\punch_2.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_3 {
		name = "punch_3";
		sound[] = {"\Root_Anomalies\sounds\punch_3.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_4 {
		name = "punch_4";
		sound[] = {"\Root_Anomalies\sounds\punch_4.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_5 {
		name = "punch_5";
		sound[] = {"\Root_Anomalies\sounds\punch_5.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_6 {
		name = "punch_6";
		sound[] = {"\Root_Anomalies\sounds\punch_6.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class punch_7 {
		name = "punch_7";
		sound[] = {"\Root_Anomalies\sounds\punch_7.ogg", db+1, 1.0};
		titles[] = {0, ""};	
	};
	class flamer_voice {
		name = "flamer_voice";
		sound[] = {"\Root_Anomalies\sounds\flamer_voice.ogg", db+5, 1};
		titles[] = {};
	};
	class 04_blast {
		name = "04_blast";
		sound[] = {"\Root_Anomalies\sounds\04_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class 05_blast {
		name = "05_blast";
		sound[] = {"\Root_Anomalies\sounds\05_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class 06_blast {
		name = "06_blast";
		sound[] = {"\Root_Anomalies\sounds\06_blast.ogg", db+10, 1};
		titles[] = {};
	};
	class furnal {
		name = "furnal";
		sound[] = {"\Root_Anomalies\sounds\furnal.ogg",1, 1};
		titles[] = {1, ""};
	};
	class burned {
		name = "burned";
		sound[] = {"\Root_Anomalies\sounds\burned.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class close_bomb {
		name = "close_bomb";
		sound[] = {"\Root_Anomalies\sounds\close_bomb.ogg",db+30, 1};
		titles[] = {};
	};
	class eko_sharp {
		name = "eko_sharp";
		sound[] = {"\Root_Anomalies\sounds\eko_sharp.ogg",1, 1};
		titles[] = {};
	};
	class eko_bomb {
		name = "eko_bomb";
		sound[] = {"\Root_Anomalies\sounds\eko_bomb.ogg",1, 1};
		titles[] = {};
	};
	class foc_initial {
		name = "foc_initial";
		sound[] = {"\Root_Anomalies\sounds\foc_initial.ogg",1, 1};
		titles[] = {};
	};
	class NoSound {
		name = "NoSound";
		sound[] = {"", 0, 1};
		titles[] = {0, ""};
	};	
	class 02 {
		name = "02";
		sound[] = {"\Root_Anomalies\sounds\02.ogg",1, 1};
		titles[] = {1, ""};
	};	
	class 04 {
		name = "04";
		sound[] = {"\Root_Anomalies\sounds\04.ogg",1, 1};
		titles[] = {1, ""};
	};
	class 03 {
		name = "03";
		sound[] = {"\Root_Anomalies\sounds\03.ogg",1, 1};
		titles[] = {1, ""};
	};
	class miscare_screamer {
		name = "miscare_screamer";
		sound[] = {"\Root_Anomalies\sounds\miscare_screamer.ogg", db+20, 1};
		titles[] = {};
	};
	class scream {
		name = "scream";
		sound[] = {"\Root_Anomalies\sounds\scream.ogg", db+20, 1};
		titles[] = {};
	};
	class ecou {
		name = "ecou";
		sound[] = {"\Root_Anomalies\sounds\ecou.ogg", db+20, 1};
		titles[] = {};
	};		
	class stones_scream {
		name = "stones_scream";
		sound[] = {"\Root_Anomalies\sounds\stones_scream.ogg", db+20, 1};
		titles[] = {};
	};	
	class teleport_screamer {
		name = "teleport_screamer";
		sound[] = {"\Root_Anomalies\sounds\teleport_screamer.ogg", db+10, 1};
		titles[] = {};
	};
	class earthquakes {
		name = "earthquakes";
		sound[] = {"\Root_Anomalies\sounds\earthquakes.ogg", 1, 1};
		titles[] = {};
	};
	class telep_01 {
		name = "telep_01";
		sound[] = {"\Root_Anomalies\sounds\telep_01.ogg", db+5, 1};
		titles[] = {};
	};
	class telep_02 {
		name = "telep_02";
		sound[] = {"\Root_Anomalies\sounds\telep_02.ogg", db+5, 1};
		titles[] = {};
	};	
	class telep_03 {
		name = "telep_03";
		sound[] = {"\Root_Anomalies\sounds\telep_03.ogg", db+5, 1};
		titles[] = {};
	};	
	class telep_04 {
		name = "telep_04";
		sound[] = {"\Root_Anomalies\sounds\telep_04.ogg", db+5, 1};
		titles[] = {};
	};
	class telep_05 {
		name = "telep_05";
		sound[] = {"\Root_Anomalies\sounds\telep_05.ogg", db+5, 1};
		titles[] = {};
	};		
	class tremor {
		name = "tremor";
		sound[] = {"\Root_Anomalies\sounds\tremor.ogg", db+5, 1};
		titles[] = {};
	};		
	class rafala_smug_01 {
		name = "rafala_smug_01";
		sound[] = {"\Root_Anomalies\sounds\rafala_smug_01.ogg", 1, 1};
		titles[] = {};
	};
	class rafala_smug_02 {
		name = "rafala_smug_02";
		sound[] = {"\Root_Anomalies\sounds\rafala_smug_02.ogg", 1, 1};
		titles[] = {};
	};
	class rafala_smug_03 {
		name = "rafala_smug_03";
		sound[] = {"\Root_Anomalies\sounds\rafala_smug_03.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_01 {
		name = "smugg_01";
		sound[] = {"\Root_Anomalies\sounds\smugg_01.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_02 {
		name = "smugg_02";
		sound[] = {"\Root_Anomalies\sounds\smugg_02.ogg", 1, 1};
		titles[] = {};
	};
	class smugg_03 {
		name = "smugg_03";
		sound[] = {"\Root_Anomalies\sounds\smugg_03.ogg", 1, 1};
		titles[] = {};
	};	
	class zoomin {
		name = "zoomin";
		sound[] = {"\Root_Anomalies\sounds\zoomin.ogg", db+25, 1};
		titles[] = {};
	};
	class tele_message {
		name = "tele_message";
		sound[] = {"\Root_Anomalies\sounds\tele_message.ogg", db+30, 1};
		titles[] = {};
	};	
	class halu_1 {
		name = "halu_1";
		sound[] = {"\Root_Anomalies\sounds\halu_1.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_2 {
		name = "halu_2";
		sound[] = {"\Root_Anomalies\sounds\halu_2.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_3 {
		name = "halu_3";
		sound[] = {"\Root_Anomalies\sounds\halu_3.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_4 {
		name = "halu_4";
		sound[] = {"\Root_Anomalies\sounds\halu_4.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_5 {
		name = "halu_5";
		sound[] = {"\Root_Anomalies\sounds\halu_5.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_6 {
		name = "halu_6";
		sound[] = {"\Root_Anomalies\sounds\halu_6.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_7 {
		name = "halu_7";
		sound[] = {"\Root_Anomalies\sounds\halu_7.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_8 {
		name = "halu_8";
		sound[] = {"\Root_Anomalies\sounds\halu_8.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_9 {
		name = "halu_9";
		sound[] = {"\Root_Anomalies\sounds\halu_9.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_91 {
		name = "halu_91";
		sound[] = {"\Root_Anomalies\sounds\halu_91.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_92 {
		name = "halu_92";
		sound[] = {"\Root_Anomalies\sounds\halu_92.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_93 {
		name = "halu_93";
		sound[] = {"\Root_Anomalies\sounds\halu_93.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_94 {
		name = "halu_94";
		sound[] = {"\Root_Anomalies\sounds\halu_94.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_95 {
		name = "halu_95";
		sound[] = {"\Root_Anomalies\sounds\halu_95.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_96 {
		name = "halu_96";
		sound[] = {"\Root_Anomalies\sounds\halu_96.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_97 {
		name = "halu_97";
		sound[] = {"\Root_Anomalies\sounds\halu_97.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_98 {
		name = "halu_98";
		sound[] = {"\Root_Anomalies\sounds\halu_98.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_99 {
		name = "halu_99";
		sound[] = {"\Root_Anomalies\sounds\halu_99.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_991 {
		name = "halu_991";
		sound[] = {"\Root_Anomalies\sounds\halu_991.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_992 {
		name = "halu_992";
		sound[] = {"\Root_Anomalies\sounds\halu_992.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_993 {
		name = "halu_993";
		sound[] = {"\Root_Anomalies\sounds\halu_993.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_994 {
		name = "halu_994";
		sound[] = {"\Root_Anomalies\sounds\halu_994.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_995 {
		name = "halu_995";
		sound[] = {"\Root_Anomalies\sounds\halu_995.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_996 {
		name = "halu_996";
		sound[] = {"\Root_Anomalies\sounds\halu_996.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_997 {
		name = "halu_997";
		sound[] = {"\Root_Anomalies\sounds\halu_997.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_998 {
		name = "halu_998";
		sound[] = {"\Root_Anomalies\sounds\halu_998.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_999 {
		name = "halu_999";
		sound[] = {"\Root_Anomalies\sounds\halu_999.ogg", db+10, 1};
		titles[] = {};
	};	
	class halu_9999 {
		name = "halu_9999";
		sound[] = {"\Root_Anomalies\sounds\halu_9999.ogg", db+10, 1};
		titles[] = {};
	};
	class explozie_2 {
		name = "explozie_2";
		sound[] = {"\Root_Anomalies\sounds\explozie_2.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
	class explozie_1 {
		name = "explozie_1";
		sound[] = {"\Root_Anomalies\sounds\explozie_1.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
	class gheizer_4 {
		name = "gheizer_4";
		sound[] = {"\Root_Anomalies\sounds\gheizer_4.ogg", db+5, 1};
		titles[] = {1, ""};
	};	
	class gheizer_3 {
		name = "gheizer_3";
		sound[] = {"\Root_Anomalies\sounds\gheizer_3.ogg", db+5, 1};
		titles[] = {1, ""};
	};		
	class gheizer_2 {
		name = "gheizer_2";
		sound[] = {"\Root_Anomalies\sounds\gheizer_2.ogg", db+5, 1};
		titles[] = {1, ""};
	};		
	class gheizer_1 {
		name = "gheizer_1";
		sound[] = {"\Root_Anomalies\sounds\gheizer_1.ogg", db+5, 1};
		titles[] = {1, ""};
	};
	class al_boil {
		name = "al_boil";
		sound[] = {"\Root_Anomalies\sounds\al_boil.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class boil_mic {
		name = "boil_mic";
		sound[] = {"\Root_Anomalies\sounds\boil_mic.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class vapori_01 {
		name = "vapori_01";
		sound[] = {"\Root_Anomalies\sounds\vapori_01.ogg",0.3, 1};
		titles[] = {1, ""};
	};
	class vapori_02 {
		name = "vapori_02";
		sound[] = {"\Root_Anomalies\sounds\vapori_02.ogg",0.5, 1};
		titles[] = {1, ""};
	};
	class vapori_03 {
		name = "vapori_03";
		sound[] = {"\Root_Anomalies\sounds\vapori_03.ogg",0.2, 1};
		titles[] = {1, ""};
	};
	class drops_01 {
		name = "drops_01";
		sound[] = {"\Root_Anomalies\sounds\drops_01.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class drops_02 {
		name = "drops_02";
		sound[] = {"\Root_Anomalies\sounds\drops_02.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class drops_03 {
		name = "drops_03";
		sound[] = {"\Root_Anomalies\sounds\drops_03.ogg",db+5, 1};
		titles[] = {1, ""};
	};
	class debris {
		name = "debris";
		sound[] = {"\Root_Anomalies\sounds\debris.ogg",0.3, 1};
		titles[] = {1, ""};
	};
	class steamer_01 {
		name = "steamer_01";
		sound[] = {"\Root_Anomalies\sounds\steamer_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class steamer_02 {
		name = "steamer_02";
		sound[] = {"\Root_Anomalies\sounds\steamer_02.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_01 {
		name = "tip_01";
		sound[] = {"\Root_Anomalies\sounds\tip_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_02 {
		name = "tip_02";
		sound[] = {"\Root_Anomalies\sounds\tip_02.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_03 {
		name = "tip_03";
		sound[] = {"\Root_Anomalies\sounds\tip_03.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_04 {
		name = "tip_04";
		sound[] = {"\Root_Anomalies\sounds\tip_04.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_05 {
		name = "tip_05";
		sound[] = {"\Root_Anomalies\sounds\tip_05.ogg",1, 1};
		titles[] = {1, ""};
	};
	class tip_06 {
		name = "tip_06";
		sound[] = {"\Root_Anomalies\sounds\tip_06.ogg",1, 1};
		titles[] = {1, ""};
	};
	class eko_01 {
		name = "eko_01";
		sound[] = {"\Root_Anomalies\sounds\eko_01.ogg",1, 1};
		titles[] = {1, ""};
	};
	class eko_02 {
		name = "eko_02";
		sound[] = {"\Root_Anomalies\sounds\eko_02.ogg",1, 1};
		titles[] = {1, ""};
	};
	class casp_voice {
		name = "casp_voice";
		sound[] = {"\Root_Anomalies\sounds\casp_voice.ogg", db+5, 1};
		titles[] = {};
	};
	class 01_salt {
		name = "01_salt";
		sound[] = {"\Root_Anomalies\sounds\01_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 02_salt {
		name = "02_salt";
		sound[] = {"\Root_Anomalies\sounds\02_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 03_salt {
		name = "03_salt";
		sound[] = {"\Root_Anomalies\sounds\03_salt.ogg", db+10, 1};
		titles[] = {};
	};
	class 01_tip_casp {
		name = "01_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\01_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 02_tip_casp {
		name = "02_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\02_tip_casp.ogg", db+0.8, 1};
		titles[] = {};
	};
	class 03_tip_casp {
		name = "03_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\03_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 04_tip_casp {
		name = "04_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\04_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 05_tip_casp {
		name = "05_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\05_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 06_tip_casp {
		name = "06_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\06_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};
	class 07_tip_casp {
		name = "07_tip_casp";
		sound[] = {"\Root_Anomalies\sounds\07_tip_casp.ogg", db+5, 1};
		titles[] = {};
	};	
	class 01_tease {
		name = "01_tease";
		sound[] = {"\Root_Anomalies\sounds\01_tease.ogg", db+1, 1};
		titles[] = {};
	};
	class 02_tease {
		name = "02_tease";
		sound[] = {"\Root_Anomalies\sounds\02_tease.ogg", db+0.9, 1};
		titles[] = {};
	};
	class 03_tease {
		name = "03_tease";
		sound[] = {"\Root_Anomalies\sounds\03_tease.ogg", db+1, 1};
		titles[] = {};
	};
	class 04_tease {
		name = "04_tease";
		sound[] = {"\Root_Anomalies\sounds\04_tease.ogg", db+1, 1};
		titles[] = {};
	};	
	class 01_atk_bg {
		name = "01_atk_bg";
		sound[] = {"\Root_Anomalies\sounds\01_atk_bg.ogg", db+1, 1};
		titles[] = {};
	};
	class 02_atk {
		name = "02_atk";
		sound[] = {"\Root_Anomalies\sounds\02_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class 03_atk {
		name = "03_atk";
		sound[] = {"\Root_Anomalies\sounds\03_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class 04_atk {
		name = "04_atk";
		sound[] = {"\Root_Anomalies\sounds\04_atk.ogg", db+1, 1};
		titles[] = {};
	};
	class puls {
		name = "puls";
		sound[] = {"\Root_Anomalies\sounds\puls.ogg", db+10, 1};
		titles[] = {};
	};
	class roi_02 {
		name = "roi_02";
		sound[] = {"\Root_Anomalies\sounds\roi_02.ogg",1,1};
		titles[] = {};
	};
	class roi_atk_01 {
		name = "roi_atk_01";
		sound[] = {"\Root_Anomalies\sounds\roi_atk_01.ogg",1,1};
		titles[] = {};
	};
	class roi_mort {
		name = "roi_mort";
		sound[] = {"\Root_Anomalies\sounds\roi_mort.ogg",1,1};
		titles[] = {};
	};
	class eating {
		name = "eating";
		sound[] = {"\Root_Anomalies\sounds\eating.ogg",1,1};
		titles[] = {};
	};
	class insect_03 {
		name = "insect_03";
		sound[] = {"\Root_Anomalies\sounds\insect_03.ogg",1,1};
		titles[] = {};
	};
	class insect_01 {
		name = "insect_01";
		sound[] = {"\Root_Anomalies\sounds\insect_01.ogg",1,1};
		titles[] = {};
	};
	class insect_04 {
		name = "insect_04";
		sound[] = {"\Root_Anomalies\sounds\insect_04.ogg",1,1};
		titles[] = {};
	};
	class insect_05 {
		name = "insect_05";
		sound[] = {"\Root_Anomalies\sounds\insect_05.ogg",1,1};
		titles[] = {};
	};
	class insect_07 {
		name = "insect_07";
		sound[] = {"\Root_Anomalies\sounds\insect_07.ogg",1,1};
		titles[] = {};
	};
	class insect_08 {
		name = "insect_08";
		sound[] = {"\Root_Anomalies\sounds\insect_08.ogg",1,1};
		titles[] = {};
	};
	class hive_queen_01 {
		name = "hive_queen_01";
		sound[] = {"\Root_Anomalies\sounds\hive_queen_01.ogg",1,1};
		titles[] = {};
	};
	class hive_queen_02 {
		name = "hive_queen_02";
		sound[] = {"\Root_Anomalies\sounds\hive_queen_02.ogg",1,1};
		titles[] = {};
	};
	class spark1 {
		name = "spark1";
		sound[] = {"\Root_Anomalies\sounds\spark1.ogg", db+30, 1};
		titles[] = {};
	};
	class spark11 {
		name = "spark11";
		sound[] = {"\Root_Anomalies\sounds\spark11.ogg", db+30, 1};
		titles[] = {};
	};
	class spark2 {
		name = "spark2";
		sound[] = {"\Root_Anomalies\sounds\spark2.ogg", db+30, 1};
		titles[] = {};
	};		
	class spark22 {
		name = "spark22";
		sound[] = {"\Root_Anomalies\sounds\spark22.ogg", db+30, 1};
		titles[] = {};
	};	
	class spark3 {
		name = "spark3";
		sound[] = {"\Root_Anomalies\sounds\spark3.ogg", db+30, 1};
		titles[] = {};
	};
	class spark4 {
		name = "spark4";
		sound[] = {"\Root_Anomalies\sounds\spark4.ogg", db+30, 1};
		titles[] = {};
	};
	class spark5 {
		name = "spark5";
		sound[] = {"\Root_Anomalies\sounds\spark5.ogg", db+30, 1};
		titles[] = {};
	};	
	class metalic1 {
		name = "metalic1";
		sound[] = {"\Root_Anomalies\sounds\metalic1.ogg", db+25, 1};
		titles[] = {};
	};
	class metalic2 {
		name = "metalic2";
		sound[] = {"\Root_Anomalies\sounds\metalic2.ogg", db+25, 1};
		titles[] = {};
	};
	class metalic3 {
		name = "metalic3";
		sound[] = {"\Root_Anomalies\sounds\metalic3.ogg", db+35, 1};
		titles[] = {};
	};
	class metalic4 {
		name = "metalic4";
		sound[] = {"\Root_Anomalies\sounds\metalic4.ogg", db+35, 1};
		titles[] = {};
	};
	class metalic5 {
		name = "metalic5";
		sound[] = {"\Root_Anomalies\sounds\metalic5.ogg", db+20, 1};
		titles[] = {};
	};
	class metalic6 {
		name = "metalic6";
		sound[] = {"\Root_Anomalies\sounds\metalic6.ogg", db+30, 1};
		titles[] = {};
	};
	class metalic7 {
		name = "metalic7";
		sound[] = {"\Root_Anomalies\sounds\metalic7.ogg", db+30, 1};
		titles[] = {};
	};
	class sound_twin {
		name = "sound_twin";
		sound[] = {"\Root_Anomalies\sounds\sound_twin.ogg", 1, 1};
		titles[] = {};
	};
	class murmur {
		name = "murmur";
		sound[] = {"\Root_Anomalies\sounds\murmur.ogg", 0.8, 1.0};
		titles[] = {0, ""};
	};
	class geiger {
		name = "geiger";
		sound[] = {"\Root_Anomalies\sounds\geiger.ogg", .7, 1.0};
		titles[] = {0, ""};
	};
	class earthquake_02 {
		name = "earthquake_02";
		sound[] = {"\Root_Anomalies\sounds\earthquake_02.ogg",0.7, 1};
		titles[] = {1, ""};
	};	
	class tiuit {
		name = "tiuit";
		sound[] = {"\Root_Anomalies\sounds\tiuit.ogg", 0.2, 1.0};
		titles[] = {0, ""};	
	};
	class idle_01 {
		name = "idle_01";
		sound[] = {"\Root_Anomalies\sounds\idle_01.ogg", db+5, 1};
		titles[] = {};
	};
	class idle_02 {
		name = "idle_02";
		sound[] = {"\Root_Anomalies\sounds\idle_02.ogg", db+10, 1};
		titles[] = {};
	};	
	class post_impact_01 {
		name = "post_impact_01";
		sound[] = {"\Root_Anomalies\sounds\post_impact_01.ogg", 1, 1};
		titles[] = {};
	};
	class post_impact_02 {
		name = "post_impact_02";
		sound[] = {"\Root_Anomalies\sounds\post_impact_02.ogg", 1, 1};
		titles[] = {};
	};		
	class post_impact_03 {
		name = "post_impact_03";
		sound[] = {"\Root_Anomalies\sounds\post_impact_03.ogg", 1, 1};
		titles[] = {};
	};	
	class post_impact_04 {
		name = "post_impact_04";
		sound[] = {"\Root_Anomalies\sounds\post_impact_04.ogg", 1, 1};
		titles[] = {};
	};
	class impact_30	{
		name = "impact_30";
		sound[] = {"\Root_Anomalies\sounds\impact_30.ogg",db+30, 1};
		titles[] = {};
	};	
	class impact_27 {
		name = "impact_27";
		sound[] = {"\Root_Anomalies\sounds\impact_27.ogg",db+30, 1};
		titles[] = {};
	};
	class salt_05 {
		name = "salt_05";
		sound[] = {"\Root_Anomalies\sounds\salt_05.ogg",db+20, 1};
		titles[] = {};
	};
	class salt_08 {
		name = "salt_08";
		sound[] = {"\Root_Anomalies\sounds\salt_08.ogg",db+20, 1};
		titles[] = {};
	};
	class move_01 {
		name = "move_01";
		sound[] = {"\Root_Anomalies\sounds\move_01.ogg",1, 1};
		titles[] = {};
	};
	class move_02 {
		name = "move_02";
		sound[] = {"\Root_Anomalies\sounds\move_02.ogg",1, 1};
		titles[] = {};
	};
	class move_03 {
		name = "move_03";
		sound[] = {"\Root_Anomalies\sounds\move_03.ogg",1, 1};
		titles[] = {};
	};
	class move_04 {
		name = "move_04";
		sound[] = {"\Root_Anomalies\sounds\move_04.ogg",1, 1};
		titles[] = {};
	};
	class move_05 {
		name = "move_05";
		sound[] = {"\Root_Anomalies\sounds\move_05.ogg",1, 1};
		titles[] = {};
	};
	class move_06 {
		name = "move_06";
		sound[] = {"\Root_Anomalies\sounds\move_06.ogg",1, 1};
		titles[] = {};
	};
	class move_07 {
		name = "move_07";
		sound[] = {"\Root_Anomalies\sounds\move_07.ogg",1, 1};
		titles[] = {};
	};
	class move_08 {
		name = "move_08";
		sound[] = {"\Root_Anomalies\sounds\move_08.ogg",1, 1};
		titles[] = {};
	};
	class move_09 {
		name = "move_09";
		sound[] = {"\Root_Anomalies\sounds\move_09.ogg",1, 1};
		titles[] = {};
	};
	class move_10 {
		name = "move_10";
		sound[] = {"\Root_Anomalies\sounds\move_10.ogg",1, 1};
		titles[] = {};
	};
	class move_11 {
		name = "move_11";
		sound[] = {"\Root_Anomalies\sounds\move_11.ogg",1, 1};
		titles[] = {};
	};
	class move_12 {
		name = "move_12";
		sound[] = {"\Root_Anomalies\sounds\move_12.ogg",1, 1};
		titles[] = {};
	};
	class move_13 {
		name = "move_13";
		sound[] = {"\Root_Anomalies\sounds\move_13.ogg",1, 1};
		titles[] = {};
	};
	class move_14 {
		name = "move_14";
		sound[] = {"\Root_Anomalies\sounds\move_14.ogg",1, 1};
		titles[] = {};
	};
	class move_15 {
		name = "move_15";
		sound[] = {"\Root_Anomalies\sounds\move_15.ogg",1, 1};
		titles[] = {};
	};
	class bump {
		name = "bump";
		sound[] = {"\Root_Anomalies\sounds\bump.ogg",db+20, 1};
		titles[] = {};
	};
	class strigat {
		name = "strigat";
		sound[] = {"\Root_Anomalies\sounds\strigat.ogg",db+20, 1};
		titles[] = {};
	};
};