--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Image ( Placement( CenterLeft ), Placement( CenterRight ))
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarAction, xmobarStrip, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.SetWMName
import XMonad.Actions.Navigation2D
import XMonad.Actions.UpdateFocus
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.NoBorders
import XMonad.Layout.SimplestFloat
import XMonad.Layout.BorderResize (borderResize)
import Data.Maybe (isJust, fromJust)
import Data.List (elemIndex)
import System.Exit
import System.IO (hPutStrLn)
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "st"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["Home","Prog","Surf","Music","Draw","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#161616"
myFocusedBorderColor = "#888888"

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- Shortcuts
    [ ((modm              , xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_d     ), spawn "rofi -show combi -show-icons")
    , ((modm,               xK_e     ), spawn "rofimoji")
    , ((modm .|. shiftMask, xK_w     ), spawn "networkmanager_dmenu")
    , ((modm .|. shiftMask, xK_q     ), kill)
    -- Layout
    , ((modm,               xK_space   ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space   ), setLayout $ XMonad.layoutHook conf)
    -- , ((modm,               xK_n     ), refresh)
    -- Rotational Focus Movement
    , ((modm,               xK_Tab  ), windows W.focusDown)
    , ((modm .|. shiftMask, xK_Tab  ), windows W.focusUp)
    , ((modm .|. controlMask, xK_Tab), windows W.swapDown)
    , ((modm .|. controlMask .|. shiftMask, xK_Tab), windows W.swapUp)
    -- Directional Focus Movement
    , ((modm,               xK_h     ), windowGo L False)
    , ((modm,               xK_j     ), windowGo D False)
    , ((modm,               xK_k     ), windowGo U False  )
    , ((modm,               xK_l     ), windowGo R False)
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Directional Window Movement
    , ((modm .|. shiftMask, xK_h     ), windowSwap L False)
    , ((modm .|. shiftMask, xK_j     ), windowSwap D False)
    , ((modm .|. shiftMask, xK_k     ), windowSwap U False  )
    , ((modm .|. shiftMask, xK_l     ), windowSwap R False)
    , ((modm .|. shiftMask, xK_m     ), windows W.swapMaster  )
    -- Window resizing
    , ((modm .|. controlMask, xK_h   ), sendMessage $ ExpandTowards L)
    , ((modm .|. controlMask, xK_j   ), sendMessage $ ExpandTowards D)
    , ((modm .|. controlMask, xK_k   ), sendMessage $ ExpandTowards U)
    , ((modm .|. controlMask, xK_l   ), sendMessage $ ExpandTowards R)
    -- Rotations/Swappings
    , ((modm,               xK_r     ), sendMessage Rotate)
    , ((modm,               xK_s     ), sendMessage Swap)
    , ((modm,               xK_n     ), sendMessage FocusParent)
    , ((modm .|. controlMask, xK_n   ), sendMessage SelectNode)
    -- Other stuff
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- XMobar
    , ((modm              , xK_b     ), sendMessage ToggleStruts)
    -- Quitting
    , ((modm              , xK_0     ), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_0     ), spawn "xmonad --recompile; xmonad --restart")
    -- Function Keys
    , ((0                 , xF86XK_MonBrightnessUp     ), spawn "xbacklight -inc 5")
    , ((0                 , xF86XK_MonBrightnessDown     ), spawn "xbacklight -dec 5")
    , ((0                 , xF86XK_AudioRaiseVolume     ), spawn "pamixer --increase 5")
    , ((0                 , xF86XK_AudioLowerVolume     ), spawn "pamixer --decrease 5")
    , ((0                 , xF86XK_AudioMute     ), spawn "pamixer --toggle-mute")
    , ((0                 , xF86XK_AudioNext     ), spawn "playerctl next")
    , ((0                 , xF86XK_AudioPrev     ), spawn "playerctl previous")
    , ((0                 , xF86XK_AudioPlay     ), spawn "playerctl play-pause")
    -- Thinkpad keys
    , ((0                 , xF86XK_RotateWindows ), spawn "/home/luca/.local/bin/rotate-script.sh normal & nitrogen --restore")
    , ((0                 , xF86XK_TaskPane ), spawn "/home/luca/.local/bin/rotate-script.sh invert")
    , ((0                 , noSymbol ), spawn "xdotool key super+s")
    , ((0                 , xF86XK_ScreenSaver ), spawn "xdotool key super+r")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --     | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    --     , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = (avoidStruts . smartBorders) defaultLayouts
  where
     defaultLayouts =    borderResize emptyBSP
                      ||| borderResize simplestFloat
                      ||| Full
                      -- ||| imageButtonDeco shrinkText myTheme emptyBSP
                      -- ||| noBorders (imageButtonDeco shrinkText myTheme simplestFloat)

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = placeHook (withGaps (10,10,10,10) (smart (0.5,0.5)))
  <+> composeAll [
    className =? "Onboard" --> doFloat,
    className =? "Panther_launcher" --> doFloat]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = focusOnMouseMove <+> fullscreenEventHook

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
-- myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
myStartupHook = do
    spawnOnce "setxkbmap de -variant nodeadkeys -option caps:swapescape"
    spawnOnce "sudo bluetooth off"
    -- spawnOnce "xinput --set-prop \"TPPS/2 IBM TrackPoint\" \"libinput Accel Speed\" -0.6"
    spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
    spawnOnce "xinput disable \"ThinkPad Extra Buttons\""
    spawnOnce "redshift &"
    spawnOnce "nitrogen --restore &"
    spawnOnce "picom &"
    setWMName "LG3D"
    adjustEventInput

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ docks $ ewmh def
    {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = dynamicLogWithPP $ xmprocPP xmproc,
        startupHook        = myStartupHook
    }
    where
      showRofi = xmobarAction "rofi -show window" "1"
      changeLayout = xmobarAction "xdotool key super+space" "1"
      gotoWorkspace txt = xmobarAction ("xdotool key super+1"++show (getWorkspaceId txt)) "1" txt
      getWorkspaceId x = fromJust (elemIndex x myWorkspaces)
      applauncher = xmobarAction "jgmenu_run" "1" applauncherIcon
      applauncherIcon = "<icon=logo.xpm/>"
      xmprocPP h =
        xmobarPP {
          -- Current workspace in xmobar
            ppCurrent = xmobarColor "#c3e88d" "" . showRofi . wrap "[" "]"
          -- Visible but not current workspace
          , ppVisible = xmobarColor "#c3e88d" "" . gotoWorkspace
          -- Hidden workspaces in xmobar
          , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" "" . gotoWorkspace
          -- Hidden workspaces (no windows)
          , ppHiddenNoWindows = xmobarColor "#c792ea" "" . gotoWorkspace
          -- Urgent workspace
          , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!" . gotoWorkspace
          -- Separators in xmobar
          , ppSep = xmobarColor "#666666" "" "|"
          -- Title of active window in xmobar
          , ppTitle  = xmobarColor "#b3afc2" "" . shorten 60 . xmobarStrip
          , ppLayout = xmobarColor "#36A3D9" "" . changeLayout
          , ppOutput = hPutStrLn h
          , ppOrder  = \(ws:l:t:ex) -> [applauncher]++[ws,l]++ex++[t]}
          -- , ppOrder  = \(ws:l:t:_) -> [ws,l,t]}
