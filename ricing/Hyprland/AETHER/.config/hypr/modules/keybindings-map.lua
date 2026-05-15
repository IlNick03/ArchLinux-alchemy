-- modules/keybindings-map.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html


----
---- Centralized Keybinding Registry
---- This module intercepts 'hl.bind' calls to store metadata for documentation.
----


local M = {}

-- The "Famous" Table: This stores every registered bind as a structured object
M.registry = {}

--- Registers a keybinding and stores it in the internal registry
-- @param keys string: The key combination (e.g., "SUPER + SHIFT + A")
-- @param dispatcher function/string: The action to execute
-- @param opts table: Optional flags (locked, repeating, description, etc.)
function M.bind(keys, dispatcher, opts)
    opts = opts or {}
    
    -- Store binding metadata for the UI/Terminal explorer
    table.insert(M.registry, {
        keys = keys,
        description = opts.description or "No description provided",
        dispatcher = tostring(dispatcher), -- Convert dispatcher to string for display
        flags = opts
    })

    -- Execute the actual Hyprland binding command
    hl.bind(keys, dispatcher, opts)
end

--- Returns the entire registry for external processing
-- Can be used to export binds to JSON or formatted text files
function M.get_registry()
    return M.registry
end

return M