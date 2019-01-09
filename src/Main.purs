module Main where

import Prelude hiding (div)

import Data.Maybe (Maybe(Just, Nothing))
import Effect (Effect)
import Effect.Console (log)
import Graphics.Canvas (CanvasImageSource, drawImage, getCanvasElementById, getContext2D, tryLoadImage)

main :: Effect Unit
main = do
  log "start"
  tryLoadImage "map.png" reactImage
  log "end"

reactImage :: Maybe CanvasImageSource -> Effect Unit
reactImage Nothing = log "Could not find image."
reactImage (Just img) = do
  log "jeee"
  mcanvas <- getCanvasElementById "theCanvas"
  case mcanvas of
    Just canvas -> do
      context <- getContext2D canvas
      drawImage context img 0.0 0.0
      log "success"
    Nothing -> log "Could not find canvas"
  
