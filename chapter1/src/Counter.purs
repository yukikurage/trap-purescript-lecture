module Counter where

import Prelude

import Data.Tuple.Nested ((/\))
import Jelly.Component (class Component, text, textSig)
import Jelly.Element as JE
import Jelly.Prop (on)
import Signal (modifyChannel, writeChannel)
import Signal.Hooks (newStateEq)
import Web.HTML.Event.EventTypes (click)

counter :: forall m. Component m => m Unit
counter = do
  countSig /\ countChn <- newStateEq 0

  JE.div' do
    JE.button [ on click \_ -> writeChannel countChn 0 ] do
      text "Reset"
  JE.div' do
    JE.button [ on click \_ -> modifyChannel countChn (add 1) ] do
      text "Increment"
  JE.div' do
    JE.button [ on click \_ -> modifyChannel countChn (add (-1)) ] do
      text "Decrement"
  JE.div' do
    text "Count: "
    textSig $ show <$> countSig
