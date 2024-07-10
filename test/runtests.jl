using BentTool, StructuralUnits
using Test

# Test Utilities
@testset "Utils:        " begin include("Utils.jl") end
@testset "Dimensions:   " begin include("Dimensions.jl") end
@testset "Conversions:  " begin include("Conversions.jl") end

# Test Structs
@testset "Girder:       " begin include("Types/Girder.jl") end
@testset "Rail:         " begin include("Types/Slab.jl") end
