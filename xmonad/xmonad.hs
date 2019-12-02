import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Actions.SpawnOn
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import System.IO

background = "feh --bg-fill ~/Pictures/`ls ~/Pictures | shuf -n 1`"
--myWorkspaces =    ["1:Browser", "2:Slack", "3:LaTeX", "4:IntelliJ"] 
--               ++ ["5:Webstorm", "6:IRC", "7:Notes",  "8", "9",  "0"]

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  spawn background

  xmonad $ def
    { terminal = "gnome-terminal"
    , manageHook = manageDocks <+> manageSpawn <+> manageHook def
    , layoutHook = smartBorders . avoidStruts $ layoutHook def
    , focusedBorderColor = "#37b5a6"
    , normalBorderColor = "#000"
    , borderWidth = 2
    , startupHook = setWMName "LG3D"
    , modMask = mod4Mask
    , handleEventHook = handleEventHook def <+> docksEventHook
    , logHook = dynamicLogWithPP xmobarPP
                              { ppOutput = hPutStrLn xmproc
                              , ppTitle = xmobarColor "green" "" . shorten 80
                              }
    }
      `additionalKeys`
           ([ ((mod4Mask, xK_p), spawn "rofi -show run -theme solarized -font 'hack 10'")
            , ((mod4Mask, xK_b), spawn background)
            , ((mod4Mask, xK_c), spawn "termite -e tty-clock")
            , ((mod4Mask, xK_v), spawn "termite -e 'sudo wifi-menu'")
            , ((mod4Mask, xK_n), spawn "pcmanfm")
            , ((mod4Mask, xK_f), spawn "firefox")
            , ((mod4Mask, xK_z), spawn "sxlock -u 'THIS COMPUTER IS TRACKED BY SATELITE' -f fixed")
            , ((mod4Mask, xK_s), spawn "slack")
            , ((mod4Mask, xK_u), spawn "sh ~/bin/android-studio/bin/studio.sh")
            , ((mod4Mask, xK_i), spawn "sh ~/bin/idea/bin/idea.sh")
            , ((mod4Mask, xK_a), spawn "sh ~/scripts/screenshot.sh")
            , ((mod4Mask, xK_x), sendMessage ToggleStruts)
            , ((mod4Mask, xK_Up), spawn "xbacklight +10")
            , ((mod4Mask, xK_Down), spawn "xbacklight -10") ]
            ++
            -- If the screens are in the wrong order
            [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
                 -- was [0..] *** change to match your screen order
                 | (key, sc) <- zip [xK_w, xK_e, xK_r] [2,1,0]
                 , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]])
