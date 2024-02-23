import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO
import System.Directory
import XMonad.Config.Desktop
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig

myLayout = tiled ||| Mirror tiled ||| Full ||| ThreeCol 1 (1/100) (1/3)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
  xmonad $ def {
    manageHook = manageDocks <+> manageHook def,
    layoutHook = avoidStruts $ desktopLayoutModifiers (myLayout),
    handleEventHook = fullscreenEventHook <+> docksEventHook,
    logHook = dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppOrder  = (\(ws:lo:_) -> [ws, lo]) },
    startupHook = spawn "S=~/.xmonad/xsessionrc; [ -x $S ] && $S"
    }
    `additionalKeysP`
    [ ("M-C-l", spawn "xscreensaver-command -lock")
    ]
    `additionalKeys`
    [ ((0, 0x1008ff12), spawn "amixer set Master toggle"),
      ((0, 0x1008ff11), spawn "amixer set Master 5%-"),
      ((0, 0x1008ff13), spawn "amixer set Master 5%+"),
      ((0, 0x1008ffb2), spawn "amixer set Capture toggle"),
      ((0, 0x1008ff02), spawn "brightnessctl set 10+"),
      ((0, 0x1008ff03), spawn "brightnessctl set 10-")
    ]
