module Main where

import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Hedwig (Html, mount, text)
import Hedwig.Element (div, img)
import Hedwig.Property (src)
import Prelude hiding (div)

type ModelWithEffects = Tuple Model (Array (Aff Msg))

data Msg
  = DoNothing

type Model = {}

init :: Model
init = {}

update :: Model -> Msg -> ModelWithEffects
update model msg = Tuple model []

view :: Model -> Html Msg
view model =
  img [src "map.png"] []


main :: Effect Unit
main = do
  mount "purescript-app" {
    init: Tuple init [initAction],
    update: update,
    view: view
  }
    where
  initAction = pure DoNothing
