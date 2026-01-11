local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Session restore plugin (like tmux-resurrect)
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- Periodic save every 15 minutes
resurrect.state_manager.periodic_save()

-- Font configuration (from ghostty)
config.font = wezterm.font_with_fallback {
	"FiraCode Nerd Font Mono",
	"UDEV Gothic 35NFLG",
}
config.font_size = 12.0
config.harfbuzz_features = { "calt=1", "liga=1", "dlig=0" }

-- Colors (matching ghostty defaults)
config.colors = {
	background = "#282c34",
	foreground = "#ffffff",

	ansi = {
		"#1d1f21", -- black
		"#cc6666", -- red
		"#b5bd68", -- green
		"#f0c674", -- yellow
		"#81a2be", -- blue
		"#b294bb", -- magenta
		"#8abeb7", -- cyan
		"#c5c8c6", -- white
	},
	brights = {
		"#666666", -- bright black
		"#d54e53", -- bright red
		"#b9ca4a", -- bright green
		"#e7c547", -- bright yellow
		"#7aa6da", -- bright blue
		"#c397d8", -- bright magenta
		"#70c0b1", -- bright cyan
		"#eaeaea", -- bright white
	},
}

-- Terminal type (true color support)
config.term = "xterm-256color"

-- Background opacity (from ghostty)
config.window_background_opacity = 0.95

-- Window configuration
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- Shell configuration (zsh from ghostty)
config.default_prog = { "/bin/zsh" }

-- Leader key (tmux prefix style: Ctrl+b)
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

-- Key bindings
config.keys = {
	-- Shift+Enter sends escape + return (from ghostty)
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x1b\r"),
	},
	-- Disable Ctrl+Shift+T (from ghostty)
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- tmux-pain-control style bindings
	-- Pane splitting
	{ key = "|", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

	-- Pane navigation (hjkl)
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Pane resize (repeatable like tmux-pain-control)
	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action.Multiple {
		wezterm.action.AdjustPaneSize { "Left", 5 },
		wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
	} },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action.Multiple {
		wezterm.action.AdjustPaneSize { "Down", 5 },
		wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
	} },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action.Multiple {
		wezterm.action.AdjustPaneSize { "Up", 5 },
		wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
	} },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action.Multiple {
		wezterm.action.AdjustPaneSize { "Right", 5 },
		wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
	} },

	-- Pane zoom (prefix + t)
	{ key = "t", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- Close pane
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane { confirm = true } },

	-- New tab
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	-- Tab navigation
	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },

	-- Copy mode
	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },

	-- Rename tab (like tmux prefix + ,)
	{ key = ",", mods = "LEADER", action = wezterm.action.PromptInputLine {
		description = "Rename tab:",
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	} },

	-- Show key bindings (prefix + ?)
	{ key = "?", mods = "LEADER|SHIFT", action = wezterm.action.ShowDebugOverlay },

	-- Session save/restore (like tmux-resurrect)
	-- prefix + Ctrl+s to save
	{ key = "s", mods = "LEADER|CTRL", action = wezterm.action_callback(function(win, pane)
		resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
		resurrect.window_state.save_window_action()
	end) },
	-- prefix + Ctrl+r to restore
	{ key = "r", mods = "LEADER|CTRL", action = wezterm.action_callback(function(win, pane)
		resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
			local state = resurrect.state_manager.load_state(id, "workspace")
			resurrect.state_manager.restore_state(state)
		end)
	end) },
}

-- Key tables
config.key_tables = {
	-- Resize pane mode (Shift+HJKL to resize, timeout 1s like tmux repeat-time)
	resize_pane = {
		{ key = "H", mods = "SHIFT", action = wezterm.action.Multiple {
			wezterm.action.AdjustPaneSize { "Left", 5 },
			wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
		} },
		{ key = "J", mods = "SHIFT", action = wezterm.action.Multiple {
			wezterm.action.AdjustPaneSize { "Down", 5 },
			wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
		} },
		{ key = "K", mods = "SHIFT", action = wezterm.action.Multiple {
			wezterm.action.AdjustPaneSize { "Up", 5 },
			wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
		} },
		{ key = "L", mods = "SHIFT", action = wezterm.action.Multiple {
			wezterm.action.AdjustPaneSize { "Right", 5 },
			wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 },
		} },
		{ key = "Escape", mods = "NONE", action = "PopKeyTable" },
	},

	-- Copy mode with vi-style keys (from tmux mode-keys vi)
	copy_mode = {
		{ key = "h", mods = "NONE", action = wezterm.action.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = wezterm.action.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = wezterm.action.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = wezterm.action.CopyMode("MoveRight") },
		{ key = "w", mods = "NONE", action = wezterm.action.CopyMode("MoveForwardWord") },
		{ key = "b", mods = "NONE", action = wezterm.action.CopyMode("MoveBackwardWord") },
		{ key = "0", mods = "NONE", action = wezterm.action.CopyMode("MoveToStartOfLine") },
		{ key = "$", mods = "NONE", action = wezterm.action.CopyMode("MoveToEndOfLineContent") },
		{ key = "g", mods = "NONE", action = wezterm.action.CopyMode("MoveToScrollbackTop") },
		{ key = "G", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToScrollbackBottom") },
		{ key = "v", mods = "NONE", action = wezterm.action.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "SHIFT", action = wezterm.action.CopyMode({ SetSelectionMode = "Line" }) },
		{
			key = "y",
			mods = "NONE",
			action = wezterm.action.Multiple({
				wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
				wezterm.action.CopyMode("Close"),
			}),
		},
		{ key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = wezterm.action.CopyMode("Close") },
	},
}

-- Scrollback buffer
config.scrollback_lines = 10000

-- Tab bar configuration (status line)
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.status_update_interval = 1000

-- Status line (right side)
wezterm.on("update-right-status", function(window, pane)
	local cwd = pane:get_current_working_dir()
	local git_branch = ""

	if cwd then
		local cwd_path = cwd.file_path
		local handle = io.popen("git -C " .. cwd_path .. " branch --show-current 2>/dev/null")
		if handle then
			git_branch = handle:read("*a"):gsub("%s+", "")
			handle:close()
		end
	end

	local date = wezterm.strftime("%Y-%m-%d %H:%M")
	local hostname = wezterm.hostname()

	local status = {}

	if git_branch ~= "" then
		table.insert(status, { Foreground = { Color = "#b5bd68" } })
		table.insert(status, { Text = "  " .. git_branch .. " " })
	end

	table.insert(status, { Foreground = { Color = "#81a2be" } })
	table.insert(status, { Text = " " .. hostname .. " " })

	table.insert(status, { Foreground = { Color = "#f0c674" } })
	table.insert(status, { Text = " " .. date .. " " })

	window:set_right_status(wezterm.format(status))
end)

return config
