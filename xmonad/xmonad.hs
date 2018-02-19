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

  xmonad $ defaultConfig
    { terminal = "termite"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig
    , focusedBorderColor = "#37b5a6"
    , normalBorderColor = "#000000"
    , startupHook = setWMName "LG3D"
    , modMask = mod4Mask
    , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
    , logHook = dynamicLogWithPP xmobarPP
                              { ppOutput = hPutStrLn xmproc
                              , ppTitle = xmobarColor "green" "" . shorten 80
                              }
    }
      `additionalKeys`
           ([ ((mod4Mask, xK_p), spawn "mmenu")
            , ((mod4Mask, xK_b), spawn background)
            , ((mod4Mask, xK_c), spawn "urxvt -e tty-clock")
            , ((mod4Mask, xK_v), spawn "urxvt -e sudo wifi-menu")
            , ((mod4Mask, xK_n), spawn "pcmanfm")
            , ((mod4Mask, xK_f), spawn "firefox")
            , ((mod4Mask, xK_z), spawn "sflock")
            , ((mod4Mask, xK_s), spawn "slack")
            , ((mod4Mask, xK_i), spawn "sh /home/spydon/bin/idea/bin/idea.sh")
            , ((mod4Mask, xK_F5), spawn "mpc previous")
            , ((mod4Mask, xK_F6), spawn "mpc next")
            , ((mod4Mask, xK_F7), spawn "mpc toggle")
            , ((mod4Mask, xK_x), sendMessage ToggleStruts)
            , ((mod4Mask, xK_Up), spawn "xbacklight +10")
            , ((mod4Mask, xK_Down), spawn "xbacklight -10") ]
            ++
            -- If the screens are in the wrong order
            [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
                 -- was [0..] *** change to match your screen order
                 | (key, sc) <- zip [xK_w, xK_e, xK_r] [0,2,1] 
                 , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]])
