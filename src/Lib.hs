module Lib
    ( runGame
    ) where

import Brick

ui :: Widget ()
ui = str "Hello, world!"

runGame :: IO ()
runGame = simpleMain ui
