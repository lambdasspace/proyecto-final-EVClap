-- Main driver of the fluid simulation program. It coordinates the other parts of the program
-- reads the input, runs the simulation, and writes the output

import System.Environment
import Data.Fixed
import Fluid
import FromFile
import Settings
import Simulation
import Svg
import Types

-- Define the input file
inputFile :: String
inputFile = "Tests/inputHole.txt"

-- Define the output file
outputFile :: String
outputFile = "Tests/outputHole.svg"

-- Main function
main = do
 -- Read the input file
 file <- readFile inputFile
 
 -- Convert the file content to a state
 let state = fromString file
 
 -- Simulate the fluid dynamics
 let res = simulate state water wall timeSteps
 
 -- Draw the fluid
 let out = drawFluid cellSize (deltaTime * fromIntegral(timeSteps)) res
 
 -- Write the output to a file
 writeFile outputFile $ (surroundWithHeader out)
