-- We declare the settings for the Simulation.hs initial values and execution, water properties 

module Settings where
import Types

-- Define water as a Fluid with a blue color and a viscosity of 5
water :: Fluid
water = Fluid (0,0,255) 5

-- Define wall as a Wall with a black color
wall :: Wall
wall = Wall (0,0,0)

-- Define the size of each cell in the simulation
cellSize :: (Float, Float)
cellSize = (10,10)

-- Define the maximum pressure for the simulation
maxPressure :: Float
maxPressure = 0.3

-- Define the time step for the simulation
deltaTime :: Float
deltaTime = 0.5

-- Define the number of time steps for the simulation
timeSteps :: Int
timeSteps = 20
