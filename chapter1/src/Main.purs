module Main where

import Prelude

import Counter (counter)
import Data.Foldable (traverse_)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Jelly.Aff (awaitBody)
import Jelly.Component (class Component, text)
import Jelly.Element as JE
import Jelly.Hydrate (mount)
import Signal.Hooks (runHooks_)

main :: Effect Unit
main = launchAff_ do
  bm <- awaitBody
  liftEffect $ runHooks_ $ traverse_ (mount root) bm

root :: forall m. Component m => m Unit
root = do
  JE.div' do
    text "Hello World"
  counter
