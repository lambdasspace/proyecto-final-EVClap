-- We work the funtions to manage the fuild possition on the space, using Matrixes 

module NeighborMatrix where

-- Define a Matrix as a list of lists
type Matrix a = [[a]] -- type is used to create aliases for more complex types

-- Define Neighbors as a tuple of 8 elements
type Neighbors a = (a,a,a,a,a,a,a,a)

-- Takes a matrix and a row and column, and returns the value at that position in the matrix.
getValue :: Matrix a -> Int -> Int -> a
getValue m row col = case rotate m row col of
 ((x:_):_) -> x
 x -> error "Cannot get from empty list" -- the case statement is used to match on the result of rotate m row col (Pattern match)

-- Function to get the neighbors of a cell in a matrix
getNeighbors :: Matrix a -> Int -> Int -> Neighbors a
getNeighbors m row col = (at 0 1, at 0 2, at 1 2, at 2 2, at 2 1, at 2 0, at 1 0, at 0 0)
 where at = getValue rotMat
 rotMat = rotate m (row-1) (col-1) -- list of comprehension used to create lists in a way that's similar to set notation in math

-- Function to rotate a matrix by a certain number of rows and columns
rotate :: Matrix a -> Int -> Int -> Matrix a
rotate m rows cols = rotateHorizontal (rotateVertical m cols) rows

-- Function to rotate a matrix vertically
rotateVertical :: Matrix a -> Int -> Matrix a
rotateVertical m n | n>=0 = iterate rotateVerticalOnceLeft m !! n
 | otherwise = iterate rotateVerticalOnceRight m !! (-n)

-- Function to rotate a matrix vertically to the left
rotateVerticalOnceLeft :: Matrix a -> Matrix a
rotateVerticalOnceLeft m = map rotateRowOnceLeft m

-- Function to rotate a matrix vertically to the right
rotateVerticalOnceRight :: Matrix a -> Matrix a
rotateVerticalOnceRight m = map rotateRowOnceRight m

-- Function to rotate a row to the right
rotateRowOnceRight :: [a] -> [a]
rotateRowOnceRight r = (last r:init r)

-- Function to rotate a row to the left
rotateRowOnceLeft :: [a] -> [a]
rotateRowOnceLeft [] = []
rotateRowOnceLeft (x:xs) = xs++[x]

-- Function to rotate a matrix horizontally
rotateHorizontal :: Matrix a -> Int -> Matrix a
rotateHorizontal m n | n>=0 = iterate rotateRowOnceLeft m !! n
 | otherwise = iterate rotateRowOnceRight m !! (-n)

-- Function to get a matrix of neighbors for each cell in a matrix
getNeighborMatrix :: Matrix a -> Matrix (Neighbors a)
getNeighborMatrix m = [ [ getNeighbors m y x | x<-[0..((length (m!!y))-1)] ] | y<-[0..((length m)-1)] ]

-- Function to map a function over a matrix, passing each cell and its neighbors to the function
mapWithValueNeighbors :: (a -> Neighbors a -> b) -> Matrix a -> Matrix b
mapWithValueNeighbors f m = [ [ f (m!!y!!x) (neighborMatrix!!y!!x)| x<-[0..((length (neighborMatrix!!y)-1))]]| y<-[0..((length neighborMatrix)-1)]] where neighborMatrix = getNeighborMatrix m

-- Function to map a function over a matrix, passing the neighbors of each cell to the function
mapWithNeighbors :: (Neighbors a -> b) -> Matrix a -> Matrix b
mapWithNeighbors f m = [ [ f (neighborMatrix!!y!!x)| x<-[0..((length (neighborMatrix!!y)-1))]]| y<-[0..((lengthneighborMatrix)-1)]] where neighborMatrix = getNeighborMatrix m
