using BentTool, StructuralUnits
using Test

@testset "Utils:        " begin include("Utils.jl") end
@testset "Dimensions:   " begin include("Dimensions.jl") end
@testset "Rail:         " begin include("Types/Slab.jl") end
