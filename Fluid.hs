-- Creates needed functions to getting values for the fluid performance

module Fluid where
import Types
import Settings

-- Function to get the viscosity of a Fluid
getViscosity :: Fluid -> Float
getViscosity (Fluid _ f) = f

-- Function to get the color of a Fluid
getFluidColor :: Fluid -> Color
getFluidColor (Fluid c _) = c

-- Function to get the color of a Wall
getWallColor :: Wall -> Color
getWallColor (Wall c) = c

-- Function to get the pressure of a GridElem
getPressure :: GridElem -> Float
getPressure (FluidElem (n0, n1, n2, n3, n4, n5, n6, n7)) = (n0+n1+n2+n3+n4+n5+n6+n7)/(fromIntegral 8)
getPressure (WallElem) = maxPressure
