
----------------
--- MONITORS ---
----------------
hl.monitor({output = "DP-2", mode = "3440x1440@180", position = "0x0", scale = 1, vrr = 1})
hl.monitor({output = "", mode = "preferred", position = "auto", scale = 1})

-------------------
--- MY PROGRAMS ---
-------------------
local terminal = "ghostty"
local fileManager = "dolphin"
local browser = "zen-browser"

-----------------
--- AUTOSTART ---
-----------------
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper & waybar")
end)

-- Environment Variables

hl.env("XCURSOR_SIZE", "24")

---------------------
--- LOOK AND FEEL ---
---------------------
hl.config({
	general = {
		border_size = 3,
		gaps_in = 5,
		gaps_out = 5,

		col = {
			active_border = {colors = {"rgba(d90201ff)", "rgba(720000ff)"}, angle = 45},
			inactive_border = "rgba(646464ff)",
		},

		resize_on_border = true,
		layout = "scrolling",
	},
	decoration = {
		rounding = 25,
		rounding_power = 3,

		active_opacity = .9,
		inactive_opacity = .8,
		fullscreen_opacity = 1,
		border_part_of_window = false,

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			noise = 0,
			contrast = 1.5,
			vibrancy = 0.5,
			vibrancy_darkness = 0.5,
		}
	},
	scrolling = {
		column_width = 0.333,
		focus_fit_method = 1,
		explicit_column_widths = "0.25, 0.333, 0.5, 0.667, 0.75, 1.0",
	},
	input = {
		kb_layout = "us",
		repeat_rate = 50,
		repeat_delay = 200,
		follow_mouse = 3,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		font_family = "MonoidNerdFont-Regular.ttf",
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
	}
})

hl.curosr = {
		no_warps = true,
		warp_on_change_workspace = 0,
	},

hl.curve("easeInOutBackDown", {type = "bezier", points = { {0.885, -0.48}, {0.272, 1.396} } })

hl.animation({ leaf = "global", enabled = true, speed = 1.0, bezier = "easeInOutBackDown"})
hl.animation({leaf = "windows", enabled = true, speed = 2.5, bezier = "easeInOutBackDown", style = "gnomed"})
hl.animation({leaf = "layers", enabled = true, speed = 2.5, bezier = "easeInOutBackDown", style = "popin"})
hl.animation({leaf = "workspaces", enabled = true, speed = 2.0, bezier = "easeInOutBackDown", style = "slidevert"})

-------------------
--- KEYBINDINGS ---
-------------------
hl.bind("SUPER + ALT + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + ALT + F", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q", hl.dsp.window.close())

hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show run"))

hl.bind("F7", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), {repeating = true })
hl.bind("F8", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), {repeating = true })

hl.bind("F12", hl.dsp.exec_cmd("hyprshot -m region -o ~/screen-shots/"))

-- move focus
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left"}))
-- hl.bind("SUPER + J", hl.dsp.focus({ direction = "down"}))
-- hl.bind("SUPER + K", hl.dsp.focus({ direction = "up"}))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right"}))

-- move windows left and right
hl.bind("SUPER + CTRL + H", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + CTRL + L", hl.dsp.layout("swapcol r"))

-- move between workspaces
-- move windows between workspaces
for i = 1, 5 do
	local key = i
	hl.bind("SUPER + " .. key, hl.dsp.focus({workspace = i}))
	hl.bind("SUPER + CTRL + " .. key, hl.dsp.window.move({ workspace = i}))
end

-- resize windows
hl.bind("SUPER + SHIFT + H", hl.dsp.layout("colresize -conf"))
hl.bind("SUPER + SHIFT + L", hl.dsp.layout("colresize +conf"))
hl.bind("SUPER + SHIFT + F", hl.dsp.layout("colresize 1.0"))

-- center window
hl.bind("SUPER + SHIFT + K", hl.dsp.layout("focus l"))
