--import qualified Data.Char as CC
--type Simboliai = (String, String)

--pridetiSim1 :: Char -> Simboliai -> Maybe Simboliai
--pridetiSim1 n (sim1, sim2)
--	| CC.isLetter n = Just (n : sim1, sim2)
--	| otherwise = Nothing

--pridetiSim2 :: Char -> Simboliai -> Maybe Simboliai
--pridetiSim2 n (sim1, sim2)
--	| CC.isLetter n = Just (sim1, n : sim2)
--	| otherwise = Nothing

--class Monad m where  
--    return :: a -> m a  
--    (>>=) :: m a -> (a -> m b) -> m b

--instance Main.Monad Maybe where
--	return x = Just x
--	Nothing >>= f = Nothing
--	Just x >>= f = f x

main = let res = f2 $ SqrtRound(27) >>= \x -> return $ round $ sqrt x
	   in print $ res

data SqrtRound a = SqrtRound {f2 :: a}

instance Monad SqrtRound where
	(>>=) (SqrtRound []) f = []
    (>>=) (SqrtRound x) f = f $ x
    return x = SqrtRound x