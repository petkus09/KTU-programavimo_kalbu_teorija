import System.IO  
import Control.Monad
import Data.List.Split
import Data.List
import qualified Data.Map as Map

-- if (((cd[i]['y2'] - cd[i]['y1']) / ilength) != ((cd[j]['y2'] - cd[j]['y1']) / jlength)):

main = do  
        contents <- readFile "duom.in"
        print 
			. divideByTwo
			. length
			. filter (\xs -> (cosinusas $ head xs)
									/= 
							 (cosinusas $ last xs)
					)
			. filter (\xs -> (atkarposIlgis $ head xs)
									== 
							 (atkarposIlgis $ last xs)
					)
			. filter (\xs -> ((head $ head xs) == (last $ last xs)) 
							|| ((head $ head xs) == (head $ last xs)) 
							|| ((last $ head xs) == (last $ last xs)) 
							|| ((last $ head xs) == (head $ last xs)))
			. getCombinations
--			. filterIntersection
--			. nub
--			. removeDuplicates
--			. CA 
--			. map (\x -> Coordinates (head x) (head (tail x)) (last (init x)) (last x)) 
			. splitEvery 2
			. splitEvery 2 
			. map readInt 
			. words $ contents
-- alternately, main = print . map readInt . words =<< readFile "test.txt"

readInt :: String -> Int
readInt = read

isSameCoordinates :: CA -> CA
isSameCoordinates xs = xs

getCombinations :: [a] -> [[a]]
getCombinations na = do
    a <- na
    b <- na
    [[a,b]]
	
atkarposIlgis xs = sqrt( fromIntegral((((head $ head xs) - (head $ last xs))^2)+(((last $ head xs) - (last $ last xs))^2)))
cosinusas xs =(fromIntegral ((last $ head xs) + (last $ last xs)) / sqrt( fromIntegral((((head $ head xs) - (head $ last xs))^2)+(((last $ head xs) - (last $ last xs))^2))))
divideByTwo a = a `div` 2
	
--samePoints :: [a] => Bool
--samePoints a = if ((head $ head a) == (last $ last a)) ||
--				  ((head $ head a) == (head $ last a)) ||
--				  ((last $ head a) == (last $ last a)) ||
--				  ((last $ head a) == (head $ last a))
--					then True
--					else False

--samePoints (x:xs)
--	| elem (head x) xs = True
--	| elem (last x) xs = True
--	| otherwise = False


--filterIntersection :: [a] -> [a]
--filterIntersection xs = [x | x <- xs, isIntersectWithListElements x xs]
--filterIntersection xs = [x | x <- xs, (intersectionCount x xs) > 1]
--filterIntersection xs = [x | x <- xs, \x xs -> or $ map (/= []) (map (intersect x) (filter (/= x) xs))]

--intersectionCount :: a -> [a] -> b
--intersectionCount a [] = 0
--intersectionCount a (x:xs) = if ((head a) == (head x)) || (head a) == (last x) || (last a) == (head x) || (last a) == (last x)
--											then 1 + intersectionCount a x
--											else intersectionCount a x

--isIntersectWithListElements :: a -> [a] -> Bool
--isIntersectWithListElements a [] = False
--isIntersectWithListElements a (x:xs) 
--	|	(null (intersect a x) == False) && ((head a) /= (head x) && (last a) /= (last x)) = True
---	|	otherwise 			= isIntersectWithListElements a xs
--isIntersectWithListElements a (x:xs)
--	| a [] = False
--	| ((head a) == (head x) && (last a) == (last x)) =  isIntersectWithListElements a xs
--	| (head a) == (head x) = True
--	| (head a) == (last x) = True
--	| (last a) == (head x) = True
--	| (last a) == (last x)= True
--	| (intersect a x /= []) = True
--	| otherwise = isIntersectWithListElements a xs

--makePairs :: [[a]] => [[[a]]]
--makePairs [[]] = [[[]]]
--makePairs [] = []
--makePairs (x:xs) = if (intersect x xs) /= []
--						then makePairs xs
--						else 

--rmdups :: (Ord a) => [a] -> [a]
--rmdups = map head . group . sort

--removeDuplicates :: [Coordinates] -> [Coordinates]
--removeDuplicates xs = xs

--splitCoordinates :: [a] -> [a]
--splitCoordinates [] = []
--splitCoordinates (xs) = (take 4 xs) : splitCoordinates $ drop 4 xs
	
data Coordinates = Coordinates {
					  x1 :: Int
					, x2 :: Int
					, y1 :: Int
					, y2 :: Int
					} deriving (Show)
					
data CA = CA {
				cc :: [Coordinates]
			 }	deriving (Show)
			 
