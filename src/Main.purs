module Main where
import Data.Maybe (Maybe(..), maybe)
import Effect (Effect)
import Effect.Console (log)
import Graphics.Canvas (CanvasImageSource, drawImage, getCanvasElementById,
                        getContext2D, tryLoadImage)
import Prelude hiding (div)

main :: Effect Unit
main = do
  tryLoadImage
    "map.png"
    (maybe (log "Could not find canvas") drawCanvas)


drawCanvas :: CanvasImageSource -> Effect Unit
drawCanvas img = do
  mcanvas <- getCanvasElementById "theCanvas"
  case mcanvas of
    Just canvas -> do
      context <- getContext2D canvas
      drawImage context img 0.0 0.0
    Nothing -> log "Could not find canvas"
