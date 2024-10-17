#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
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
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Modules_F_Curator",
            "cba_main",
			"zen_custom_modules"
        };
        author = "Root";
        authors[] = {
            "Root"
        };
        url = "https://github.com/A3-Root/A3-Root-Modules";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgContext.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVersioning.hpp"
#include "gui.hpp"