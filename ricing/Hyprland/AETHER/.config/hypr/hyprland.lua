-- hyprland.lua

--
----
------ ################################################################## ---
------ #                                                                # ---
------ #         █████╗ ███████╗████████╗██╗  ██╗███████╗██████╗        # ---
------ #        ██╔══██╗██╔════╝╚══██╔══╝██║  ██║██╔════╝██╔══██╗       # ---
------ #        ███████║█████╗     ██║   ███████║█████╗  ██████╔╝       # ---
------ #        ██╔══██║██╔══╝     ██║   ██╔══██║██╔══╝  ██╔══██╗       # ---
------ #        ██║  ██║███████╗   ██║   ██║  ██║███████╗██║  ██║       # ---
------ #        ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝       # ---
------ #                                                                # ---
------ # AESTHETIC ENVIRONMENT using TRVE HYPRLAND ELEMENTAL REACTIVITY # ---
------ #        Modular LUA Configuration for Hyprland 0.55+            # ---
------ #                                                                # ---
------ ################################################################## ---
-----
----
---     Copyright (C) 2026, Nicolas Scalese
--      Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html
---
----
-----
------
-------
--------  Make sure you edit this configuration based on your needs.
--------  Check out the official documentation:  
----------   https://wiki.hypr.land/Configuring/Start/
--------  Or the official example config:
----------   https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
---------
------
----
--



-- [ SYSTEM CORE ] -------------------------------------------------------------------
require("modules.vars")           -- Environment & Paths
require("modules.monitors")       -- Display Layouts
require("modules.autostart")      -- Startup Applications
-- require("modules.permissions")    -- Permissions for the apps (currenty empty)

-- [ APPEARANCE & LOGIC ] ------------------------------------------------------------
require("modules.theme")          -- Aesthetics
require("modules.input")          -- Device Rules
require("modules.keybindings")    -- Control Scheme
require("modules.winrules")       -- Window Behavior (Tearing & Tiling)

-- [ INITIALIZATION ] ----------------------------------------------------------------
print(":: A.E.T.H.E.R. Loaded ::")

