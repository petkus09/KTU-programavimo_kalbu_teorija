main = let res = f3 $ LastElm([1, 2, 3, 4, 5]) >>= \x -> return $ tail x
	   in print res

data LastElm a = LastElm {f3 :: a}

instance Monad LastElm where
    (>>=) (LastElm x) f = f x
    return x = LastElm x