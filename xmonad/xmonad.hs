import XMonad
import qualified XMonad.StackSet as W

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

-- Layouts
import XMonad.Layout.Gaps
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing

-- Utils
import XMonad.Util.Run(spawnPipe)

-- Non-Xmonad stuff
import qualified Data.Map        as M
import System.IO


main = do
  bar <- spawnPipe ("dzen2 " ++ myDzenStyle1)
  xmonad $ defaultConfig
           { terminal           = myTerminal
           , modMask            = mod4Mask
           , borderWidth        = myBorderWidth
           , keys               = myKeys
           , normalBorderColor  = myNormalBorderColor
           , focusedBorderColor = myFocusedBorderColor
           , manageHook         = myManageHook
           , logHook            = dynamicLogWithPP $ myPP { ppOutput = hPutStrLn bar }
           , layoutHook         = myLayout
           , startupHook        = myStartupHook
           , workspaces         = myWorkspaces
           }

-- Startup
myStartupHook = do
  spawn "feh --bg-fill ~/vinyl.png"
  spawn ("while true; do echo -n '^fg(#e1aa5d)'; date +%H:%M; sleep 60; done | dzen2 -p " ++ myDzenStyle2)
  spawn ("~/etc/xmonad/dzen-irssi.sh | dzen2 " ++ myDzenStyle3)


-- Applications
myTerminal           = "urxvt"
myMenu               = "bashrun2"
myEditor             = "emacs"
myBrowser            = "firefox-bin"

-- Stuff
myFocusFollowsMouse  = False
myWorkspaces         = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
myBorderWidth        = 1
myNormalBorderColor  = "#090909"
myFocusedBorderColor = "#404040"
-- myFocusedBorderColor = "#e84f4f"

-- Bar
myDzenFont = "-jmk-neep-medium-r-normal--10-80-75-75-c-50-iso8859-1"
myDzenStyle1 = "-fn " ++ myDzenFont ++ " -h 17 -w 600 -ta l -bg '" ++ myNormalBorderColor ++ "'"
myDzenStyle2 = "-fn " ++ myDzenFont ++ " -h 17 -w 80 -x 600 -bg '" ++ myNormalBorderColor ++ "'"
myDzenStyle3 = "-fn " ++ myDzenFont ++ " -h 17 -w 600 -x 680 -ta r -bg '" ++ myNormalBorderColor ++ "'"
myPP = defaultPP { ppCurrent = dzenColor "#a0cf5d" "" . pad
                 , ppHidden  = dzenColor "#6d878d" "" . pad
                 , ppWsSep   = ""
                 , ppSep     = dzenColor "#404040" "" "|"
                 , ppLayout  = dzenColor "#e84f4f" "" . pad
                 , ppTitle   = dzenColor "#7cd1cf" "" . shorten 60 . pad
                 }

-- Layout
myLayout = gaps [(U,17)] $ onWorkspace "II" myFull $ (myLayouts)
           where
             myLayouts = myTall ||| myFull

             myTall = named "+" (spacing 7 $ Tall 1 (3/100) (1/2))
             myFull = named "*" (noBorders Full)

myKeys conf@(XConfig {XMonad.modMask = mod}) = M.fromList $
       [ ((mod,               xK_q),      kill)

       -- ========== --
       -- WM Control --
       -- ========== --

       , ((mod .|. shiftMask, xK_q),      spawn "xmonad --recompile; xmonad --restart")
       , ((mod,               xK_q),      kill)

       -- layouts
       , ((mod,               xK_space),  sendMessage NextLayout)
       , ((mod .|. shiftMask, xK_t),      sendMessage ToggleStruts)

       -- anti-layouts
       , ((mod,               xK_t),      withFocused $ windows . W.sink)

       -- focus
       , ((mod,               xK_Tab),    windows W.focusDown)
       , ((mod,               xK_j),      windows W.focusDown)
       , ((mod,               xK_k),      windows W.focusUp)
       , ((mod,               xK_m),      windows W.focusMaster)
         
       -- swapping
       , ((mod .|. shiftMask, xK_Return), windows W.swapMaster)
       , ((mod .|. shiftMask, xK_j),      windows W.swapDown)
       , ((mod .|. shiftMask, xK_k),      windows W.swapUp)

       -- master area
       , ((mod,               xK_comma),  sendMessage (IncMasterN (-1)))
       , ((mod,               xK_period), sendMessage (IncMasterN 1))

       -- resizing
       , ((mod,               xK_h),      sendMessage Shrink)
       , ((mod,               xK_l),      sendMessage Expand)

       -- ============ --
       -- Applications --
       -- ============ --

       -- launch stuff
       , ((mod,               xK_Return), spawn myTerminal)
       , ((mod,               xK_w),      spawn myMenu)
       , ((mod,               xK_b),      spawn myBrowser)
       , ((mod,               xK_e),      spawn myEditor)
       ]
       ++
       -- switch workspaces
       [((m .|. mod, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myManageHook = composeAll
               [ resource =? "bashrun2-run-dialog" --> doFloat ]