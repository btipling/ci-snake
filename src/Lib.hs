module Lib
    ( runGame
    ) where

import qualified Brick.Types as T
import qualified Brick.Main as M
import qualified Brick.Widgets.Core as W
import qualified Brick as M
import qualified Graphics.Vty as V
import Control.Monad (void)

drawUI :: St -> [T.Widget Name]
drawUI s = [W.str $ "Hello, world! Count:" ++ show s]

newtype St = St Int deriving Show
type Name = ()

handleEvent :: T.BrickEvent Name e -> T.EventM Name St ()
handleEvent _ = return ()

noopAttr :: M.AttrName
noopAttr = M.attrName "attr"

app :: M.App St e Name
app = M.App {M.appDraw = drawUI
    , M.appChooseCursor = M.neverShowCursor
    , M.appHandleEvent = handleEvent
    , M.appAttrMap = const $ M.attrMap  V.defAttr [(noopAttr, M.fg V.cyan)]
    , M.appStartEvent = return ()
    }

runGame :: IO ()
runGame = do
    let builder = V.mkVty V.defaultConfig
    initialVty <- builder
    void $ M.customMain initialVty builder Nothing app (St 0)
