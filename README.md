# **FINAL PROYECT**
## Liquid simulator in closed and controlled spaces with `Haskell`

Based in the Lattice Boltzmann Method (LBM)

### *PROGRAMACIÓN DECLARATIVA 2023-2*      
- Emilio Velázquez Calderón

***IF YOU ONLY WANT TO SEE THE SIMULATION EXAMPLES, OPEN ONE `.svg` FILE IN THE `Examples` DIRECTORY***

## How to use it
- Download the repository and modify the `Main.hs` doc, changing `inputFile` to a directory where you are going to save **a valid file** to read, 
and changing `outupFile` for a directory where do you want to save the output `.svg`.

- In the terminal, load the `Main.hs` file with `:l Main.hs`. Once it's loaded, run it with `main`.
- Now you may enjoy the simulation :D
- Optionally, modify the `Settings.hs` file 

## Valid input files
The input file is layed out in a grid. Every element in the grid is `1`, `0` or `w`. 
- `1` means the fluid is flowing away from this point. 
- `0` means the fluid is not moving at this point. 
- `w` represents a wall. 

Valid examples files can be viewed as `.txt` docs in the `Examples` file.

## Settings
Modifying `Settings.hs` file. The following options are described:

- `water`: Fluid with attribute color in RGB as (Float, Float, Float) (from 0-255) and viscosity as Float.
- `wall`: Wall with attribute color in RGB.
- `cellSize`: The size of each cell as (Float, Float) in the resulting animation.
- `maxPressure`: The pressure as Float that is displayed with full opacity. Only usefull in the resulting animation. Lowering this will make you see more detail in the end but less in the beginning.
- `deltaTime`: The time in the animation between each frame.
- `timesteps`: How much frames the animation will have as Int.


