-- Types definition and data types definition for the fluid simulation, and provide a function for accessing elements of an EightTupel

module Types where

-- Define a Color as a tuple of three Ints
type Color = (Int, Int, Int)

-- Define an EightTupel as a tuple of eight elements
type EightTupel a = (a,a,a,a,a,a,a,a)

-- Define a Vector as an EightTupel of Floats
type Vector = EightTupel Float

-- Define a Fluid data type with a Color and a Float
data Fluid = Fluid Color Float deriving Show 

-- Define a Wall data type with a Color
data Wall = Wall Color deriving Show

-- Define a GridElem data type that can be either a FluidElem with a Vector or a WallElem
data GridElem = FluidElem Vector | WallElem deriving Show

-- Define a FluidMatrix as a list of lists of GridElem
type FluidMatrix = [[GridElem]]

-- Define a FluidMatrixTime data type with a list of FluidMatrix, a Fluid, and a Wall
data FluidMatrixTime f w = FluidMatrixTime [FluidMatrix] f w deriving Show

-- Function to get a neighbor from an EightTupel given an index
getNeighbor :: EightTupel a -> Int -> a
getNeighbor (n0, n1, n2, n3, n4, n5, n6, n7) a -- Pattern match
 | mod a 8 == 0 = n0
 | mod a 8 == 1 = n1
 | mod a 8 == 2 = n2
 | mod a 8 == 3 = n3
 | mod a 8 == 4 = n4
 | mod a 8 == 5 = n5
 | mod a 8 == 6 = n6
 | mod a 8 == 7 = n7
