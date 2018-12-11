module Data.Connection.Action.GraphSpec (main,spec) where

import Test.Hspec
import Test.QuickCheck()
import Data.Maybe()
import Data.Connection.Base.Graph(
  G,G(G),
  V,V(V),V(NV),
  E,E(E),E(NE),
  size, (<+>), has)
import Data.Connection.Monad.GraphM
import Prelude hiding (min, max)
import Data.Maybe(fromJust)
import qualified Data.Map as Map
--import Data.Connection.Action.Graph()

main :: IO ()
main = hspec spec

g3 :: G String 
g3 = pure "3" <+> pure "4" <+> pure "5"

nodes :: G v -> [v]
nodes (G vs m) = Map.keys m

spec :: Spec
spec = do
  describe "Basic Graph functions" $ do

    it "verifies the node" $ do
      (nodes g3) `shouldBe` ["3","4","5"]

    it "gets size of a graph" $ do 
      (size g3) `shouldBe` 3

    it "checks the existence of vertex" $ do
      (g3 `has` "b") `shouldBe` True

    it "checks the existence of vertex (negative)" $ do
      (g3 `has` "x") `shouldBe` False

    -- it "merge two graphs" $ do 
    --   error "TAOTODO:"

    -- it "get all paths from A to B" $ do 
    --   error "TAOTODO:"

