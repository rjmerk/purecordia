module Main where
import Prelude hiding (div)

import Data.Maybe (Maybe(..), maybe)
import Effect (Effect)
import Effect.Console (log)
import Graphics.Canvas (CanvasImageSource, Context2D(..), TextAlign(..), drawImage, fillRect, fillText, getCanvasElementById, getContext2D, measureText, rect, rotate, setFillStyle, setFont, setStrokeStyle, setTextAlign, translate, tryLoadImage)

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
      drawTextBox context "Welcome to Purecordia!"
    Nothing -> log "Could not find canvas"


drawTextBox :: Context2D -> String -> Effect Unit
drawTextBox context message = do
  translate context {translateX:800.0, translateY:500.0}
  rotate context (-0.1)
  setFont context "50px Georgia"
  metrics <- measureText context message
  let x = -0.5 * metrics.width
  let y = -50.0
  fillRect context {x:x, y:y, width:metrics.width, height:50.0 }
  setTextAlign context AlignCenter
  setFillStyle context "white"
  fillText context message 0.0 0.0
