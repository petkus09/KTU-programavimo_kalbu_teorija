--data Balansas2 = Balansas2 {
--      iplaukos      :: String
--    , islaidos    :: String
--    } deriving (Show)
--type Balansas = (Int,Int)
						 
--ideti :: Int -> Balansas -> Maybe Balansas
--ideti n (iplaukos, islaidos)
-- | ((iplaukos + n - islaidos) > -4000) = Just (iplaukos + n, islaidos)
-- | otherwise = Nothing

--isleisti :: Int -> Balansas -> Maybe Balansas
--isleisti n (iplaukos, islaidos)
-- | ((iplaukos - islaidos - n) > -4000) = Just (iplaukos, islaidos + n)
-- | otherwise = Nothing
 
--class Monad m where  
--    return :: a -> m a  
--    (<>=) :: m a -> (a -> m b) -> m b
	
--instance Main.Monad Maybe where  
--    return x = Just x  
--    Nothing <>= f = Nothing  
--    Just x <>= f  = f x
counter (x:xs) = 1 + counter (xs)
counter [] = 0

main = let res = f1 $ LetterCount("Testinis tekstas") >>= \x -> return $ counter x
	   in print $ res

data LetterCount a = LetterCount {f1 :: a}

instance Monad LetterCount where
    (>>=) (LetterCount x) f = f $ x
    return x = LetterCount x