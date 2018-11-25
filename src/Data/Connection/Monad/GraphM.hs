module Data.Connection.Monad.GraphM where

import Data.Connection.Base.Graph(Gr, Node, Link, mapGr, unit)

-- Graph is mappable
instance Functor Gr where
  fmap = mapGr

instance Applicative Gr where
  pure = unit

-- Graph is flatmappable
instance Monad Gr where
  (>>=) = error "TAOTODO:"