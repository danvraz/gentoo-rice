------------------------------------------------------------------
--HADES v2
-- Hyprland Lua Configuration
-- Author: Dan George
-- Theme: Minimal Monochrome Engineering
-- Target: Gentoo + Hyprland (Lua)
------------------------------------------------------------------

----------------------------------------------------
-- APPLICATIONS
----------------------------------------------------

local apps = {
    terminal    = "kitty",
    launcher    = "wofi --show drun",
    filemanager = "kitty -e yazi",
    lock        = "hyprlock",
    wallpaper   = "hyprpaper",
    bar         = "waybar",
    notify      = "dunst",
    polkit      = "/usr/libexec/polkit-gnome-authentication-agent-1",
}

----------------------------------------------------
-- MODIFIER
----------------------------------------------------

local mainMod = "SUPER"

----------------------------------------------------
-- MONITORS
----------------------------------------------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

----------------------------------------------------
-- ENVIRONMENT
----------------------------------------------------

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE","24")
hl.env("HYPRCURSOR_SIZE","24")
hl.env("QT_QPA_PLATFORM","wayland")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")
hl.env("GDK_BACKEND","wayland,x11")
hl.env("SDL_VIDEODRIVER","wayland")
hl.env("CLUTTER_BACKEND","wayland")

----------------------------------------------------
-- AUTOSTART
----------------------------------------------------

hl.on("hyprland.start",function()

    hl.exec_cmd(apps.wallpaper)

    hl.exec_cmd(apps.bar)

    hl.exec_cmd(apps.notify)

    hl.exec_cmd(apps.polkit)

end)

----------------------------------------------------
-- GENERAL
----------------------------------------------------

hl.config({

general = {

    layout = "dwindle",

    gaps_in = 3,

    gaps_out = 6,

    border_size = 2,

    resize_on_border = true,

    allow_tearing = false,

    snap = {
        enabled = true,
    },

    col = {

        active_border = {
            colors = {
                "rgba(d0d0d0ff)",
                "rgba(f5f5f5ff)"
            },
            angle = 0
        },

        inactive_border = "rgba(444444cc)"

    }

}

})

----------------------------------------------------
-- DECORATION
----------------------------------------------------

hl.config({

decoration = {

    rounding = 2,

    rounding_power = 2,

    active_opacity = 0.77,

    inactive_opacity = 0.70,

    fullscreen_opacity = 1.0,

    shadow = {

        enabled = true,

        range = 6,

        render_power = 3,

        color = "rgba(00000066)",

    },

    blur = {

        enabled = true,

        size = 0,

        passes = 4,

        vibrancy = 0.35,

        noise = 0,

    }

}

})

----------------------------------------------------
-- ANIMATIONS
----------------------------------------------------

hl.config({

animations = {

    enabled = true

}

})

hl.curve(
"ease",
{
type="bezier",
points={
{0.22,1},
{0.36,1}
}
})

hl.curve(
"smooth",
{
type="bezier",
points={
{0.25,0.1},
{0.25,1}
}
})

hl.animation({

leaf="border",

enabled=true,

speed=5,

bezier="ease"

})

hl.animation({

leaf="windows",

enabled=true,

speed=4.8,

bezier="smooth"

})

hl.animation({

leaf="windowsIn",

enabled=true,

speed=4,

style="popin 88%",

bezier="smooth"

})

hl.animation({

leaf="windowsOut",

enabled=true,

speed=2,

style="popin 88%",

bezier="ease"

})

hl.animation({

leaf="fade",

enabled=true,

speed=3,

bezier="ease"

})

hl.animation({

leaf="workspaces",

enabled=true,

speed=3.5,

style="slide",

bezier="smooth"

})
----------------------------------------------------
-- INPUT
----------------------------------------------------

hl.config({

input = {

    kb_layout = "us",

    kb_variant = "",

    kb_model = "",

    kb_options = "",

    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {

        natural_scroll = false,

        tap_to_click = true,

        disable_while_typing = true,

        clickfinger_behavior = true,

    }

}

})

----------------------------------------------------
-- DWINDLE LAYOUT
----------------------------------------------------

hl.config({

dwindle = {

    preserve_split = true,

    smart_split = false,

    smart_resizing = true,

}

})

----------------------------------------------------
-- MASTER LAYOUT
----------------------------------------------------

hl.config({

master = {

    new_status = "master"

}

})

----------------------------------------------------
-- SCROLLING
----------------------------------------------------

hl.config({

scrolling = {

    fullscreen_on_one_column = true

}

})

----------------------------------------------------
-- MISC
----------------------------------------------------

hl.config({

misc = {

    disable_hyprland_logo = true,

    force_default_wallpaper = 0,

    disable_splash_rendering = true,

   
}

})

----------------------------------------------------
-- WORKSPACES
----------------------------------------------------

for i = 1,9 do

    hl.bind(

        mainMod .. " + " .. i,

        hl.dsp.focus({

            workspace = i

        })

    )

    hl.bind(

        mainMod .. " + SHIFT + " .. i,

        hl.dsp.window.move({

            workspace = i

        })

    )

end

----------------------------------------------------
-- KEYBINDS
----------------------------------------------------

hl.bind(

mainMod .. " + RETURN",

hl.dsp.exec_cmd(apps.terminal)

)

hl.bind(

mainMod .. " + SPACE",

hl.dsp.exec_cmd(apps.launcher)

)

hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd("~/.config/wofi/power.sh")
)

hl.bind(

mainMod .. " + E",

hl.dsp.exec_cmd(apps.filemanager)

)

hl.bind(
    mainMod .. " + Print",
    hl.dsp.exec_cmd("~/.local/bin/screenshot")
)

hl.bind(

mainMod .. " + Q",

hl.dsp.window.close()

)

hl.bind(

mainMod .. " + F",

hl.dsp.window.fullscreen({

action="toggle"

})

)

hl.bind(

mainMod .. " + L",

hl.dsp.exec_cmd(apps.lock)

)

hl.bind(

mainMod .. " + P",

hl.dsp.exec_cmd("wlogout")

)

hl.bind(

mainMod .. " + SHIFT + R",

hl.dsp.exec_cmd("~/.local/bin/record-screen")

)

----------------------------------------------------
-- WINDOW MOVEMENT
----------------------------------------------------

hl.bind(

mainMod .. " + left",

hl.dsp.focus({

direction="left"

})

)

hl.bind(

mainMod .. " + right",

hl.dsp.focus({

direction="right"

})

)

hl.bind(

mainMod .. " + up",

hl.dsp.focus({

direction="up"

})

)

hl.bind(

mainMod .. " + down",

hl.dsp.focus({

direction="down"

})

)

----------------------------------------------------
-- MOUSE
----------------------------------------------------

hl.bind(

mainMod .. " + mouse:272",

hl.dsp.window.drag(),

{

mouse=true

})

hl.bind(

mainMod .. " + mouse:273",

hl.dsp.window.resize(),

{

mouse=true

})

----------------------------------------------------
-- MEDIA KEYS
----------------------------------------------------

hl.bind(

"XF86AudioRaiseVolume",

hl.dsp.exec_cmd(

"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"

),

{

locked=true,

repeating=true

})

hl.bind(

"XF86AudioLowerVolume",

hl.dsp.exec_cmd(

"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

),

{

locked=true,

repeating=true

})

hl.bind(

"XF86AudioMute",

hl.dsp.exec_cmd(

"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

),

{

locked=true

})

hl.bind(

"XF86MonBrightnessUp",

hl.dsp.exec_cmd(

"brightnessctl set +5%"

),

{

locked=true

})

hl.bind(

"XF86MonBrightnessDown",

hl.dsp.exec_cmd(

"brightnessctl set 5%-"

),

{

locked=true

})

----------------------------------------------------
-- WINDOW RULES
----------------------------------------------------


hl.window_rule({

name="pinentry",

match={

class="pinentry"

},

float=true,

center=true

})

hl.window_rule({

name="pavucontrol",

match={

class="pavucontrol"

},

float=true,

center=true,

size="55% 60%"

})

hl.window_rule({

name="nm-connection-editor",

match={

class="nm-connection-editor"

},

float=true,

center=true,

size="60% 70%"

})

hl.window_rule({

name="blueman",

match={

class="Blueman-manager"

},

float=true,

center=true

})

hl.window_rule({

name="wlogout",

match={

class="wlogout"

},

float=true,

center=true

})

----------------------------------------------------
-- XWAYLAND FIX
----------------------------------------------------

hl.window_rule({

name="fix-xwayland",

match={

class="^$",

title="^$",

xwayland=true,

float=true,

fullscreen=false,

pin=false

},

no_focus=true

})

----------------------------------------------------
-- END OF CONFIG
----------------------------------------------------
